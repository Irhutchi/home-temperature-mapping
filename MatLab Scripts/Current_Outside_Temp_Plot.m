% Plot URL: https://thingspeak.com/apps/matlab_visualizations/384400

% Plot of outside Temperature with relevant channel variables.
;
% Channel ID to read data from:
readChannelID = 1275713;
% Field ID to read data from:
fieldID1 = 1;

% Channel Read API Key 
readAPIKey = '*****************';

%% Read Data %%
[data, time] = thingSpeakRead(readChannelID, 'Field', fieldID1, 'NumPoints', 140, 'ReadKey', readAPIKey);

%% Visualize Data %%
plot(time, data);
xlabel('Time');
ylabel('Temperature C');
title('Outside Temperature Last 12hrs ');
