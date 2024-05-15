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
int numberSoundEffects = 4; //DEV Verify, OS able to count (CS20 Solution)
int numberMusicSongs = 8; //DEV Verify, OS able to count (CS20 Solution)
AudioPlayer[] playList = new AudioPlayer[ numberMusicSongs ]; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
AudioPlayer[] soundEffects = new AudioPlayer[ numberSoundEffects ]; //"Play List" for Sound Effects
int currentSong = 0; //JAVA starts at 0, no for all languages
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
  soundEffects[0] = minim.loadFile [pathQuitButtonSound];
  playList[0] = minim.loadFile [ "pathsolitudedark" ]; //"" is compiler error
  //
  //playList1.loop(0);
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
   */
  //
  if ( !playList[currentSong].isPlaying() ) println( "Nothing is playing, Pick a Song" );
  if ( playList[currentSong].isPlaying() && !playList[currentSong].isLooping() ) println("Play Once");
  //
  /*
   // Auto Play Code for Future Use
  // Contains instructions from Key Board Short Cuts
  if ( playList[currentSong].isPlaying() ) {
    //Empty IF is FALSE
  } else if ( !playList[currentSong].isPlaying()  && ( playList[currentSong].position() > playList[currentSong].length()*0.75 ) ) { //Calc PAIN #
    //TRUE: if 75% played, we need a STOP & Rewind Button
    playList[currentSong].rewind(); //CAUTION: !.isPlaying() & .rewind() = STOP
    //currentSong = currentSong + 1; //currentSong++; currentSong+=1
    //playList[currentSong].play();
  } else {}
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
} //End keyPressed
//
void mousePressed() {
} //End mousPressed
//
//End MAIN Program
//
