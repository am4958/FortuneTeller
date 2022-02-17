# Fortune Teller

Description: This program is for a fortune telling game based on the origami fortune tellers I played with as a kid! 
Video Link: https://www.youtube.com/watch?v=OAaY2MoHrms&feature=youtu.be

How To Play:
1. flip the switch to view the color options for your first selection.
2. Navigate around the color wheel by moving the joystick left to go counterclockwise and right to move clockwise. Use the yellow button to finalize your selection. 
3. Push the joystick left and right counting off the letters of the color you selected (if you choose yellow you would switch the numbers 6 times).
4. When you are done counting, press the blue button to move around the number wheel and make a number selection. 
5. Press the yellow button to confirm your number selection and push the joystick left to right counting down from the number you selected. 
6. Press blue to use the joystick to select a number from the options given on screen. 
7. When you have determined your final number, press the blue and yellow buttons at the same time.
8. As instructed by the screen, flip the switch to reveal your fortune and press down the yellow button for a bonus surprise of lucky numbers. 

Hardware Used:
-RaspberryPi 3B+
-esp32
-male to male wires
-female to male wires
-cardboard (for the enclosure)

Wirirng: 

joystick— SW to GPIO14, VRY to GPIO12, VRX GPIO13, 5v to 5v, GND to GND (5 female to male wires used)

yellow button— one prong is connected to GPIO 25 and the other to GND (two male to male wires used)

blue button— one prong is connected to GPIO 26 and the other to GND (two male to male wires used)

switch— the top prong is connected to 3.3v, the middle is connected to GPIO 27, the bottom prong is connected to GND (three male to male wires used)

How To:

1. Wire your esp32 at stated above.
2. Upload the code via the Arduino IDE to your esp32. I ran into many technical issues with this so I downloaded the Arduino ide on the Raspberry Pi to upload the code while plugged in to get around technical errors. Ensure the baud rate on the serial monitor matches the 9600 in the code. You may need to lower your upload speed to the slowest possible speed. 
3. Plug in the Raspberry Pi to power and your monitor and connect the esp32 to the raspberry pi via USB. 
4.Check by using the serial name print statement for the correct port number to input on the line of the processing code commented #YOUR PORT. Put this port number in place of mine. 
5. Build and enclosure if you so desire! Mine is built with an old keyboard box that I painted and used an exacto knife to make button shaped holes.
6. Run the processing code and enjoy!
