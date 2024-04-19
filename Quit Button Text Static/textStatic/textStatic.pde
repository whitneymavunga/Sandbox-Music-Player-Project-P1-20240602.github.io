//Global Variables
float titleX, titleY, titleWidth, titleHeight;
PFont titleFont;
String title="Let it Go!"
//
//Display Geometry, Display Orientation: landscape, portrait, square
fullScreen();
//
//Concatenation & Inspection
println("Display Monitor:", "width: "+displayWidth, "\theight: "+displayHeight);
int appWidth = displayWidth;
int appHeight = displayHeight;
//
//Population
titleX = appWidth*1/10;
titleY = appHeight*1/10;
titleWidth =appWidth*8/10 ;
titleHeight = appHeight*1/10;
//
//Single Executed Code: Font Size
//Fonts from OS (Operating System)
String[] fontList = PFont.list(); //To list all fonts available on OS
printArray(fontList); //For listing all possible fonts to choose from, then createFont
titleFont = createFont("Gabriola", 50);
// Tools / Create Font / Find Font / Use Size Field / Do not press "OK", known Bug 
//
//DIVs & rect()s
rect(titleX, titleY, titleWidth, titleHeight);
//rect(X, Y, Width, Height); //footer
//
//Repeated Code: draw()ing text
textFont(titleFont, 20);
text(title, titleX, titleY, titleWidth, titleHeight);
