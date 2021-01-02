% Script to plot both field 1 and 2 together and visualize
% the data in a single plot using the MATLAB Scatter function.

% Channel ID to read data from
readChannelID = 1243609;
readAPIKey = '*************';

fieldID1 = 1; % Ground Floor Temp
fieldID2 = 2; % First Floor Temp

readChannelID2 = 1275713;
readAPIKey2 = '************';
fieldID3 = 1;

% Read The Data wanted to plot
[data1,time1] = thingSpeakRead(readChannelID,'Field',fieldID1,'NumPoints',300, 'ReadKey', readAPIKey);
[data2,time2] = thingSpeakRead(readChannelID,'Field',fieldID2,'NumPoints',300, 'ReadKey', readAPIKey);
[data3,time3] = thingSpeakRead(readChannelID2,'Field',fieldID3,'NumPoints',150, 'ReadKey', readAPIKey2);

% Here data1 & data2 take downstairs temp and upstairs temp, time1 & time2 
% take the day & hour you sent the data to ThingSpeak.

x1 = time1;
x2 = time2;
x3 = time3;
y1 = data1;
y2 = data2;
y3 = data3;
% create first scatter plot (Ground Floor Temp)
scatter(x1,y1, 'filled')
% Retain plots on current axes so that new plots 
% added to the axes do not delete existing plots.
hold on
% create sencond scatter plot (first Floor Temp)
scatter(x2, y2, 'filled')
scatter(x3, y3, 'filled')
grid on
% hold off sets the hold state to off so that new plots 
% added to the axes clear existing plots and reset all axes properties.
hold off

% using RGB Triplet to customise plot colour 
colororder({'[1 0.8 0]','[1 0 0]', '[0.5 0.1 0.8]'})
title('Gnd Floor vs 1st Floor vs Outside Plot');
legend({'Field1 Temp','Field2 Temp', 'Outside Temp'});
legend('Location','west');
xlabel('Date/Time');
ylabel('Temp (Celcius)');