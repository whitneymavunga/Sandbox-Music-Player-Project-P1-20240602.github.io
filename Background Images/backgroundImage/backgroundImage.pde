//Global Variables
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
int appWidth, appHeight, brightness=255;
PImage  backgroundImage;
Boolean lightMode=true, dayMode=false, nightMode=false;
//Boolean darkmode=false; //See keyPressed for NOTE
//
void setup() {
  //Display
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  //Population
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  //
   String scarletCover = "65186678a92483b9795b58f3_Doja-Cat-Scarlet (1)-p-2000";
  String haumea = "haumea___fire_force__minimalist_wallpaper__by_nquitcoph_deaprdr-414w-2x";
  String backgroundImageName = haumea;
  String extension = ".jpg";
  String pathway = "../../../Images/";
  String landscape_Square = "Landscape & Square Images/";
  String portrait = "Portrait/";
  //String path = pathway + landscape_Square + backgroundImageName + extension;
  String path = pathway + portrait + backgroundImageName + extension;
  backgroundImage = loadImage( path );
  //DIV
  rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
} //End Setup
//
void draw() {
  background(255); //Day Mode, Light Mode ON / OFF
  //NOTE: lightMode ON = max saturation
  if( lightMode == true) {
  brightness = 255;
  } else {
    brightness = 1; //USER Preference: lowest brightness
}
  tint(255, brightness);
  image(backgroundImage, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  //
  println(lightMode);
} //End Draw
//
void mousePressed() {
}//End MousePressed
//
void keyPressed() {
  if ( key=='W' || key=='w' ) { //Day Mode, White Light Containing Blue Colour
    if (lightMode==false) {
      lightMode = true;
    } else {
     lightMode = false; 
    }
  }//End Day Mode
  {
    
  }//End Night Mode
  
 //End KeyPressed
//
//End MAIN Program
