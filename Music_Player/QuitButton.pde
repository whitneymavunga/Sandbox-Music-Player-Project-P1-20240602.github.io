//Global Variables
//
int size;
PFont generalFont, quitButtonFont;
String quit="QUIT";
//
color backgroundColour, darkBackground=0, whiteBackground=255; //Gray Scale, note much smaller than COLOR
color foregroundColour;
color white=255, orange=#FFA500, black=0, violet=#7F00FF; //Hexidecimal, see Tools / Colour Selector
Boolean whiteMode=false;
//
void quitdisplay() {
  //size(400, 500); //width, height
  fullScreen(); //displayWidth, displayHeight
  appWidth = displayWidth;
  appHeight = displayHeight;
  //Landscape is HARDCODED
  String displayInstructions = ( appWidth >= appHeight ) ? "Good To Go" : "Bro, turn your phone";
  println(displayInstructions);
  //
   //Fonts from OS (Operating System)
  String[] fontList = PFont.list(); //To list all fonts available on OS
  printArray(fontList); //For listing all possible fonts to choose from, then createFont
  size = ( appWidth > appHeight ) ? appHeight : appWidth ; // Font size starts with smaller dimension
  generalFont = createFont("CalibriBold", size);
  //
  //Population
  quitButtonX = appWidth*90/100;
  quitButtonY = appHeight*91/100;
  quitButtonWidth = appWidth*9/100;
  quitButtonHeight = appHeight*8/100;
  //Layout DIVs
  //rect(X, Y, Width, Height);
  int centerX = appWidth*1/2;
  int centerY = appHeight*1/2;
  rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  //
  //Variable Population
  //if ( hour()>=9 && hour()<=17 ) backgroundColour = whiteBackground;
  //if ( hour()<9 && hour()>17 ) backgroundColour = darkBackground;
  if ( whiteMode==true && hour()>=9 && hour()<=17 ) {
    backgroundColour = whiteBackground;
    foregroundColour = black;
  } else {
    backgroundColour = darkBackground;
    foregroundColour = orange; //Note: if(hour()<9&&hour()>17)
    if ( hour()>=9 && hour()<=17 ) foregroundColour = white;
  }
  //
} //End setup
//
void quit() {
  background(backgroundColour);
  fill(foregroundColour);
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
  fill(violet); //Ink
  textAlign(CENTER, CENTER); //Align X&Y, see Precessing.org / Reference
  //Values: [LEFT| CENTER | RIGHT ] & [ TOP | CENTER | BOTTOM | BASELINE ]]
  size = 60; //Note: CS20 studies size algorithm
  textFont(quitButtonFont, size);
  text(quit, quitButtonX+quitButtonWidth*1/7, quitButtonY+quitButtonHeight*1/7, quitButtonWidth*5/7, quitButtonHeight*5/7); //Inside rect() above
  fill(violet); //Resetting the Defaults
  //

  println(mouseX, mouseY);

  //
} //End draw
//
void key() { //Listener
 if (key=='Q' || key=='q') exit();
  if (key==CODED && keyCode==ESC) exit();
  if (key=='W' || key=='w') ;
  if ( mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight )
  {
    exit();
  }
} //End mousePressed
//
void mouse() {
} //End mousePressed
//
