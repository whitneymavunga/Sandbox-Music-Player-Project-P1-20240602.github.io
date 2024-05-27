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
   if ( playList[currentSong].isPlaying() ) {
  } else if ( playList[currentSong].length() < 12000 ) { //PAIN Minutes is 1, 60s, 60,000ms
    //TRUE: if song is less than 1 minutes, STOP, I want to hear it from the beginning
    //Pause is actually STOP
    playList[currentSong].rewind(); //NOTE: !.isPlaying() & .rewind() = STOP
  } else if ( !playList[currentSong].isPlaying()  && ( playList[currentSong].position() > playList[currentSong].length()*0.50 ) ) { //Calc PAIN #
    //TRUE: if 50% played, we need a STOP & Rewind Button
    playList[currentSong].rewind(); //NOTE: !.isPlaying() & .rewind() = STOP
    //
    /* Future coding
     currentSong = currentSong + 1; //currentSong++; currentSong+=1
     playList[currentSong].play();
     */
  } else {
  }
} //End draw
//
void keyPressed(){
 if ( key=='P' || key=='p' ) { 
    if ( playList[currentSong].isPlaying() ) { 
      playList[currentSong].pause(); 
    } else {
      playList[currentSong].play();
    }
  } //End Play Pause Button
  if ( key=='L' || key=='l') { //Loop Once
  playList[currentSong].loop(1);
  looping = true;
  } //End Loop Once
  if ( key=='I' || key=='i') { //Loop Infinite Times
  playList[currentSong].loop();
  looping = true;
  } //End Loop Infinite Times
  if ( key=='S' || key=='s') { //STOP BUTTON
   playList[currentSong].pause();
   playList[currentSong].rewind();
  } // End STOP BUTTON
  if ( key=='M' || key=='m' ){
    if ( playList[currentSong].isMuted() ) {
      playList[currentSong].unmute();
    }else{
     playList[currentSong].mute();
    }
  //END MUTE
  //
}//End keyPressed
//
void mousePressed() {
}
//End mousPressed
//
//End MAIN Program
