float backgroundX, backgroundY, backgroundWidth, backgroundHeight;
float StarTunesCoverX, StarTunesCoverY, StarTunesCoverWidth, StarTunesCoverHeight;
float playButtonX, playButtonY, playButtonWidth, playButtonHeight;
float quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight;
float RadioX, RadioY, RadioWidth, RadioHeight;
float LibraryX, LibraryY, LibraryWidth, LibraryHeight;
float SearchX, SearchY, SearchWidth, SearchHeight;
float downloadsButtonX, downloadsButtonY, downloadsButtonWidth, downloadsButtonHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
//
void divs() {
  population();
  drawRects(); 
  } //End DIVS
//
void population() {
  backgroundX = appWidth*0;
  backgroundY = appHeight*0;
  backgroundWidth = appWidth-1;
  backgroundHeight = appHeight-1;
  StarTunesCoverX = appWidth*18/100; //Percents example
  StarTunesCoverY = appHeight*15/100;
  StarTunesCoverWidth = appWidth*64/100;
  StarTunesCoverHeight = appHeight*6/16; // Fraction Example
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
  StarTunesCoverX = appWidth*18/100; //Percents Example
  StarTunesCoverY = appHeight*15/100;
  StarTunesCoverWidth = appWidth*64/100;
  StarTunesCoverHeight = appHeight*6/16; //Fraction Example
} //End Population
//
void drawRects() { //Layout DIVs
  //rect(X, Y, Width, Height);
  //rect(backgroundX, backgroundY, backgroundWidth, backgroundHeight);
  int centerX = appWidth*1/2;
  int centerY = appHeight*1/2;
  //rect(centerX*1/2, centerY*1/2, appWidth*1/2, appHeight*1/2);
  rect(StarTunesX, StarTunesY, StarTunesWidth, StarTunesHeight);
  rect(playButtonX, playButtonY, playButtonWidth, playButtonHeight);
  rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  //rect(RadioX, RadioY, RadioWidth, RadioHeight);
  //rect(LibraryX, LibraryY, LibraryWidth, LibraryHeight);
  //rect(SearchX, SearchY, SearchWidth, SearchHeight);
  //rect(downloadsButtonX, downloadsButtonY, downloadsButtonWidth, downloadsButtonHeight);
//
}//End Draw Rectangles
//End DIVs SubProgram
