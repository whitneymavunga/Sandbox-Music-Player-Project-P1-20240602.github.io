//Global Variables
int appWidth, appHeight;
//
void setup() {
  println("HelloWorld");//print("Hello");//print("World")
  //Concatenation & Inspecting Variables with Character Escapes
  println("Width: "+width+ "\tHeight: "+height+ "\tDisplay Width: "+displayWidth+ "\tDisplay Height: "+displayHeight );
  //NULL: all values are NULL until size(), arithemtic errors
  println( "Example Formula: add 1 to the width", width+1 );
  //
  //Display: CANVAS & Full Screen
  size(400, 500);//width, height
  //fulscreen();//displayWidth, displayHeight
  appWidth = displayWidth;
  appHeight = displayHeight;
  println(appWidth, appHeight);
  //Display Geometry: Landscape, Portrait, Square
  String displayInstructions = ( appWidth >= appHeight ) ? "Good To Go" : " Bro, Turn Your Phone" ;
  println(displayInstructions);
  //CONTINUE HERE: concatenation & display geometry
  //declare landscape, portrait, or square with ternary operator
} //End setup
//
void draw() {
} //End draw
//
void keyPressed() {
} //End Keypressed
//
void mousePressed() {
} //End mouseressed
//
//End Main Program
