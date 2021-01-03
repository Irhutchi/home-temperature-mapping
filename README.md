# IoT-home-temperature-monitoring-project
A repository created to store files associated with this IoT project <br>
This form part of my submission for Computer Systems Assignment - WIT

## Description

This project uploads DS18b20 temperature sensor data to ThingSpeak from ESP8266-01 modules programmed using aduino IDE.
Three DS18B20 sensors in total, two indisde the building and one outside. The temperature readings are displayed in Celsius and 
update every 5minutes.
Temperature data was scraped from openweathermap.org using MATLAB code for reading numeric data (temperature) and saved to ThingSpeak.
All Temperature readings provide data relating to internal and external temperatures around my home. 
ThingSpeak and MATLAB are primarily used to acquire, analyse, and visualise IoT sensor data. <br>

![](https://github.com/Irhutchi/home-temperature-mapping/blob/main/imgs/ThingSpeak%20Dashoard.jpg)

Google add-on; Apihpheny.io was used to import worldweatheronline.com API data into Google sheets. Using HTTP GET request with the API URL,
it is possible to populate the Google sheet with of historical data in either JSON or CSV format. 
This request can be repeated by setting up a scheduled request frequency from every hour to a month. 

```
EXAMPLE: 
http://api.worldweatheronline.com/premium/v1/past-weather.ashx?key=*********&q=Mooncoin&format=json&date=2020-12-01&enddate=2020-12-26&includelocation=-7.25, 52.29&tp=tp=1
``` 
Efforts were made to get local weather data from pinging my NEST Thermostat and saving the data to google speadsheets. It is still a
work in progress.


## Initial Hardware Requirements

* 3x ESP8266 WiFi Modules
* 3x DS18b20 Temp Sensors
* 3x Solderless breadboards
* 3x 100uf Capacitors
* 3x 10k Resistors
* Jumper wires
* USB to UART Bridge controller
* 3v Power supply

### Dependencies

* The ESP8266 community created an add-on for the Arduino IDE that allows you to program the ESP8266 using the Arduino IDE and its programming language.
Make sure you have the latest version of the Arduino IDE installed in your computer. If you don’t, uninstall it and install it again. Otherwise, it may not work.
* Setup ThingSpeak Account:
    * Sign up for new User Account – https://thingspeak.com/users/sign_up
    * Create a new Channel by selecting Channels, My Channels, and then New Channel
    * Note the Write API Key and Channel ID

### Installing ESP8266 Add-on in Arduino IDE
To install the ESP8266 board in your Arduino IDE, follow these next instructions:
  1. In your Arduino IDE, go to File> Preferences.
  2. Enter http://arduino.esp8266.com/stable/package_esp8266com_index.json into the “Additional Boards Manager URLs” field as shown in the figure below. Then, click the “OK” button:
  3. Open the Boards Manager. Go to Tools > Board > Boards Manager…
  4. Search for ESP8266 and press install button for the “ESP8266 by ESP8266 Community“.
  5. That’s it. It should be installed after a few seconds.
* How/where to download your program
* Any modifications needed to be made to files/folders

### Uploading a Sketch to the ESP-01
The following table shows the connections you need to make between the ESP8266 and the USB to TTL programmer.

![](https://github.com/Irhutchi/home-temperature-mapping/blob/main/imgs/Flash-Circuit-ESP9266-01.jpg)

| ESP8266       | USB to UART     
| :------------- | :----------: | 
| RX | TX    
| TX   | RX 
| CH_PD   | GND
| GPIO 0   | GND
| VCC   | 3.3v
| GND   | GND

## Programming Languages Used
* **C** - The ESP-01 modules are programmed using Arduino IDE. An Arduino program which is written using C language programming is usually called a sketch.
* **MATLAB Code** - Some of the visualisation and analysis was sourced from existing code examples available on ThingSpeak Platform.
Each one was modified to suits my needs for this project and accomplish tasks such as plotting, Reactions, ThingHTTP and Web API request.
* **JavaScript** - Used in creating the NESTScript (WIP).


## Iot Platform Used
* [ThingSpeak](https://thingspeak.com) - ThingSpeak provides instant visualizations of data posted by both by Dallas Temperature sensors and
public webAPI data to ThingSpeak. With the ability to execute MATLAB® code in ThingSpeak you can perform online analysis and processing of the data as it comes in. 
ThingSpeak is often used for prototyping and proof of concept IoT systems that require analytics.

![High and Low Output](https://github.com/Irhutchi/home-temperature-mapping/blob/main/imgs/High%20%26%20Low%20Temperature%20past%2024hrs%20img.JPG)

* [Thingview App](https://play.google.com/store/apps/details?id=com.cinetica_tech.thingview.full&hl=en_US&gl=US) is available for Google Play and apple App store. It is easy to setup and enables to view realtime data and visualise your
ThingSpeak Channels. 

* [ThingTweet App](https://uk.mathworks.com/help/thingspeak/thingtweet-app.html) updates Twitter status when either the inside or outside temperature drops below a certain range specified in the React.

![](https://github.com/Irhutchi/home-temperature-mapping/blob/main/imgs/Twitter_Feed.png)


## Author

**Ian Hutchinson**  
20048122@mail.wit.ie


## License

This project is licensed under the MIT  License - see the LICENSE.md file for details

## Credits and Resources
MATLAB for Data Processing and Visualization
Inspiration, code snippets, etc.
* [Youtube Clip - ESP8266](https://www.youtube.com/watch?v=P8Z-ZHwNeNI&t=254s&ab_channel=electronicGURU)
* [ESP8266 Getting Started](https://lastminuteengineers.com/multiple-ds18b20-esp8266-nodemcu-tutorial/)
* [DS18b20 Arduino Library](https://github.com/milesburton/Arduino-Temperature-Control-Library)
* [Desktop Widget](https://github.com/PawelTwardawa/ThingspeakDesktopTemperatureWidget)
* [Scraping data from the web](https://blogs.mathworks.com/pick/2014/01/17/scraping-data-from-the-web/?s_tid=srchtitle)
* [MATLAB for Data Processing and Visualization](https://matlabacademy.mathworks.com/)
* [Read Channel to Trigger Email](https://blogs.mathworks.com/iot/2020/01/10/send-email-alerts-from-thingspeak/?s_tid=srchtitle)
* [Calculate High and Low Temperatures](https://uk.mathworks.com/help/thingspeak/calculate-high-and-low-temperatures.html?searchHighlight=Calculate%20high%20and%20low%20temperatures%20&s_tid=srchtitle)
* [Mapping Temp with cheap Sensors](https://projects-raspberry.com/mapping-household-temperature-flow-with-cheap-sensors/)
* [Nest Thermostatm Data Logger](https://www.instructables.com/Nest-thermostat-Data-Logger/)
