import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
// Minim Library
//
//Global Variables
Minim minim; //creates object to access all functions
AudioPlayer playList1; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
AudioPlayer soundEffects1; //"Play List" for Sound Effects
//
int appWidth, appHeight;
//
void setup() {
  //Display
  size(600, 400); //width, height //400, 500
  //fullScreen(); //displayWidth, displayHeight
  appWidth = displayWidth; //width
  appHeight = displayHeight; //height
  //Landscape is HARDCODED
  String displayInstructions = ( appWidth >= appHeight ) ? "Good To Go" : "Bru, turn your phun";
  //println(displayInstructions);
  //
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage
  String pathwaysoundEffects = "../../audio/soundEffects/"; //Relative Path
  String pathwayMyMusic = "../../audio/MyMusic/"; //Relative Path
  String quitButtonSound = "CarDoorClosing";
  String forestlullaby = "forestlullaby";
  String extension = ".mp3";
  //println ( pathwaysoundEffects+quitButtonSound+extension );
  //println ( "Relative Pathway:", pathwayMusic+forestlullaby+extension );
  String pathQuitButtonSound = sketchPath( pathwaysoundEffects + quitButtonSound + extension ); //Absolute Path
  String pathforestlullabySong = sketchPath( pathwayMyMusic + forestlullaby + extension ); //Absolute Path
  //println ( "Absolute Pathway:", pathGrooveSong ); //pathQuitButtonSound
  soundEffects1 = minim.loadFile( pathQuitButtonSound );
  playList1 =  minim.loadFile( pathforestlullabySong ); // "" is compiler error
  //
  //playList1.loop(0); //Testing Only
  //
} //End setup
//
void draw() {
  println( "Song Position", playList1.position(), "Song Length", playList1.length() );
  playList1.loop(0); //ERROR: only plays beginning of song before starting again
} //End draw
//
void keyPressed() {} //End keyPressed
//
void mousePressed() {} //End mousPressed
//
//End MAIN Program
//
