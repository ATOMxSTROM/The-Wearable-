#include <ESP8266WiFi.h>
#include <WebSocketsClient.h>
#include <Arduino_JSON.h>
#include <Adafruit_MPU6050.h>
#include <lm75.h>
#include <NTPClient.h>
#include <WiFiUdp.h>

const char* ssid = "S T O R M";     // Your Wi-Fi SSID
const char* password = "1929@2004"; // Your Wi-Fi password
const char* serverIP = "172.20.10.4";  // Your WebSocket Server IP
const int serverPort = 4000;           // WebSocket Server Port

WebSocketsClient webSocket;
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "pool.ntp.org", 19800);  // UTC+5:30 for India

Adafruit_MPU6050 mpu;
TempI2C_LM75 termo(0x48, TempI2C_LM75::nine_bits);

void webSocketEvent(WStype_t type, uint8_t *payload, size_t length) {
    switch (type) {
        case WStype_DISCONNECTED:
            Serial.println("WebSocket Disconnected!");
            break;
        case WStype_CONNECTED:
            Serial.println("Connected to WebSocket Server!");
            webSocket.sendTXT("Hello from ESP8266");
            break;
        case WStype_TEXT:
            Serial.printf("Received: %s\n", payload);
            break;
    }
}

void setup() {
    Serial.begin(115200);
    delay(10);

    // Connect to Wi-Fi
    Serial.print("Connecting to Wi-Fi");
    WiFi.begin(ssid, password);
    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        Serial.print(".");
    }
    Serial.println("\nWi-Fi Connected!");

    // Connect to WebSocket server
    webSocket.begin(serverIP, serverPort, "/");
    webSocket.onEvent(webSocketEvent);

    // Initialize NTP Client
    timeClient.begin();

    // Initialize MPU6050
    if (!mpu.begin()) {
        Serial.println("Failed to find MPU6050 chip!");
        while (1) delay(10);
    }
    Serial.println("MPU6050 Found!");
}

void loop() {
    webSocket.loop();
    timeClient.update();

    sensors_event_t a, g, t;
    mpu.getEvent(&a, &g, &t);

    // Prepare JSON data
    JSONVar data;
    data["id"] = "ESP8266_01";  // Unique ESP8266 ID
    data["x_ax"] = a.acceleration.x;
    data["y_ax"] = a.acceleration.y;
    data["z_ax"] = a.acceleration.z;
    data["x_ro"] = g.gyro.x;
    data["y_ro"] = g.gyro.y;
    data["z_ro"] = g.gyro.z;
    data["temperature"] = termo.getTemp();
    data["time"] = timeClient.getFormattedTime();

    // Send data every 1 second
    static unsigned long lastMillis = 0;
    if (millis() - lastMillis > 1000) {
        String jsonString = JSON.stringify(data);
        webSocket.sendTXT(jsonString);
        Serial.println("Sent: " + jsonString);
        lastMillis = millis();
    }
}
