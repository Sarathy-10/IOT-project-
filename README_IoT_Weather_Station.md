# IoT-Based Weather Station

An IoT mini project for real-time weather monitoring using **ESP32, DHT22, ThingSpeak Cloud, and MATLAB**.

The system measures **temperature and relative humidity**, uploads the readings to ThingSpeak over Wi-Fi, visualizes the data using live charts, analyzes the collected values in MATLAB, and generates email alerts when configured limits are reached or exceeded.

## 📌 Problem Statement

Design and implement an IoT weather monitoring system that:

- Reads temperature and humidity using a DHT22 sensor.
- Sends the measurements to the ThingSpeak cloud platform through an ESP32 using Wi-Fi.
- Displays live temperature and humidity trends.
- Analyzes the collected weather data using MATLAB.
- Generates email alerts when predefined temperature or humidity limits are crossed.

## 🎯 Objectives

- Acquire temperature and humidity data from the DHT22 using ESP32.
- Transmit sensor readings to ThingSpeak through Wi-Fi.
- Visualize temperature and humidity trends using ThingSpeak charts.
- Analyze the collected data using MATLAB.
- Implement threshold-based email alerts.

## 🏗️ System Architecture

The project follows the workflow:

**DHT22 Sensor → ESP32 → Wi-Fi → ThingSpeak Cloud → Visualization / MATLAB Analysis → Alert**

### Data Flow

1. The DHT22 measures temperature and relative humidity.
2. ESP32 reads and validates the sensor values.
3. ESP32 connects to the configured Wi-Fi network.
4. Temperature is uploaded to **ThingSpeak Field 1**.
5. Humidity is uploaded to **ThingSpeak Field 2**.
6. ThingSpeak provides live time-based charts.
7. MATLAB retrieves the cloud data for analysis and threshold evaluation.
8. ThingSpeak Alerts generates an email notification when an alert condition is met.

## 🔧 Hardware Used

| Component | Purpose |
|---|---|
| **ESP32 Development Board** | Sensor acquisition and Wi-Fi connectivity |
| **DHT22 Sensor** | Temperature and humidity measurement |

## 💻 Software / Cloud Tools

| Tool | Purpose |
|---|---|
| **ThingSpeak Cloud** | Cloud storage, visualization, and alerts |
| **MATLAB** | Weather-data analysis and threshold evaluation |
| **ESP32 Firmware** | Sensor reading and cloud data upload |

## 🌡️ ThingSpeak Channel Configuration

| ThingSpeak Field | Parameter | Unit |
|---|---|---|
| **Field 1** | Temperature | °C |
| **Field 2** | Humidity | % |

The ThingSpeak dashboard uses separate live charts for temperature and humidity.

## ⚙️ Firmware Logic

The ESP32 firmware follows this sequence:

1. Initialize the ESP32 and DHT22 sensor.
2. Connect to the configured Wi-Fi network.
3. Read temperature and humidity.
4. Validate the sensor readings.
5. Write temperature to ThingSpeak **Field 1**.
6. Write humidity to ThingSpeak **Field 2**.
7. Repeat the acquisition and upload cycle at the selected interval.

## 📊 MATLAB Data Analysis

MATLAB is used as an additional analysis layer for the weather data.

The analysis workflow is:

**ThingSpeak Channel → Latest Weather Data → MATLAB Analysis → Threshold Evaluation → Alert Action**

Temperature and humidity datasets are analyzed separately to inspect their recorded variation.

## 🚨 Alert Mechanism

The demonstrated alert configuration uses:

- **Temperature limit:** 30 °C
- **Humidity limit:** 70 %

When a configured limit is reached or exceeded, ThingSpeak Alerts sends an email notification.

### Demonstrated Results

| Condition | Observed Value | Limit | Result |
|---|---:|---:|---|
| High temperature | 32.40 °C | 30 °C | Alert triggered |
| High temperature | 57.90 °C | 30 °C | Alert triggered |
| High humidity | 70.00 % | 70 % | Alert triggered |

A demonstrated MATLAB run reported **32.40 °C**, which exceeded the configured 30 °C temperature threshold and produced an accepted email request.

## ✅ Verification

The completed implementation satisfies the main project requirements:

- ESP32 + DHT22 + Wi-Fi + ThingSpeak workflow
- Temperature and humidity acquisition
- Cloud upload to ThingSpeak
- Live visualization of both parameters
- Threshold-based email alerts
- MATLAB-based analysis and threshold evaluation

## ▶️ How the System Works

After powering the ESP32 and connecting it to the configured Wi-Fi network, the DHT22 provides temperature and humidity measurements. The ESP32 uploads these values continuously to the ThingSpeak channel.

ThingSpeak stores and displays the readings in real time. MATLAB can then retrieve the cloud data for analysis. When the temperature or humidity reaches/exceeds its configured threshold, the alert mechanism sends an email notification.

## 📁 Suggested Repository Structure

```text
IoT-Based-Weather-Station/
│
├── README.md
├── firmware/
│   └── <ESP32 firmware source>
│
├── matlab/
│   └── <MATLAB analysis files>
│
├── report/
│   └── Report_IOT.pdf
│
└── screenshots/
    ├── thingspeak_dashboard.png
    ├── high_temperature_alert.png
    └── high_humidity_alert.png
```

> Replace the placeholder source-file names with the actual filenames used in your project.

## 🔐 Configuration

Before running the ESP32 firmware, configure the project with your own:

- Wi-Fi network credentials
- ThingSpeak channel configuration
- ThingSpeak API credentials required by your implementation
- Alert/notification configuration

Do not upload private Wi-Fi passwords or API keys to a public repository.

## 📈 Project Outcome

The project demonstrates an end-to-end IoT weather monitoring system in which environmental data is sensed locally, transmitted to the cloud, visualized, analyzed, and used for threshold-based notifications.

## 👨‍💻 Project Type

**IoT Mini Project — IoT-Based Weather Station**

### Technologies

`ESP32` · `DHT22` · `Wi-Fi` · `ThingSpeak` · `MATLAB` · `IoT`
