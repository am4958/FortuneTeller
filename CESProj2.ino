/**********************************************************************
  Filename    : Joystick
  Description : Read data from joystick.
  Auther      : www.freenove.com
  Modification: 2020/07/11
**********************************************************************/
int xyzPins[] = {13, 12, 14};   //x,y,z pins
void setup() {
  Serial.begin(9600);
  pinMode(xyzPins[2], INPUT_PULLUP);//z axis is a button.
  pinMode(25, INPUT_PULLUP); //connect button to ground and 32 have button straddle resting val of 1 
  pinMode(26, INPUT_PULLUP); 
  pinMode(27, INPUT_PULLUP);
  
}

void loop() {
  int xVal = analogRead(xyzPins[0]);
  int yVal = analogRead(xyzPins[1]);
  int zVal = digitalRead(xyzPins[2]);
  int buttonVal = digitalRead(25);
  int buttonVal2 = digitalRead(26);
  int switchVal = digitalRead(27);
  Serial.print(xVal);
  Serial.print(zVal);
  Serial.print(buttonVal);
  Serial.print(buttonVal2);
  Serial.print(switchVal);
  Serial.print('\n');
  delay(500);
}
