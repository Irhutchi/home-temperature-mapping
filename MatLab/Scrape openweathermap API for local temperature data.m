% URL of the page to read data from
url = 'http://api.openweathermap.org/data/2.5/weather?lat=52.29&lon=-7.25&appid=***API_KEY***a&units=metric';
% Target string to search in the API
targetString = 'temp';

% Channel ID to write data to:
writeChannelID = 1243609;
%Write API Key between the '' below:
writeAPIKey = 'Q************F';

%% Scrape the webpage %%
data = urlfilter(url, targetString);
display(data);

%% Analyze Data %%
% Add code in this section to analyze data and store the result in the
% analyzedData variable.
analyzedData = data;

%% Write Data %%
thingSpeakWrite(writeChannelID, {analyzedData,'temp'}, 'WriteKey', writeAPIKey);


% URL of the page to read data from
url = 'http://api.openweathermap.org/data/2.5/weather?lat=52.29&lon=-7.25&appid=***API_KEY***&units=metric';
% Target string to search in the API
targetString = 'temp';

% Channel ID to write data to:
writeChannelID = 1275713;
%Write API Key between the '' below:
writeAPIKey = '7************2';

%% Scrape the webpage %%
data = urlfilter(url, targetString);
display(data);

%% Analyze Data %%
% Add code in this section to analyze data and store the result in the
% analyzedData variable.
analyzedData = data;

%% Write Data %%
thingSpeakWrite(writeChannelID, {analyzedData,'temp'}, 'WriteKey', writeAPIKey);
