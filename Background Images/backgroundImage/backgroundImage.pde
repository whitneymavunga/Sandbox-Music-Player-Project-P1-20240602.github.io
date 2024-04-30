//Global Variables
float backgroundImageX,backgroundImageY,backgroundImageWidth,backgroundImageHeight;
int appWidth,appHeight;
PImage  backgroundImage;
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
  String backgroundImageName = "cat";
  String extension = ".jpg";
  String pathway = "../../Images/";
  String landscape_Potrait = "Landscape & Square Images";
  String path = pathway + landscape_Potrait + backgroundImageName + extension;
  backgroundImage = loadImage(path);
  //DIV
  rect(backgroundImageX,backgroundImageY,backgroundImageWidth,backgroundImageHeight);
} //End Setup
//
void draw() {
  image(backgroundImage,backgroundImageX,backgroundImageY,backgroundImageWidth,backgroundImageHeight);
} //End Draw
//
void mousePressed() {
}//End MousePressed
//
void keyPressed() {
} //End KeyPressed
//
//End MAIN Program
