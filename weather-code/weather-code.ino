#include <Wire.h>
#include <Ticker.h>
#include "ssd1306_i2c.h"
#include "icons.h"


#include <ESP8266WiFi.h>
#include "WeatherClient.h"

#define SDA 14
#define SCL 12
//#define RST 2

#define I2C 0x3D

#define WIFISSID "???"
#define PASSWORD "???"

#define FORECASTAPIKEY "???"
#define DOMAINNAME "www.???.com"

// London
#define LATITUDE 51.5072
#define LONGITUDE 0.1275

#define TMP100_TEMP_OFFSET -1


#define CELCSIUS true


// Set the TMP Address and Resolution here
int tmpAddress = B1001010;
int ResolutionBits = 10;

// Initialize the oled display for address 0x3c
// 0x3D is the adafruit address....
// sda-pin=14 and sdc-pin=12
SSD1306 display(I2C, SDA, SCL);
WeatherClient weather;
Ticker ticker;

void drawFrame0(int x, int y) ;
void drawFrame1(int x, int y) ;
void drawFrame2(int x, int y) ;
void drawFrame3(int x, int y) ;
void drawFrame4(int x, int y) ;
void drawSpinner(int count, int active) ;
void setReadyForWeatherUpdate() ;
void SetResolution();

// this array keeps function pointers to all frames
// frames are the single views that slide from right to left
void (*frameCallbacks[])(int x, int y) = {drawFrame0, drawFrame1, drawFrame2, drawFrame3, drawFrame4};

// how many frames are there?
int frameCount = 5;


// on frame is currently displayed
int currentFrame = 0;

// your network SSID (name)
char ssid[] = WIFISSID;

// your network password
char pass[] = PASSWORD;

// Go to forecast.io and register for an API KEY
String forecastApiKey = FORECASTAPIKEY;

// website domain name
String webDomain = DOMAINNAME;

// Coordinates of the place you want
// weather information for
double latitude = LATITUDE;
double longitude = LONGITUDE;

// flag changed in the ticker function every 10 minutes
bool readyForWeatherUpdate = true;

void setup() {
  delay(500);
  //ESP.wdtDisable();

  // initialize display
  display.init();
  display.flipScreenVertically();
  // set the drawing functions
  display.setFrameCallbacks(frameCount, frameCallbacks);
  // how many ticks does a slide of frame take?
  display.setFrameTransitionTicks(10);

  display.clear();
  display.display();

  Serial.begin(115200);
  delay(500);

  Serial.println();
  Serial.println();
  // We start by connecting to a WiFi network
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, pass);

  int counter = 0;
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");

    display.clear();
    display.drawXbm(34, 10, 60, 36, WiFi_Logo_bits);
    display.setColor(INVERSE);
    display.fillRect(10, 10, 108, 44);
    display.setColor(WHITE);
    drawSpinner(3, counter % 3);
    display.display();

    counter++;
  }
  Serial.println("");

  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  // update the weather information every 10 mintues only
  // forecast.io only allows 1000 calls per day
  ticker.attach(60 * 10, setReadyForWeatherUpdate);

  //ESP.wdtEnable();

  Wire.begin(14,12);        // join i2c bus for temp sensor
  SetResolution();
}

void loop() {

  if (readyForWeatherUpdate && display.getFrameState() == display.FRAME_STATE_FIX) {
    readyForWeatherUpdate = false;
    weather.setUnits( ((CELCSIUS) ? "uk" : "us") );
    weather.updateWeatherData(webDomain, forecastApiKey, latitude, longitude);
  }

  display.clear();
  display.nextFrameTick();
  display.display();
}

void setReadyForWeatherUpdate() {
  readyForWeatherUpdate = true;
}

const char* getIconFromString(String icon) {
  //"clear-day, clear-night, rain, snow, sleet, wind, fog, cloudy, partly-cloudy-day, or partly-cloudy-night"
  if (icon == "clear-day") {
    return clear_day_bits;
  } else if (icon == "clear-night") {
    return clear_night_bits;
  } else if (icon == "rain") {
    return rain_bits;
  } else if (icon == "snow") {
    return snow_bits;
  } else if (icon == "sleet") {
    return sleet_bits;
  } else if (icon == "wind") {
    return wind_bits;
  } else if (icon == "fog") {
    return fog_bits;
  } else if (icon == "cloudy") {
    return cloudy_bits;
  } else if (icon == "partly-cloudy-day") {
    return partly_cloudy_day_bits;
  } else if (icon == "partly-cloudy-night") {
    return partly_cloudy_night_bits;
  }
  return cloudy_bits;
}

