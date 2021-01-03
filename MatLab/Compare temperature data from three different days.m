% Read temperature data from a ThingSpeak channel for three seperate days 
% and visualize the data in a single plot using the PLOT function. 

% Local weather data for Mooncoin, Kilkenny
% The data is collected once 5 minutes. 
% Field 2 is used an an example contains temperature data. 

% Channel ID to read data from 
readChannelID = 1243609; 
% Temperature Field ID 
myFieldID = 2; 
% One day date range
oneDay = [datetime('yesterday') datetime('today')];

% Channel Read API Key 
readAPIKey = 'V************C'; 

% Read Temperature Data from three different fields
temperatureDay1 = thingSpeakRead(readChannelID,'Fields',myFieldID, ...
                                 'dateRange', oneDay, 'ReadKey',readAPIKey); 
temperatureDay2 = thingSpeakRead(readChannelID,'Fields',myFieldID, ...
                                 'dateRange',oneDay-days(1),'ReadKey',readAPIKey); 
temperatureDay3 = thingSpeakRead(readChannelID,'Fields',myFieldID, ...
                                'dateRange', oneDay-days(2),'ReadKey',readAPIKey); 

% Create array of durations 
myTimes1 = minutes(1:length(temperatureDay1));
myTimes2 = minutes(1:length(temperatureDay2));
myTimes3 = minutes(1:length(temperatureDay3));

% Visualize the data
plot(myTimes1,temperatureDay1, myTimes2,temperatureDay2, myTimes3, temperatureDay3);
legend({'Day1','Day2','Day3'});
xlabel('Minutes');
ylabel('Temperature C');
title('3-Day Temperature Comparison');