/*---------------------------------------------------------------------------------------------

  Open Sound Control (OSC) library for the ESP8266

  Example for receiving open sound control (OSC) bundles on the ESP8266
  Send integers '0' or '1' to the address "/led" to turn on/off the built-in LED of the esp8266.

  This example code is in the public domain.

--------------------------------------------------------------------------------------------- */
#include <ESP8266WiFi.h>
#include <WiFiUdp.h>
#include <OSCMessage.h>
#include <OSCBundle.h>
#include <OSCData.h>

char ssid[] = "aterm-92649c";          // your network SSID (name)
char pass[] = "nishikado";                    // your network password

// A UDP instance to let us send and receive packets over UDP
WiFiUDP Udp;
const IPAddress outIp(172,20,10,3);        // remote IP (not needed for receive)
const unsigned int outPort = 9999;          // remote port (not needed for receive)
const unsigned int localPort = 50000;        // local port to listen for UDP packets (here's where we send the packets)


OSCErrorCode error;

//motor
float pos_x = 0.0;
float pos_y = 0.0;


void setup() {
  pinMode(16, OUTPUT);

  Serial.begin(115200);
  

  // Connect to WiFi network
  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, pass);
  WiFi.mode(WIFI_STA);
  
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");

  Serial.println("WiFi connected");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());

  Serial.println("Starting UDP");
  Udp.begin(localPort);
  Serial.print("Local port: ");
  Serial.println(Udp.localPort());

  pinMode(16, OUTPUT);

}

void oscReceive(OSCMessage &msg) {
  pos_x = msg.getFloat(0);
  pos_y = msg.getFloat(1);
  Serial.print("pos: ");
  Serial.print(pos_x);
  Serial.print(" ");
  Serial.println(pos_y); 
}

void loop() {
OSCMessage rmsg;
  int size = Udp.parsePacket();
  if (size > 0) {
    while (size--) {
      rmsg.fill(Udp.read());
    }
      Serial.print("called");

    if (!rmsg.hasError()) {
      // アドレスごとに処理を振り分ける
      rmsg.dispatch("/pos", oscReceive, 0);
      rmsg.empty();
    }
    else {
      error = rmsg.getError();
      Serial.print("error: ");
      Serial.println(error);
    }
  }

  yield();
}
