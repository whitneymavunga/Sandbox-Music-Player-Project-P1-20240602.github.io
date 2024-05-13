import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//
//Global Variables
Minim minim; //creates object to access all functions
AudioPlayer playList1;  //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
AudioPlayer soundEffects1;
//
int appWidth, appHeight;
//
void setup () {
  //Display
  //size(400, 500); //width, height
  fullScreen(); //displayWidth, displayHeight
  appWidth = displayWidth;
  appHeight = displayHeight;
  //Landscape is HARDCODED
  String displayInstructions = ( appWidth >= appHeight ) ? "Good To Go" : "Bro, turn your phone";
  println(displayInstructions);
  //
   minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage
  String pathwaySoundEffects = "../Audio/SoundEffect/"; //Relative Path
  String pathwayMusic = "../../audio/My Music/";
  String quitButtonSound = "CarDoorClosing";
  String solitudedark = "solitudedark";
  String extension = ".mp3";
  //println ( pathwaySoundEffects+quitButtonSound+extension );
  println ("Relative Pathway", pathwayMusic+solitudedark+extension );
  String pathQuitButtonSound = sketchPath( pathwaySoundEffects + quitButtonSound + extension ); //Absolute Path
  String pathsolitudedark = sketchPath( pathwaySoundEffects + solitudedark + extension ); //Absolute Path
  println ( "Absolute Pathway", pathsolitudedark ); //pathQuitButtonSound
  soundEffects1 = minim.loadFile( pathQuitButtonSound );
  playList1 = minim.loadFile ( "pathsolitudedark" ); //"" is compiler error
  //
  //playList1.loop(0);
  //
} //End Setup
//
void draw() {
println(Repeating)
playList1.loop(0);
} //End Draw
//
void keyPressed() {} //End  keyPressed
//
void mousePressed() {} //End mousePressed
//
//End MAIN Program
//
