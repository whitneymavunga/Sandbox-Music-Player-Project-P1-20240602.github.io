//Global Variables
PImage StarTunesCoverImage;
//
void ratio() {
  //Display
  size(600, 400); //width, height //400, 500
  //fullScreen(); //displayWidth, displayHeight
  appWidth = width; //displayWidth
  appHeight = height; //displayHeight
  //
  //Population
  StarTunesCoverX = appWidth*18/100; //Percents Example
  StarTunesCoverY = appHeight*15/100;
  StarTunesCoverWidth = appWidth*64/100;
  StarTunesCoverHeight = appHeight*6/16; //Fraction Example
  //
  //Variable Population
  //NOTE: once image loaded by STRINGS, only image variable as Global Variable Required
  //NOTE: Computer knows what the folder names are and can be programmed automatically (beyond scope of course)
  String haumea = "haumea___fire_force__minimalist_wallpaper__by_nquitcoph_deaprdr-414w-2x";
  String extensionJPG = ".jpg";
  String pathway = "../mystuff/Images/";
  String portrait = "Portrait/";
  String StarTunesImagePath = pathway + portrait + haumea + extensionJPG;
  StarTunesImage = loadImage(StarTunesImagePath );
  //
  //Image Aspect Ratio Calculations
  //NOTE: IF-Else & WHILE to Adjust Aspect Ratio Dimensions
  //Forms a Procedure for Aspect Ratios of all Images ( copy and paste in setup() )
  float StarTunesCoverX, StarTunesCoverY, StarTunesCoverWidth, StarTunesCoverHeight, StarTunesCoverWidthAdjusted, StarTunesCoverHeightAdjusted;
  float smallerStarTunesCoverDimension = ( StarTunesCoverWidth < StarTunesCoverHeight ) ? StarTunesCoverWidth : StarTunesCoverHeight ;
  float StarTunesCoverImageWidthPixel = 800.0; //Origonally INTs, ratio will be decimal
  float StarTunesCoverImageHeightPixel = 600.0; //CAUTION: must avoid truncation to ZERO Value
  float StarTunesCoverAspectRatio = StarTunesCoverImageWidthPixel/StarTunesCoverImageHeightPixel;
  float largerStarTunesCoverDimension = smallerStarTunesCoverDimension*StarTunesCoverAspectRatio; //Apsect Ratio
  if ( StarTunesCoverWidth < largerStarTunesCoverDimension ) { //Image will not fit into DIV rect()
    while ( StarTunesCoverWidth < largerStarTunesCoverDimension ) {
      largerStarTunesCoverDimension-= 1;
      smallerStarTunesCoverDimension -= 1;
      //NOTE: ratios like percent are not linear decreases in both directions
    }
  }
  StarTunesCoverWidthAdjusted = largerStarTunesCoverDimension;
  StarTunesCoverHeightAdjusted = smallerStarTunesCoverDimension;
  //
  //DIVs
  rect(StarTunesCoverX, StarTunesCoverY, StarTunesCoverWidth, StarTunesCoverHeight);
  //
} //End setup
//
void aspect() {
  image( albumCoverImage, albumCoverX, albumCoverY, albumCoverWidthAdjusted, albumCoverHeightAdjusted );
} //End draw
//
void mousePressed() {
} //End mousePressed
//
void keyPressed() {
} //End keyPressed
//
//End MAIN Program
