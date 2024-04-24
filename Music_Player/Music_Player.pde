/* Documentation
//Library: use Sketch / Import Libary / Add Library / Minim
*/

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variables
Minim minim; //creates object to access all fuction
AudioPlayer soundEffects1;
AudioPlayer playlist1;
//
int appWidth, appHeight;
float backgroundX, backgroundY, backgroundWidth, backgroundHeight;
float StarTunesX, StarTunesY, StarTunesWidth, StarTunesHeight;
float playButtonX, playButtonY, playButtonWidth, playButtonHeight;
float quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight;
float RadioX, RadioY, RadioWidth, RadioHeight;
float LibraryX, LibraryY, LibraryWidth, LibraryHeight;
float SearchX, SearchY, SearchWidth, SearchHeight;
float downloadsButtonX, downloadsButtonY, downloadsButtonWidth, downloadsButtonHeight;
int size;
PFont generalFont;
String quit="Quit";
//
color backgroundColour, darkBackground=0, whiteBackground=255; //Gray Scale, note much smaller than colour
color foregroundColour;
color white=255, yellow=#FFFF00, black=0, red=#FF0000, purple=#A020F0; //Hexadecimal, see Tools/ Colour Selector
Boolean whiteMode=true;

//
void setup() {
  //size(400, 500); //width, height
  fullScreen(); //displayWidth, displayHeight
  appWidth = displayWidth;
  appHeight = displayHeight;
  //Landscape is HARDCODED
  String displayInstructions = ( appWidth >= appHeight ) ? "Good To Go" : "Bro, turn your phone";
  println(displayInstructions);
  //
  minim = new Minim(this);
  String extension = ".mp3";
  String quitButtonSound = "Spring_Attic_Door.mp3";
  String pathwaysoundEffects = "../audio/soundEffects"; //Relative Path
  //println(pathwaysoundEffects+quitButtonSound+extension);
  String path = sketchPath( pathwaysoundEffects + quitButtonSound + extension ); //Absolute Path
  //println(path);
  soundEffects1 = minim. loadFile(path);
  //playList1 = minim. loadFile(path);
  //
  //Fonts from OS (Operating System)
//String[] fontList = PFont.list(); //To list all fonts available on OS
//printArray(fontList); //For listing all possible fonts to choose from, then createFont
size =  ( appWidth > appHeight ) ? appHeight : appWidth ; 
generalFont = createFont("Georgia", size);
// Tools / Create Font / Find Font / Use Size Field / Do not press "OK", known Bug 
//
  //Population
  backgroundX = appWidth*0;
  backgroundY = appHeight*0;
  backgroundWidth = appWidth;
  backgroundHeight = appHeight;
  StarTunesX = appWidth*18/100; //Percents example
  StarTunesY = appHeight*15/100;
  StarTunesWidth = appWidth*64/100;
  StarTunesHeight = appHeight*6/16; // Fraction Example
  playButtonX = appWidth*3.45/10;
  playButtonY = appHeight*7/10;
  playButtonWidth = appWidth*3/10;
  playButtonHeight = appHeight*1.5/16;
  quitButtonX = appWidth*0/100;
  quitButtonY = appHeight*0/100;
  quitButtonWidth = appWidth*10/100;
  quitButtonHeight = appHeight*7/100;
  RadioX = appWidth*3.45/8;
  RadioY = appHeight*6.5/9;
  RadioWidth = appWidth*2/8;
  RadioHeight = appHeight*1/16;
  LibraryX = appWidth*3/100;
  LibraryY = appHeight*80/100;
  LibraryWidth =  appWidth*20/100;
  LibraryHeight = appHeight*15/100;

  //Layout DIVs
  //rect(X, Y, Width, Height);
  //rect(backgroundX, backgroundY, backgroundWidth, backgroundHeight);
  int centerX = appWidth*1/2;
  int centerY = appHeight*1/2;
  //rect(centerX*1/2, centerY*1/2, appWidth*1/2, appHeight*1/2);
  //rect(StarTunesX, StarTunesY, StarTunesWidth, StarTunesHeight);
  //rect(playButtonX, playButtonY, playButtonWidth, playButtonHeight);
  rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  //rect(RadioX, RadioY, RadioWidth, RadioHeight);
  //rect(LibraryX, LibraryY, LibraryWidth, LibraryHeight);
  //rect(SearchX, SearchY, SearchWidth, SearchHeight);
  //rect(downloadsButtonX, downloadsButtonY, downloadsButtonWidth, downloadsButtonHeight);

  /*
  rect(X, Y, Width, Height);
   rect(X, Y, Width, Height);
   rect(X, Y, Width, Height);
   rect(X, Y, Width, Height);
   rect(X, Y, Width, Height);
   rect(X, Y, Width, Height);
   rect(X, Y, Width, Height);
   rect(X, Y, Width, Height);
   rect(X, Y, Width, Height);
   rect(X, Y, Width, Height);
   rect(X, Y, Width, Height);
   rect(X, Y, Width, Height);
   rect(X, Y, Width, Height);
   rect(X, Y, Width, Height);
   rect(X, Y, Width, Height);
   rect(X, Y, Width, Height);
   rect(X, Y, Width, Height);
   */

  //Variable Population
  //if ( hour()>=9 && hour() <=17 )  backgroundColour = whiteBackground;
  //if ( hour()>9 && hour() <17 )  backgroundColour = darkBackground;
  if ( whiteMode==false && hour() >=9 && hour() <=17 ) {
    backgroundColour = whiteBackground;
    foregroundColour = black;
  } else {
    backgroundColour = darkBackground;
    foregroundColour =  yellow; //Note: if(hour()<9&&hour()>17) 
    if ( hour()>=9 && hour()<=17 ) foregroundColour = white;
  }
  //
  
} //End setup
//
void draw() {
  background(backgroundColour);
  fill(foregroundColour);
  //
  //Quit Button
  //fill(purple);
  //if ( mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight ) fill(yellow);
  fill(purple);
  rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  if ( mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight ) {
    fill(yellow);
    rect( quitButtonX+quitButtonWidth*1/7, quitButtonY+quitButtonHeight*1/7, quitButtonWidth*5/7, quitButtonHeight*5/7);
  } else {
    fill(purple);
  }
  fill(foregroundColour); //Resetting the Defaults
  //Quit, Text
  fill(foregroundColour); //Ink
  rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  fill(foregroundColour);//Resetting the Defaults
  println(mouseX, mouseY);
  fill(red); //Ink
textAlign(BOTTOM, BOTTOM); //Align X&Y, see Precessing.org / Reference
//Values: [LEFT| CENTER | RIGHT ] & [ TOP | CENTER | BOTTOM | BASELINE ]]
size = 40; //Note: CS20 studies size algorithm
textFont(generalFont, size);
text(quit, quitButtonX+quitButtonWidth*1/7, quitButtonY+quitButtonHeight*1/7, quitButtonWidth*5/7, quitButtonHeight*5/7);

//playButton
 //fill(red);
  //rect(playButtonX, playButtonY, playButtonWidth, playButtonHeight);
  //if ( mouseX>playButtonX && mouseX<playButtonX+quitButtonWidth && mouseY>playButtonY && mouseY<playButtonY+playButtonHeight ) {
   // fill(yellow);
    //rect( playButtonX+playButtonWidth*1/7, playButtonY+playButtonHeight*1/7, playButtonWidth*5/7, playButtonHeight*5/7);
  //} else {
    //fill(red);
  //}
  //fill(foregroundColour); //Resetting the Defaults
  //PLAY, Text
  //fill(foregroundColour); //Ink
  //rect(playButtonX, playButtonY, playButtonWidth, playButtonHeight);
  //fill(foregroundColour);//Resetting the Defaults
  //println(mouseX, mouseY);
  //fill(red); //Ink
//textAlign(CENTER, CENTER); //Align X&Y, see Precessing.org / Reference
//Values: [LEFT| CENTER | RIGHT ] & [ TOP | CENTER | BOTTOM | BASELINE ]]
//size = 40; //Note: CS20 studies size algorithm
//textFont(generalFont, size);
//text(playButtonX+playButtonWidth*1/7, playButtonY+playButtonHeight*1/7, playButtonWidth*5/7, playButtonHeight*5/7);


} //End draw
//
void keyPressed() { //Listener
  if (key=='Q' || key=='q')exit();
  if (key==CODED && keyCode==ESC) exit();
  if (key=='W' || key=='w');
  
  
} //End keyPressed
//
void mousePressed() { //Listener
//QUIT
if (mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight)
{
  
  exit();
}

} //End mousePressed
//
// End MAIN Program
