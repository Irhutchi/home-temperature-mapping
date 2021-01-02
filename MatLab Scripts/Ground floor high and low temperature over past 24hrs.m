% Read temperature data from a ThingSpeak channel over the past 24 hours 
% to calculate the high and low temperatures and write to another channel. 
   
% Channel 1243609 contains data from two internal temp sensors, located 
% on the ground floor and first floor. The data is collected once every 5 minutes.
% Field 1 and 2 contains temperature data. 
   
% Channel ID to read data from 
readChannelID = 1243609; 
% Temperature Field ID 
FieldID = 1; 
% Channel Read API Key    
readAPIKey = '************'; 
% Channel ID to write data to: 
writeChannelID = 1243609; 
% Enter the Write API Key between the '' below: 
writeAPIKey = '************'; 
   
% Read temperature data for the last 24 hours from two internal temp sensors 
[TempC,timeStamp] = thingSpeakRead(readChannelID,'Fields',FieldID, ...
                                                'numDays',1,'ReadKey',readAPIKey); 
   
% Calculate the maximum and minimum temperatures 
[maxTempC,maxTempIndex] = max(TempC); 
[minTempC,minTempIndex] = min(TempC); 
   
% Select the timestamps at which the maximum and minimum temperatures were measured
timeMaxTemp = timeStamp(maxTempIndex); 
timeMinTemp = timeStamp(minTempIndex); 
   
display(maxTempC,'Maximum Temperature for the past 24 hours is'); 
display(minTempC,'Minimum Temperature for the past 24 hours is'); 
   
% Store the maximum temperature, write it to specified channel 
%thingSpeakWrite(writeChannelID,minTempC,'timeStamp',timeMinTemp,'WriteKey',writeAPIKey);