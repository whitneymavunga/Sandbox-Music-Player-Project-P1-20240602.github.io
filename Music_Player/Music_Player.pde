/* Documentation
 */
//Library
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variables
Minim minim; //creates object to access all functions
AudioPlayer soundEffects1;
AudioPlayer playList1; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
//
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
String path, pathway, extension;
int appWidth, appHeight;
int size;
PFont generalFont;
String quit="Quit";
//
color backgroundColour, darkBackground=0, whiteBackground=255; //Gray Scale, note much smaller than colour
color foregroundColour;
color white=255, yellow=#FFFF00, black=0, red=#FF0000, purple=#A020F0; //Hexadecimal, see Tools/ Colour Selector
Boolean dayMode=false;
Boolean lightMode=false;
PImage backgroundImageName, backgroundFileName, backgroundImage, haumea, pexelsphoto;
//
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
  String pathway = sketchPath( pathwaysoundEffects + quitButtonSound + extension ); //Absolute Path
  //println(path);
  soundEffects1 = minim. loadFile(pathway);
  //playList1 = minim. loadFile(path);
  //
  //Fonts from OS (Operating System)
  //String[] fontList = PFont.list(); //To list all fonts available on OS
  //printArray(fontList); //For listing all possible fonts to choose from, then createFont
  size =  ( appWidth > appHeight ) ? appHeight : appWidth ;
  generalFont = createFont("Georgia", size);
  // Tools / Create Font / Find Font / Use Size Field / Do not press "OK", known Bug
  //
  divs();
  //
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
  //
  //Variable Population
  //
  //Time Calculations
  //if ( hour()>=9 && hour()<=17 ) backgroundColour = whiteBackground;
  //if ( hour()<9 && hour()>17 ) backgroundColour = darkBackground;
  if ( lightMode==true && hour()>=9 && hour()<=17 ) { 
    if ( lightMode==true ) { 
      backgroundColour = whiteBackground;
      foregroundColour = black;
      backgroundImageName = haumea;
      path = pathway + backgroundFileName + backgroundImageName + extension;
      // CONTINUE HERE
      backgroundImage = loadImage( path );
    } else {
      backgroundColour = black;
      foregroundColour = whiteBackground;
      backgroundImageName = pexelsphoto;
      path = pathway + backgroundFileName + backgroundImageName + extension;
      backgroundImage = loadImage( path );
    } //End Light & Dark Modes
  } else {
    backgroundColour = darkBackground;
    foregroundColour = yellow; //Note: if(hour()<9&&hour()>17)
    //TURN OFF, adjusted above
    //if ( hour()>=9 && hour()<=17 ) foregroundColour = white;
  }
  //
  //soundEffects1.loop();
} //End setup
//
void draw() {
  //Display
  // background(backgroundColour); 
  if ( lightMode == true ) {
    //CAUTION: See setup
  } else {
    backgroundImageName = pexelsphoto;
    path = pathway + backgroundFileName + backgroundImageName + extension;
    backgroundImage = loadImage( path );
  }
  //image( backgroundImage, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
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
  textAlign( CENTER, CENTER ); //Align X&Y, see Processing.org / Reference
  //Values: [ LEFT | CENTER | RIGHT ] & [ TOP | CENTER | BOTTOM | BASELINE ]
  size = appHeight*1/23; // Var based on ratio of display
  textFont(generalFont, size);
  text(quit, quitButtonX+quitButtonWidth*1/7, quitButtonY+quitButtonHeight*1/7, quitButtonWidth*5/7, quitButtonHeight*5/7); //Inside rect() above
  fill(foregroundColour); //Resetting the Defaults
  //
  //Album Cover Image
  rect(StarTunesX, StarTunesY, StarTunesWidth, StarTunesHeight);
  //


  //println(mouseX, mouseY);
  //
} //End draw
//
void keyPressed() { //Listener
  if (key=='R' || key=='r')exit();
  {
    //soundeffect_1();
  }
  if (key==CODED && keyCode==ESC) exit();
  {
    //soundeffect_1();
  }
  if (key=='W' || key=='w');

  //CAUTION, must return to "Request White, Light Mode"
  if ( key=='W' || key=='w' ) { //Day Mode, White Light Containing Blue Colour
    if (  lightMode == false ) {
      lightMode = true;  //Light Mode ON
    } else {
      lightMode = false; //Dark Mode ON, no darkMode Boolean required
    }
  } //End Day Mode
   //
  //soundEffects1.loop(0);
} //End keyPressed
//
void mousePressed() { //Listener
  if (mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight)
  {
    //soundeffect_1();
  }
} //End mousePressed
//
// End MAIN Program
