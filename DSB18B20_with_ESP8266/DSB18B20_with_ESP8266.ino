#include <OneWire.h>				  // Import OneWire library
#include <DallasTemperature.h>  // DS18B20 temperature library
#include <ESP8266WiFi.h>        // To  create a webServeer declare esp8266 library
#define DS18B20 2          	  // DS18B20 is connected to GPIO Pin 2


String apiKey = "Q**************F"; 	// Write API key from ThingSpeak
const char* ssid =  "**********";     	// Enter your WiFi Network's SSID
const char* pass =  "***********"; 		// Enter your WiFi Network's Password

const char* server = "api.thingspeak.com";
float temp;
 
OneWire ourWire(DS18B20);
DallasTemperature sensor(&ourWire);  // Setup a oneWire instance to communicate with temp sensor 
WiFiClient client;
 
void setup() 
{
       Serial.begin(115200); 		// Start serial port, baud rate 115200 
       delay(500);					// delay 500ms 
       sensor.begin();				// start up the library
 
       Serial.print("Connecting to: ");
       Serial.println(ssid);
 
 
       WiFi.begin(ssid, pass);
 
      while (WiFi.status() != WL_CONNECTED) 
     {
            delay(100);
            Serial.print("...");
     }
      Serial.println("");
      Serial.println("***WiFi connected***");
 
}
 
void loop() 
{
  
      sensor.requestTemperatures();
      temp = sensor.getTempCByIndex(0);
 
      if (client.connect(server,80))   //   "184.106.153.149" or api.thingspeak.com
      {  
       String sendData = apiKey+"&field3="+String(temp)+"\r\n\r\n"; 
       
       //Serial.println(sendData);

       client.print("POST /update HTTP/1.1\n");
       client.print("Host: api.thingspeak.com\n");
       client.print("Connection: close\n");
       client.print("X-THINGSPEAKAPIKEY: "+apiKey+"\n");
       client.print("Content-Type: application/x-www-form-urlencoded\n");
       client.print("Content-Length: ");
       client.print(sendData.length());
       client.print("\n\n");
       client.print(sendData);

       Serial.print("Temperature: ");
       Serial.print(temp);
       Serial.println("deg C. Connecting to Thingspeak..");
      }
      
      client.stop();

      Serial.println("Sending....");
  
 delay(300000);
}
