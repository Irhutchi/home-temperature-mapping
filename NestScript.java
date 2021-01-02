// CREDIT TO BEEZLY and Michael-pesce for a lot of this, I just adapted it suit my needs.
// https://gist.github.com/michael-pesce
//function to handle trigger request
function runDataCollection() {
  //this function is called by a trigger 
  Logger.log("Starting Data Collection")
  // fetch calls your webapp, which via Google magic calls the doGet() function which is defined below
  var response = UrlFetchApp.fetch("https://script.google.com/macros/s/AKfycbwin-k4_8o69hWAtBfYunE7_CrbCwgXFbK3bmLZ3qj-TM0BXPo/exec");
}

function performLogin(email, password) {
  var payload = {
    "username" : email,
    "password" : password
  };
  
  var options = {
    "method"  : "post",
    "payload" : payload
  };
 
  var response = JSON.parse(UrlFetchApp.fetch('https://home.nest.com/user/login', options).getContentText());
  if ('error' in response) {
    throw "Invalid login credentials";
  }
  
  return response
}
 
function doGet() {
  Logger.log("Running web function...")
  
  //login variables: 
  var login_auth = performLogin('ianhutch@mail.com','*************');
  
  //Additional data passed to the API to help the server unbderstand the request type  
  var headers = {
    "Authorization" : 'Basic '+login_auth['access_token'],
    "X-nl-user-id"  : login_auth['userid'],
    "X-nl-protocol-version" : '1',
    'Accept-Language': 'en-uk',
    'Connection'    : 'keep-alive',
    'Accept'        : '*/*',
  };
  
  var options = {
    'headers' : headers
  };
  
  var request=UrlFetchApp.fetch(login_auth['urls']['transport_url']+'/v2/mobile/user.'+login_auth['userid'], options);
  var result=JSON.parse(request.getContentText());
 
  var structure_id = result['user'][login_auth['userid']]['structures'][0].split('.')[1]
  
  //Retrieve Device id for the thermostat - available from NEST Dashboard
  var device_id = result['structure'][structure_id]['devices'][0].split('.')[1]
  var nestDevice = '0***********S'

  //Nest is located on the ground floor of the house
  var d_current_temp = result["shared"][nestDevice]["current_temperature"];
  var d_target_temp_low  = result["shared"][nestDevice]["target_temperature_low"];
  var d_target_temp_high  = result["shared"][nestDevice]["target_temperature_high"];  
  var d_target_range = d_target_temp_low.toFixed(1) + "-" + d_target_temp_high.toFixed(1);
  var d_humidity     = result["device"][nestDevice]["current_humidity"];
  var d_auto_away    = result["shared"][nestDevice]["auto_away"];
  var d_heater_state = result["shared"][nestDevice]["heater_state"];

  //get outside data
  var wxrequest=UrlFetchApp.fetch('http://api.openweathermap.org/data/2.5/weather?q=Mooncoin,IE&APPID=d424e125e6dc5d7cdee4d09fc99a5f7a');
  var wxresult=JSON.parse(wxrequest.getContentText());
  var outside_temp = (wxresult["main"]["temp"] - 273);
  var outside_humidity = (wxresult["main"]["humidity"]);

  var time = new Date();
  
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  //Google Sheet where this data will be logged,
  // The Sheet id is taken from the sheet URL:
  var ss = SpreadsheetApp.openById("1hq8AQLiOffDaSQa4DaUyFmHnocOB0N60hfIjcu2yj0A");
  //This puts the data in the first tab of the ggole sheet. Can include more device data to each tab if required
  var sheet = ss.getSheets()[0];
 
  // Write data to the Google Sheet
  // For readability, make sure the sheet has the following column headers:
  // Date/Time |	Downstairs Temp |	Downstairs Target Range |	Downstairs Humidity  |	Outside Temp |	Outside Humidity |	Downstairs AutoAway |	Downstairs Heater State 
  sheet.appendRow([time, d_current_temp, d_target_range, d_humidity,outside_temp, outside_humidity, d_auto_away, u_auto_away, d_heater_state ]);
  return 'success' 
}