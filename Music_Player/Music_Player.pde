/* Documentation
 Library: use Sketch / Import Library / Add Library / Minim
 Suporting Website: https://code.compartmental.net/minim/
 - https://code.compartmental.net/minim/audioplayer_method_loop.html
 - loop(0) seems best for sound effects
 */
//Library
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim; //creates object to access all functions
AudioPlayer playList1; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
AudioPlayer soundEffects1; //"Play List" for Sound Effects
//
int appWidth, appHeight;
//
int size;
PFont generalFont;
String quit="QUIT";
//
color white=255, red=#FF0000, black=0, violet=#7F00FF; //Hexidecimal, see Tools / Colour Selector
Boolean dayMode=false; //App starts in Night Mode, set to day in setup()
Boolean lightMode=false; //Dark mode starts App, null possible if USER Preferences made
//
color backgroundColour, darkBackground=0, whiteBackground=255; //Gray Scale, note much smaller than COLOR
color foregroundColour;
//
String pathDarkBackgroundImage, pathLightBackgroundImage;
PImage shinra,musiclogo,haumea, starslogo;
PImage backgroundImage;
PImage AlbumCoverImage;
float AlbumCoverRIGHT, AlbumCoverCENTERED, AlbumCoverLEFT; //??? Local
//
void setup() {
  //Display
  //size(600, 400); //width, height //400, 500
  fullScreen(); //displayWidth, displayHeight
  appWidth = displayWidth; //width
  appHeight = displayHeight; //height
  //Landscape is HARDCODED
  String displayInstructions = ( appWidth >= appHeight ) ? "Good To Go" : "Bru, turn your phun";
  println(displayInstructions);
  //
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage
  String pathwaySoundEffects = "../mystuff/audio/soundEffects/"; //Relative Path
  String quitButtonSound = "Suspense";
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
  size = ( appWidth > appHeight ) ? appHeight : appWidth ; // Font size starts with smaller dimension
  generalFont = createFont("Georgia", size);
  //bottomFont = createFont("", size); //Note: more than one font allowed
  // Tools / Create Font / Find Font / Use size field / Do not press "OK", known bug
  //
  divs();
  //
  //Variable Population
  //Images
  String shinra = "fire-force-season-1-cour-2-1190407-1280x0-1-800x449";
  String musiclogo = "0b94c75b97182946d495f34c16eab987";
  String starslogo = "Stars-Logo-Graphics-1-3-580x386";
  String extensionJPG = ".jpg";
  String pathway = "../mystuff/Images/";
  String landscape_Square = "Landscape & Square Images/";
  String portrait = "portrait/";
  String backgroundFileName = "Background Image/";
  pathLightBackgroundImage = pathway + backgroundFileName + shinra + extensionJPG;
  pathDarkBackgroundImage = pathway + landscape_Square + musiclogo + extensionJPG;
  String AlbumCoverImagePath = pathway + portrait + starslogo + extensionJPG;
  AlbumCoverImage = loadImage( AlbumCoverImagePath );
  //
  //Image Aspect Ratio Calculations
  //NOTE: IF-Else & WHILE to Adjust Aspect Ratio Dimensions
  //Forms a Procedure for Aspect Ratios of all Images ( copy and paste in setup() )
  float smallerAlbumCoverDimension = ( AlbumCoverWidth < AlbumCoverHeight ) ? AlbumCoverWidth : AlbumCoverHeight ;
  float AlbumCoverImageWidthPixel = 800.0; //Origonally INTs, ratio will be decimal
  float AlbumCoverImageHeightPixel = 600.0; //CAUTION: must avoid truncation to ZERO Value
  float AlbumCoverAspectRatio = AlbumCoverImageWidthPixel/AlbumCoverImageHeightPixel;
  float largerAlbumCoverDimension = smallerAlbumCoverDimension*AlbumCoverAspectRatio; //Apsect Ratio
  if ( AlbumCoverWidth < largerAlbumCoverDimension ) { //Image will not fit into DIV rect()
    while ( AlbumCoverWidth < largerAlbumCoverDimension ) {
      largerAlbumCoverDimension -= 1;
      smallerAlbumCoverDimension -= 1;
      //NOTE: ratios like percent are not linear decreases in both directions
    }
  }
  AlbumCoverWidthAdjusted = largerAlbumCoverDimension;
  AlbumCoverHeightAdjusted = smallerAlbumCoverDimension;
  //
  /*Image can be centered, left justified, or right justified on the larger dimension
   LEFT: X-value of image same as rect()
   CENTERED: X-value of image = albumCoverX + (albumCoverWidth-albumCoverWidthAdjusted)/2;
   RIGHT: X-value of image = albumCoverX+albumCoverWidth-albumCoverWidthAdjusted;
   */
  AlbumCoverRIGHT = AlbumCoverX;
  AlbumCoverCENTERED = AlbumCoverX + (AlbumCoverWidth-AlbumCoverWidthAdjusted)/2;
  AlbumCoverLEFT =AlbumCoverX+AlbumCoverWidth-AlbumCoverWidthAdjusted;
  //
  //Time Calculations
  //if ( hour()>=9 && hour()<=17 ) backgroundColour = whiteBackground;
  //if ( hour()<9 && hour()>17 ) backgroundColour = darkBackground;
  if ( hour()>=9 && hour()<=17 ) dayMode=true; //Day & Night Mode Clock Choice
  //println(dayMode);
  if ( dayMode==true && lightMode==true ) { //Light & Dark Modes, Logical Shortcut
    backgroundColour = whiteBackground;
    foregroundColour = black;
    backgroundImage = loadImage( pathLightBackgroundImage ); //Changing this Variable with 3 different images
  } else if ( lightMode==false ) {
    backgroundColour = black;
    foregroundColour = whiteBackground;
    backgroundImage = loadImage( pathDarkBackgroundImage );
  } else {
    backgroundColour = darkBackground;
    foregroundColour = red; //Note: if(hour()<9&&hour()>17)
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
    fill(red);
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
  //Albumn Cover Image
  image( AlbumCoverImage, AlbumCoverCENTERED, AlbumCoverY, AlbumCoverWidthAdjusted, AlbumCoverHeightAdjusted );
  //
  //println(mouseX, mouseY);
  //
} //End draw
//
void keyPressed() { //Listener
  if (key=='Q' || key=='q')
  {
    soundeffect_1();
  }
  if (key==CODED && keyCode==ESC) //Hardcoded QUIT, no sound available
  {
    soundeffect_1();
  }
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
  if ( mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight )
  {
    soundeffect_1();
  }
} //End mousePressed
//

// End MAIN Program
