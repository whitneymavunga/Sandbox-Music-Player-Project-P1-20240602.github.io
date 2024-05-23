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
int numberSoundEffects = 1; //DEV Verify, OS able to count (CS20 Solution)
int numberMusicSongs = 6; //DEV Verify, OS able to count (CS20 Solution)
AudioPlayer[] playList = new AudioPlayer[ numberMusicSongs ]; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
AudioPlayer[] soundEffects = new AudioPlayer[ numberSoundEffects ]; //"Play List" for Sound Effects
int currentSong = 0; //JAVA starts at 0, no for all languages
//
int appWidth, appHeight;
//
Boolean looping=false;
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
  String pathwaySoundEffects = "../../audio/soundEffect/"; //Relative Path
  String pathwayMusic = "../Audio/MyMusic/"; //Relative Path
  String quitButtonSound = "CarDoorClosing";
  String forestlullaby = "forestlullaby";
  String extension = ".mp3";
  //println ( pathwaySoundEffects+quitButtonSound+extension );
  //println ( "Relative Pathway:", pathwayMusic+forest+extension );
  String pathQuitButtonSound = sketchPath( pathwaySoundEffects + quitButtonSound + extension ); //Absolute Path
  String pathForestSong = sketchPath( pathwayMusic + forestlullaby + extension ); //Absolute Path
  //println ( "Absolute Pathway:", pathForestSong ); //pathQuitButtonSound
  soundEffects[0] = minim.loadFile( pathQuitButtonSound );
  playList[0] =  minim.loadFile( pathForestSong ); // "" is compiler error
  //
  //Note: Music starts before CANVAS ... Purpose of Player
  //Note: See Easter Egg about Time-On and Looping Songs
  //playList[currentSong].loop(0); //Testing Only
  //
} //End Setup
//
void draw() {
  println( "Song Position", playList[currentSong].position(), "Song Length", playList[currentSong].length() );
  //
  //ERROR: only plays beginning of song before starting again
  //playList[currentSong].loop(0);
  //
  /*Note: For Loop Feature
   Easter Egg: program time for number of song loops
   Alternate to timer for music player, times to the end of a song
   
   if ( playList[currentSong].isLooping() && playList[currentSong].loopCount()!=-1 ) println("There are", playList[currentSong].loopCount(), "loops left.");
   if ( playList[currentSong].isLooping() && playList[currentSong].loopCount()==-1 ) println("Looping Infinitely");
   println("KeyBoard Looping question")
   */
  //
  if ( !playList[currentSong].isPlaying() ) println( "Nothing is playing, Pick a Song" );
  if ( playList[currentSong].isPlaying() && !playList[currentSong].isLooping() ) println("Play Once");
  //
  /* Auto Play Code for Future Use
   Contains instructions from Key Board Short Cuts
   Note: PAIN Thresholds, 3 minutes & 75%, can be variables
   Note: Variables can be set in a Menu Button
   */
  if ( playList[currentSong].isPlaying() ) {
    //Empty IF is FALSE
  } else if ( playList[currentSong].length() < 60000 ) { //PAIN Minutes is 1, 60s, 60,000ms
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
  /* Previous IF-Else
   if ( playList[currentSong].isPlaying() ) {
   //Empty IF, TRUE
   } else {
   playList[currentSong].rewind(); //CAUTION: !.isPlaying() & .rewind() = STOP
   }
   */
} //End draw
//
void keyPressed() {
  if ( key=='P' || key=='p' ) { //Play Pause Button
    //How much of the song should play before the Pause Button is actually a rewind button
    if ( playList[currentSong].isPlaying() ) { //Note, debugging: use true==true & true==false
      playList[currentSong].pause(); //playList[currentSong].play();
    } else {
      playList[currentSong].play(); //playList[currentSong].pause();
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
  
} //End keyPressed
//
void mousePressed() {
} //End mousPressed
//
//End MAIN Program
//
