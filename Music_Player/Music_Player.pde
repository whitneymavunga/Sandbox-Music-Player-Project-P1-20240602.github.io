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
int appWidth, appHeight;
//
Boolean dayMode=false;
Boolean lightMode=false;
//
String pathDarkBackgroundImage, pathLightBackgroundImage; 
PImage haumea, shinra, starslogo;
PImage backgroundImage;
PImage StarTunesImage;
float StarTunesRIGHT, StarTunesCENTERED, StarTunesLEFT;
float StarTunesWidthAdjusted, StarTunesHeightAdjusted;
//
//
void setup() {
  //Display
  //size(400, 500); //width, height
  fullScreen(); //displayWidth, displayHeight
  appWidth = displayWidth;
  appHeight = displayHeight;
  //Landscape is HARDCODED
  String displayInstructions = ( appWidth >= appHeight ) ? "Good To Go" : "Bro, turn your phone";
  println(displayInstructions);
  //
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage
  String pathwaySoundEffects = "../audio/SoundEffects/"; //Relative Path
  String quitButtonSound = "CarDoorClosing";
  String extension = ".mp3";
  //println ( pathwaySoundEffects+quitButtonSound+extension );
  String path = sketchPath( pathwaySoundEffects + quitButtonSound + extension ); //Absolute Path
  //println ( path );
  soundEffects1 = minim.loadFile( path );
  //playList1 = minim.loadFile( path );
  //
  //Fonts from OS (Operating System)
  //String[] fontList = PFont.list(); //To list all fonts available on OS
  //printArray(fontList); //For listing all possible fonts to choose from, then createFont
  size = ( appWidth > appHeight ) ? appHeight : appWidth ;
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
  //Images
  String shinra = "fire-force-season-1-cour-2-1190407-1280x0-1-800x449";
  String haumea = "haumea___fire_force__minimalist_wallpaper__by_nquitcoph_deaprdr-414w-2x";
  String starslogo = "Stars-Logo-Graphics-1-3-580x386";
  String extensionJPG = ".jpg";
  String extensionJPEG = ".jpeg";
  String pathway = "../../Images/";
  String portrait = "Portrait/";
  String landscape_Square = "Landscape & Square Images/";
  String backgroundFileName = "Background Image/";
  pathDarkBackgroundImage = pathway + portrait + haumea + extensionJPG;
  pathLightBackgroundImage = pathway + landscape_Square + shinra + extensionJPEG;
  String StarTunesImagePath = pathway + portrait + starslogo + extensionJPG;
  StarTunesImage = loadImage(StarTunesImagePath );
  //
  //Image Aspect Ratio Calculations
  //NOTE: IF-Else & WHILE to Adjust Aspect Ratio Dimensions
  //Forms a Procedure for Aspect Ratios of all Images ( copy and paste in setup() )
  float smallerStarTunesDimension = ( StarTunesWidth < StarTunesHeight ) ? StarTunesWidth : StarTunesHeight ;
  float StarTunesImageWidthPixel = 800.0; //Origonally INTs, ratio will be decimal
  float StarTunesImageHeightPixel = 600.0; //CAUTION: must avoid truncation to ZERO Value
  float StarTunesAspectRatio = StarTunesImageWidthPixel/StarTunesImageHeightPixel;
  float largerStarTunesDimension = smallerStarTunesDimension*StarTunesAspectRatio; //Apsect Ratio
  if ( StarTunesWidth < largerStarTunesDimension ) { //Image will not fit into DIV rect()
    while ( StarTunesWidth < largerStarTunesDimension ) {
      largerStarTunesDimension -= 1;
      smallerStarTunesDimension -= 1;
      //NOTE: ratios like percent are not linear decreases in both directions
    }
  }
  StarTunesWidthAdjusted = largerStarTunesDimension;
  StarTunesHeightAdjusted = smallerStarTunesDimension;
  //
  /*Image can be centered, left justified, or right justified on the larger dimension
   LEFT: X-value of image same as rect()
   CENTERED: X-value of image = albumCoverX + (albumCoverWidth-albumCoverWidthAdjusted)/2;
   RIGHT: X-value of image = albumCoverX+albumCoverWidth-albumCoverWidthAdjusted;
   */
  StarTunesRIGHT = StarTunesX;
  StarTunesCENTERED = StarTunesX + (StarTunesWidth-StarTunesWidthAdjusted)/2;
  StarTunesLEFT =X+StarTunesWidth-StarTunesWidthAdjusted;
  //
  //
  //Time Calculations
  //if ( hour()>=9 && hour()<=17 ) backgroundColour = whiteBackground;
  //if ( hour()<9 && hour()>17 ) backgroundColour = darkBackground;
  if ( hour()>=9 && hour()<=17 ) dayMode=true; //Day & Night Mode Clock Choice
  println();
  if ( dayMode==true && lightMode==true ) { //Light & Dark Modes
    backgroundColour = whiteBackground;
    foregroundColour = black;
    backgroundImage = loadImage( pathLightBackgroundImage ); //Changing this Variable with 3 different images
  } else if ( lightMode==false ) {
    backgroundColour = black;
    foregroundColour = whiteBackground;
    backgroundImage = loadImage( pathDarkBackgroundImage );
  } else {
    backgroundColour = darkBackground;
    foregroundColour = orange; //Note: if(hour()<9&&hour()>17)
    backgroundImage = loadImage( pathDarkBackgroundImage );
  }
  //
  //soundEffects1.loop();
} //End setup
//
void draw() {
    //Display
  // background(backgroundColour); //Hardcoded Backgorund Colour Out, use IF to change
  if ( dayMode=true && lightMode == true ) { //Boolean keyBind, Logical Shortcut
    //CAUTION: See setup
    backgroundImage = loadImage( pathLightBackgroundImage );
  } else if ( lightMode == false ) {
    backgroundImage = loadImage( pathDarkBackgroundImage );
  } else {
    tint(255, 255, 255, 0); //no blue;
  }
  image( backgroundImage, backgroundX, backgroundY, backgroundWidth, backgroundHeight);
  //fill(foregroundColour);
  //
  //Quit Button
  //fill(purple);
  //if ( mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight ) fill(yellow);
   fill(violet);
  rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  if ( mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight ) {
    fill(orange);
    rect( quitButtonX+quitButtonWidth*1/7, quitButtonY+quitButtonHeight*1/7, quitButtonWidth*5/7, quitButtonHeight*5/7);
  } else {
    fill(violet);
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
  //
  //StarTunes Cover Image
  image( StarTunesImage, StarTunesCENTERED, StarTunesY, StarTunesWidthAdjusted, StarTunesHeightAdjusted );
  //
  //println(mouseX, mouseY);
  //
} //End draw
//

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
