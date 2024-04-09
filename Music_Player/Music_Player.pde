//Global Variables
int appWidth, appHeight;
float backgroundX, backgroundY, backgroundWidth, backgroundHeight;
float StarTunesX, StarTunesY, StarTunesWidth, StarTunesHeight;
float playButtonX, playbuttonY, playButtonWidth, playButtonHeight;
float quitButtonX,quitButtonY,quitButtonWidth,quitButtonHeight;
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
  //Population
  backgroundX = appWidth*0;
  backgroundY = appHeight*0;
  backgroundWidth = appWidth;
  backgroundHeight = appHeight;
  StarTunesX = appWidth*18/100; //Percents example
  StarTunesY = appHeight*15/100;
  StarTunesWidth = appWidth*64/100;
  StarTunesHeight = appHeight*6/16; // Fraction Example
  playButtonX = appWidth*3.5/8;
  playbuttonY = appHeight*8/9;
  playButtonWidth = appWidth*1/8;
  playButtonHeight = appHeight*1/12;
  quitButtonX = appWidth*90/100;
  quitButtonY = appHeight*91/100;
  quitButtonWidth = appWidth*9/100;
  quitButtonHeight = appHeight*8/100;
  //Layout DIVs
  //rect(X, Y, Width, Height);
  rect(backgroundX, backgroundY, backgroundWidth, backgroundHeight);
  int centerX = appWidth*1/2;
  int centerY = appHeight*1/2;
  //rect(centerX*1/2, centerY*1/2, appWidth*1/2, appHeight*1/2);
  rect(StarTunesX, StarTunesY, StarTunesWidth, StarTunesHeight);
  rect(playButtonX, playbuttonY, playButtonWidth, playButtonHeight);
  rect(quitButtonX,quitButtonY,quitButtonWidth,quitButtonHeight);
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
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  */
  
  //
  //CONTINUE HERE
  //Paper Folding for Case Study
  //Write Out Ratios on 2nd Case Study
  //More time for DIVs, Grade Progress
  //
} //End setup
//
void draw() {
} //End draw
//
void keyPressed() {
} //End keyPressed
//
void mousePressed() {
} //End mousePressed
//
// End MAIN Program
