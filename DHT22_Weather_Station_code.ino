#include <WiFi.h>
#include <ThingSpeak.h>
#include <DHT.h>

#define DHT_PIN 4
#define DHT_TYPE DHT22

// Wokwi virtual Wi-Fi
const char* WIFI_SSID = "Wokwi-GUEST";
const char* WIFI_PASSWORD = "";

unsigned long CHANNEL_ID = 3491866;
const char* WRITE_API_KEY = "KXXR452IC5L3EGTZ";

WiFiClient client;

DHT dht(DHT_PIN, DHT_TYPE);

void setup() {

  Serial.begin(115200);

  // Start DHT22
  dht.begin();

  Serial.println();
  Serial.println("=================================");
  Serial.println("      IoT WEATHER STATION");
  Serial.println("=================================");

  // Connect to Wokwi virtual Wi-Fi
  Serial.println("Connecting to Wi-Fi...");

  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println();
  Serial.println("Wi-Fi Connected!");

  // Start ThingSpeak
  ThingSpeak.begin(client);
}

void loop() {

  // Read humidity first
  float humidity = dht.readHumidity();

  // Read temperature in Celsius
  float temperature = dht.readTemperature();

  // Check whether sensor reading is valid
  if (isnan(humidity) || isnan(temperature)) {

    Serial.println("DHT22 reading failed");

    delay(2000);
    return;
  }

  Serial.println();
  Serial.println("----- SENSOR DATA -----");

  Serial.print("Temperature: ");
  Serial.print(temperature, 2);
  Serial.println(" °C");

  Serial.print("Humidity: ");
  Serial.print(humidity, 2);
  Serial.println(" %");

  // Send temperature to Field 1
  ThingSpeak.setField(1, temperature);

  // Send humidity to Field 2
  ThingSpeak.setField(2, humidity);

  // Upload both fields to ThingSpeak
  int status = ThingSpeak.writeFields(
    CHANNEL_ID,
    WRITE_API_KEY
  );

  if (status == 200) {
    Serial.println("ThingSpeak upload successful!");
  }
  else {
    Serial.print("ThingSpeak upload failed. Code: ");
    Serial.println(status);
  }

  Serial.println("-----------------------");

  // Wait 20 seconds before next upload
  delay(20000);
}