float getTemperature(){ // TMP100
  Wire.requestFrom(tmpAddress,2);
  byte MSB = Wire.read();
  byte LSB = Wire.read();
 
  int TemperatureSum = ((MSB << 8) | LSB) >> 4;
 
  float celsius = TemperatureSum*0.0625;
  float fahrenheit = (1.8 * celsius) + 32;
 
  Serial.print("Celsius: ");
  Serial.println(celsius);
  Serial.print("Fahrenheit: ");
  Serial.println(fahrenheit);

  return ((CELCSIUS) ? celsius : fahrenheit);
}
 
void SetResolution(){ // TMP100 resolution
  if (ResolutionBits < 9 || ResolutionBits > 12) exit;
  Wire.beginTransmission(tmpAddress);
  Wire.write(B00000001); //addresses the configuration register
  Wire.write((ResolutionBits-9) << 5); //writes the resolution bits
  Wire.endTransmission();
 
  Wire.beginTransmission(tmpAddress); //resets to reading the temperature
  Wire.write((byte)0x00);
  Wire.endTransmission();
}

void drawFrame0(int x, int y) {
    display.clear();
    display.drawXbm(0, 0, 128, 64, tcuk_bits);
    //display.setColor(INVERSE);
    //display.fillRect(0, 0, 128, 64);
    //display.setColor(WHITE);
    display.display();
}

void drawFrame1(int x, int y) {
  display.setFontScale2x2(false);
  display.drawString(65 + x, 0 + y, "Indoors");
  display.drawXbm(x, y, 60, 60, xbmtemp);
  display.setFontScale2x2(true);
  display.drawString(64 + x, 14 + y, String(getTemperature() + TMP100_TEMP_OFFSET) + ((CELCSIUS) ? "c" : "F") );
}

void drawFrame2(int x, int y) {
  display.setFontScale2x2(false);
  display.drawString(65 + x, 8 + y, "Outside");
  display.drawXbm(x + 7, y + 7, 50, 50, getIconFromString(weather.getCurrentIcon()));
  display.setFontScale2x2(true);
  display.drawString(64 + x, 20 + y, String(weather.getCurrentTemp()) + ((CELCSIUS) ? "c" : "F"));
  display.setFontScale2x2(false);
  display.drawString(50 + x, 40 + y, String(weather.getCurrentSummary()));
}

void drawFrame3(int x, int y) {
  display.setFontScale2x2(false);
  display.drawString(65 + x, 0 + y, "Today");
  display.drawXbm(x, y, 60, 60, xbmtemp);
  display.setFontScale2x2(true);
  display.drawString(64 + x, 14 + y, String(weather.getCurrentTemp()) + ((CELCSIUS) ? "c" : "F"));
  display.setFontScale2x2(false);
  display.drawString(66 + x, 40 + y, String(weather.getMinTempToday()) + ((CELCSIUS) ? "c" : "F") + "/" + String(weather.getMaxTempToday()) + ((CELCSIUS) ? "c" : "F"));
}

void drawFrame4(int x, int y) {
  display.drawXbm(x + 7, y + 7, 50, 50, getIconFromString(weather.getIconTomorrow()));
  display.setFontScale2x2(false);
  display.drawString(65 + x, 7 + y, "Tomorrow");
  display.setFontScale2x2(true);
  display.drawString(64 + x, 20 + y, String(weather.getMaxTempTomorrow()) + ((CELCSIUS) ? "c" : "F") ); // + "max"
   display.setFontScale2x2(false);
  display.drawString(66 + x, 40 + y, String(weather.getMinTempTomorrow()) + ((CELCSIUS) ? "c" : "F") + " min");
}

void drawSpinner(int count, int active) {
  for (int i = 0; i < count; i++) {
    const char *xbm;
    if (active == i) {
      xbm = active_bits;
    } else {
      xbm = inactive_bits;
    }
    display.drawXbm(64 - (12 * count / 2) + 12 * i, 56, 8, 8, xbm);
  }
}




