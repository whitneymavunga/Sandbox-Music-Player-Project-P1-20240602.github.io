//Global Variables
int appWidth, appHeight;
float backgroundX, backgroundY, backgroundWidth, backgroundHeight;
float StarTunesX, StarTunesY, StarTunesWidth, StarTunesHeight;
float playButtonX, playbuttonY, playButtonWidth, playButtonHeight;
float quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight;
float RadioX, RadioY, RadioWidth, RadioHeight;
float LibraryX, LibraryY, LibraryWidth, LibraryHeight;
float SearchX, SearchY, SearchWidth, SearchHeight;
float downloadsButtonX, downloadsButtonY, downloadsButtonWidth, downloadsButtonHeight;
//
color backgroundColour, darkBackground=0, whiteBackground=255; //Gray Scale, note much smaller than colour
color foregroundColour;
color white=255, yellow=#FFFF00, black=0, purple=#FF00FF; //Hexadecimal, see Tools/ Colour Selector
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
  //Population
  backgroundX = appWidth*0;
  backgroundY = appHeight*0;
  backgroundWidth = appWidth;
  backgroundHeight = appHeight;
  StarTunesX = appWidth*18/100; //Percents example
  StarTunesY = appHeight*15/100;
  StarTunesWidth = appWidth*64/100;
  StarTunesHeight = appHeight*6/16; // Fraction Example
  playButtonX = appWidth*3.45/8;
  playbuttonY = appHeight*6.5/9;
  playButtonWidth = appWidth*1.5/8;
  playButtonHeight = appHeight*1/16;
  quitButtonX = appWidth*88/100;
  quitButtonY = appHeight*90/100;
  quitButtonWidth = appWidth*9/100;
  quitButtonHeight = appHeight*8/100;
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
  //rect(playButtonX, playbuttonY, playButtonWidth, playButtonHeight);
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
  //QuitButton
  fill(purple);
  //if (mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight) fill (yellow);
  if (mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight) {
  fill (yellow);
  rect(quitButtonX+quitButtonWidth*1/7, quitButtonY+quitButtonHeight, quitButtonWidth*5/7, quitButtonHeight  );
   fill(foregroundColour);//Reset Defaults
} else {
  fill(purple);
}
  rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  fill(foregroundColour);//Resetting the Defaults
  println(mouseX, mouseY);
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
