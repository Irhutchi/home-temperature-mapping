%  MATLAB code for visualizing data from a channel as a 2D line
% plot using PLOT function.

% Channel ID to read data from
readChannelID = 1275713;
% Field ID to read data from
fieldID1 = 1;

% Channel Read API Key 
readAPIKey = '*************';

%% Read Data %%
[data, time] = thingSpeakRead(readChannelID, 'Field', fieldID1, 'NumPoints', 140, 'ReadKey', readAPIKey);

%% Visualize Data %%

plot(time, data);
colororder({'[0.5 0.1 0.8]'})
xlabel('Time');
ylabel('Temperature C');
title('Outside Temperature Last 12hrs ');