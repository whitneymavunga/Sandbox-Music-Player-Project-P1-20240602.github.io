//Global Variables
float titleX, titleY, titleWidth, titleHeight;
float bottomX, bottomY, bottomWidth, bottomHeight;
PFont titleFont;
String title="Let it Go!";
int size;
color blue=#1400FF , purple=#FF00FF;
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
bottomX = appWidth*1/10;
bottomY = appHeight*8/10;
bottomWidth = appWidth*8/10;
bottomHeight = appHeight*1/10;
//
//Single Executed Code: Font Size
//Fonts from OS (Operating System)
String[] fontList = PFont.list(); //To list all fonts available on OS
printArray(fontList); //For listing all possible fonts to choose from, then createFont
size = 55;
titleFont = createFont("Harrington", size);
// Tools / Create Font / Find Font / Use Size Field / Do not press "OK", known Bug 
//
//DIVs & rect()s
rect(titleX, titleY, titleWidth, titleHeight);
rect(bottomX, bottomY, bottomWidth, bottomHeight);
//rect(X, Y, Width, Height); //footer
//
//Repeated Code: draw()ing text
fill(purple); //Ink
textAlign(CENTER, CENTER); //Align X&Y, see Precessing.org / Reference
//Values: [LEFT| CENTER | RIGHT ] & [ TOP | CENTER | BOTTOM | BASELINE ]]
size = 20; //Note: CS20 studies size algorithm
textFont(titleFont, size);
text(title, titleX, titleY, titleWidth, titleHeight);
