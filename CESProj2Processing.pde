/**
 * Simple Read
 * 
 * Read data from the serial port and change the color of a rectangle
 * when a switch connected to a Wiring or Arduino board is pressed and released.
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;

Serial myPort;  // Create object from Serial class
String val;      // Data received from the serial port
String val2;
Character LR; //for left right of joystick
int rectSelect = 0;
int square = 0;
String selectedcolor; //number of letters in current color
boolean numbers = false;
boolean stay0 = false;
boolean stay1 = false;
boolean selectnum = false;
boolean fortuneTime = false;
boolean redo = true;
boolean end = false;
Character UD;
void setup() 
{
  size(900,900);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[6];
  System.out.println(portName);
  myPort = new Serial(this, portName, 9600);
  delay(1000);
}

void draw()

{
  if ( myPort.available() > 0) {  // If data is available,
    val = myPort.readStringUntil('\n');         // read it and store it in val
  }
  val = trim(val);
  if(val.length() > 4){
  val2 = val.substring(val.length()-4, val.length());
  }
  System.out.println("Val2 " +val2);
  System.out.println("val "+val);
  System.out.println("square " + square);
  background(255);          // Set background to white

  if (val2.equals("1110") && numbers == false && redo == true) { //
    LR = val.charAt(0);
    System.out.println("LR "+LR);
    //RED
    if(LR.equals('0')&& square!= -1){
      square--;  
      delay(500); 
    }            
    if(LR.equals('0')&& square == -1){
      square = 3; 
      delay(500);
    }
    if(LR.equals('4')&& square!= 4){
      square++;
      delay(500);
    }
    if(LR.equals('4')&& square == 4){
      square = 0;  
      delay(500);
    }
    if (square == 0){
      strokeWeight(4);
      stroke(0);
      selectedcolor = "Red";
      fill(255,0,0,200);
    }
    else{
      strokeWeight(1);
      stroke(0);
      fill(255,0,0);
    }
    //red upper left
    //fill(255,0,0);
    rect(200,200,250,250);
    //BLUE
    if (square == 1){
      strokeWeight(4);
      stroke(0);
      selectedcolor = "Blue";
      fill(0,0,255,200);
    }
    else{
      strokeWeight(1);
      stroke(0);
      fill(0,0,255);
    }
    //blue upper right
    //fill(0,0,255);
    rect(450,200,250,250); //(x,y, width, height)
    //GREEN
    if (square == 3){
      strokeWeight(4);
      stroke(0);
      selectedcolor = "Green";
      fill(0,255,0,200);
    }
    else{
      strokeWeight(1);
      stroke(0);
      fill(0,255,0);
    }
    //green lower left
    //fill(0,255,0);
    rect(200,450,250,250); //(x,y, width, height)
    //YELLOW
    if (square == 2){
      strokeWeight(4);
      stroke(0);
      selectedcolor = "Yellow";
      fill(255,255,0,200);
    }
    else{
      strokeWeight(1);
      stroke(0);
      fill(255,255,0);//
    }
    //yellow bottom right
    //fill(255,255,0);
    rect(450,450,250,250); //(x,y, width, height)
  } 
 if(val2.equals("1010") && redo == true){//yellow button
     numbers = true;
 }
if (numbers == true){
      fill(255);
      rect(200,200,250,250);//upper left  (x,y, width, height)
      rect(450,200,250,250); //upper right
      rect(200,450,250,250);//lower left
      rect(450,450,250,250);
      textSize(35);
      text("4", 300, 320); 
      text("5", 550, 320); 
      text("1", 300, 550); 
      text("8", 550, 550);
      fill(0);
      textSize(35);
     text("Left to Right",100,100);
     UD = val.charAt(0);
   System.out.println("UD " +UD);
   if (UD.equals('0') ){
      stay1 = false;
      stay0 = true;
      fill(255);
      rect(200,200,250,250);//upper left  (x,y, width, height)
      rect(450,200,250,250); //upper right
      rect(200,450,250,250);//lower left
      rect(450,450,250,250);//bottom right
      textSize(35);
      fill(0);
      text("4", 300, 320); 
      text("5", 550, 320); 
      text("1", 300, 550); 
      text("8", 550, 550); 
   }
   if (stay0 == true){
     fill(255);
      rect(200,200,250,250);//upper left  (x,y, width, height)
      rect(450,200,250,250); //upper right
      rect(200,450,250,250);//lower left
      rect(450,450,250,250);//bottom right
      textSize(35);
      fill(0);
      text("4", 300, 320); 
      text("5", 550, 320); 
      text("1", 300, 550); 
      text("8", 550, 550);   
   }
  
   if (UD.equals('4')){
     stay0 = false;
     stay1 = true;
    fill(255);
    rect(200,200,250,250);//upper left  (x,y, width, height)
    rect(450,200,250,250); //upper right
    rect(200,450,250,250);//lower left
    rect(450,450,250,250);//bottom right
    textSize(35);
    fill(0);
    text("3", 300, 320); 
    text("6", 550, 320); 
    text("2", 300, 550); 
    text("7", 550, 550);
   }
   if(stay1 == true){
     fill(255);
    rect(200,200,250,250);//upper left  (x,y, width, height)
    rect(450,200,250,250); //upper right
    rect(200,450,250,250);//lower left
    rect(450,450,250,250);//bottom right
    textSize(35);
    fill(0);
    text("3", 300, 320); 
    text("6", 550, 320); 
    text("2", 300, 550); 
    text("7", 550, 550); 
   } 
  }
 
  if(val2.equals("1100")){ //blue button 
    numbers = false;
    System.out.println("here numbers false");
    selectnum = true;
    
  }
  if (selectnum == true){
    if (stay0 == true){
      strokeWeight(1);
      stroke(0);
      fill(255);
      rect(200,200,250,250);//upper left  (x,y, width, height)
      rect(450,200,250,250); //upper right
      rect(200,450,250,250);//lower left
      rect(450,450,250,250);//bottom right
      textSize(35);
      fill(0);
      text("4", 300, 320); 
      text("5", 550, 320); 
      text("1", 300, 550); 
      text("8", 550, 550);  
    }
    else if (stay1 == true){
      strokeWeight(1);
      stroke(0);
      fill(255);
      rect(200,200,250,250);//upper left  (x,y, width, height)
      rect(450,200,250,250); //upper right
      rect(200,450,250,250);//lower left
      rect(450,450,250,250);//bottom right
      textSize(35);
      fill(0);
      text("3", 300, 320); 
      text("6", 550, 320); 
      text("2", 300, 550); 
      text("7", 550, 550); 
    }
 
   if(val2.equals("1000")){
     redo = false;
     selectnum = false;
     fortuneTime = true;
     
   }
 }
 
  if(fortuneTime == true){
    redo = false;
    numbers = false;
    System.out.println("square "+ square);
    
   text("Flip the switch to reveal your fortune", 100,100);
 }
 textSize(40);
 if (val2.equals("1111") || val2.equals("1011")){
   fortuneTime = false;
   if (square == 0){
     if (stay0 == true){
       text("Press yellow to reveal your lucky numbers...", CENTER,100);
       text("Hidden in a valley beside an open stream -- this is the place you will find your dream.", CENTER,300);
        if(val2.equals("1011")){
          background(255);
          text("3, 13, 23, 420", 300,300);
       }
      } else if (stay1 == true){
       text("Press yellow to reveal your lucky numbers...", CENTER,100);
       textSize(40);
       text("No snowflake in an avalanche ever feels responsible.", CENTER,300);
        if(val2.equals("1011")){
          background(255);
          text("4, 24, 18, 96", 300,300);
          //end = true; have it hold down a button and flip switch to return to start. 
       }
     }
   }
   if (square == 1){
     if (stay0 == true){
       text("Press yellow to reveal your lucky numbers...", CENTER,100);
       text("A watched pot never boils", CENTER,100);
       if(val2.equals("1011")){
          background(255);
         text("27, 34, 106, 1", 300,300);
       }
     }else if (stay1 == true){
       text("Press yellow to reveal your lucky numbers...", CENTER,100);
       text("Impersonating Beyoncè is not your destiny, child.", CENTER,300);//cite:Rupaul Charles
       if(val2.equals("1011")){
          background(255);
         text("19, 89, 98, 4", 300,300);
       }
     }
   }
   if (square == 2){
     if (stay0 == true){
       text("Press yellow to reveal your lucky numbers...", CENTER,100);
       text("If you can't love yourself, how in the hell are you going to love somebody else?", CENTER,300); //cite:Rupaul Charles
       if(val2.equals("1011")){
          background(255);
         text("9, 6, 43, 21", 300,300);
       }
     }else if (stay1 == true){
       text("Press yellow to reveal your lucky numbers...", CENTER,100);
       text("You're perfect, you're beautiful, you look like Linda Evangelista", CENTER,300); //Aja
       if(val2.equals("1011")){
          background(255);
         text("8, 45, 20, 109", 300,300);
       }
     }
   }
   if (square == 3){
     if (stay0 == true){
       text("Press yellow to reveal your lucky numbers...", CENTER,100);
       text("Go back to Party City where you belong!", CENTER,300); 
       if(val2.equals("1011")){
          background(255);
         text("72, 93, 55, 45", 300,300);
       }
     }else if (stay1 == true){
       text("Press yellow to reveal your lucky numbers...", CENTER,100);
       text("You will become a firefighter.", CENTER,300);
       if(val2.equals("1011")){
          background(255);
         text("2, 7, 91, 33", 300,300);
       }
     }
   }  
 }
 
 //if (end == true){
 //  numbers = false;
 //  selectnum = false;
   //fortuneTime = false;
 //  //redo = true;
   //end = false;
   
 //}
 
}
