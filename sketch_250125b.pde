import processing.serial.*;

Serial myPort; // Serial port object
int[] data = new int[500]; // Array to store ADC values
int index = 0; // Current index in the array

void setup() {
  size(1600, 900); // Window size
  myPort = new Serial(this, Serial.list()[0], 9600); // Open the first available serial port
  myPort.bufferUntil('\n'); // Read until a newline character
}

void draw() {
  background(0); // Black background
  stroke(0, 255, 0); // Green waveform
  noFill();
  beginShape();
  for (int i = 0; i < data.length; i++) {
    float x = map(i, 0, data.length, 0, width); // Map data index to screen width
    float y = map(data[i], 0, 1023, height, 0); // Map ADC value to screen height
    vertex(x, y);
  }
  endShape();
}

void serialEvent(Serial myPort) {
  String inString = myPort.readStringUntil('\n'); // Read serial data until newline
  if (inString != null) {
    inString = trim(inString); // Remove whitespace
    int value = int(inString); // Convert to integer
    data[index] = value; // Store the value in the array
    index = (index + 1) % data.length; // Increment index (circular buffer)
  }
}
