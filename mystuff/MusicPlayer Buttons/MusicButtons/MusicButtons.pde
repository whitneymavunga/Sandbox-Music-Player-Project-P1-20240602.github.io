import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
// Minim Library
//
//Global Variables
//Minim minim; //creates object to access all functions
int numberSoundEffects = 1; //DEV Verify, OS able to count (CS20 Solution)
int numberMusicSongs = 6; //DEV Verify, OS able to count (CS20 Solution)
AudioPlayer[] playList = new AudioPlayer[ numberMusicSongs ]; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
AudioPlayer[] soundEffects = new AudioPlayer[ numberSoundEffects ]; //"Play List" for Sound Effects
AudioMetaData[] playListMetaData = new AudioMetaData [ numberMusicSongs ];
int currentSong = numberMusicSongs - numberMusicSongs;
//
//int appWidth, appHeight;
//
Boolean looping=false;
//
String testingOnly = "Forest Lullaby";
//PFont generalFont;
//
//color black = #000000, white=#FFFFFF, nightInk=#FFFF00;
//
void musicButtons() {
  //Display
  size(600, 400); //width, height //400, 500
  //fullScreen(); //displayWidth, displayHeight
  appWidth = displayWidth; //width
  appHeight = displayHeight; //height
  //Landscape is HARDCODED
  String displayInstructions = ( appWidth >= appHeight ) ? "Good To Go" : "Bru, turn your phun";
  //println(displayInstructions);
  //
  //Font Code
  generalFont = createFont( "GeorgiaBoldItalic", appHeight );
  //
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage
  String pathwaysoundEffects = "../../audio/soundEffects/"; //Relative Path
  String pathwayMyMusic = "../../audio/MyMusic/"; //Relative Path
  String quitButtonSound = "CarDoorClosing";
  String forestlullaby = "forestlullaby";
  String commas = "AyraStarrCommas";
  String MASC = "DojaCatMASC";
  String drivebreakbeat = "drivebreakbeat";
  String Tems = "TemsMeU";
  String solitudedark = "solitudedark";
  String extension = ".mp3";
  //println ( pathwaysoundEffects+quitButtonSound+extension );
  //println ( "Relative Pathway:", pathwayMusic+forestlullaby+extension );
  String pathQuitButtonSound = sketchPath( pathwaysoundEffects + quitButtonSound + extension );//Absolute Pathway
  String pathforestlullabySong = sketchPath( pathwayMyMusic + forestlullaby + extension );//Absolute Pathway
  String pathcommasSong = sketchPath( pathwayMyMusic + commas + extension );//Absolute Pathway
  String pathMASCSong = sketchPath( pathwayMyMusic + MASC + extension );//Absolute Pathway
  String pathdrivebreakbeatSong = sketchPath( pathwayMyMusic + drivebreakbeat + extension );//Absolute Pathway
  String pathTemsSong = sketchPath( pathwayMyMusic + Tems + extension );//Absolute Pathway
  String pathsolitudedarkSong = sketchPath( pathwayMyMusic + solitudedark + extension );//Absolute Pathway
  println ("Absolute Pathway:", pathsolitudedarkSong ); //pathQuitButtonSound
  //println ( "Sound Effect Absolute Pathway:", pathQuitButtonSound );
  //println ( "1. Absolute Pathway:", pathforestlullabySong );
  //println ( "2. Absolute Pathway:", pathcommasSong );
  //println ( "3. Absolute Pathway:", pathMASCSong );
  //println ( "4. Absolute Pathway:", pathdrivebreakbeatSong );
  //println ( "5. Absolute Pathway:", pathTemsSong );
  //println ( "6. Absolute Pathway:", pathsolitudedarkSong );
  soundEffects [0] = minim.loadFile( pathQuitButtonSound );
  //Note: currentSong, currentSong+=1, currentSong++
  println( "The current song is:", currentSong );
  //
  playList [0] =  minim.loadFile( pathforestlullabySong ); // "" is compiler error
  println( "1. The current song is:", currentSong, pathforestlullabySong );
  //playList[1] =  minim.loadFile( pathcommasSong ); // "" is compiler error
  //println( "2. The current song is:", currentSong );
  //playList[currentSong++] =  minim.loadFile( pathMASCSong ); // "" is compiler error
  //println( "3. The current song is:", currentSong );
  //playList[currentSong++] =  minim.loadFile( pathdrivebreakbeatSong ); // "" is compiler error
  //println( "4. The current song is:", currentSong );
  //playList[currentSong++] =  minim.loadFile( pathTemsSong ); // "" is compiler error
  //println( "5. The current song is:", currentSong );
  //playList[currentSong++] =  minim.loadFile( pathsolitudedarkSong ); // "" is compiler error
  //println( "6. The current song is:", currentSong );
  //
  //Random Start Prototype
  //println( "Current Song, Random Number:", int ( random(0, 6) ) );
  //
  //Note: Music starts before CANVAS ... Purpose of Player
  //Note: See Easter Egg about Time-On and Looping Songs
  playList[0].loop(); //Testing Only, change parameter to the accruate number
  //
  //playListMetaData [0] = playList[0].getMetaData();
  //
  //playList1.loop(0); //Testing Only
  //
} //End setup
//
void playlist() {
  /*
  //Instrpection of Booleans and Associated Varaiables
   println( "Song Position", playList[currentSong].position(), "Song Length", playList[currentSong].length() );
   if ( playList[currentSong].isLooping() && playList[currentSong].loopCount()!=-1 ) println("There are", playList[currentSong].loopCount(), "loops left.");
   if ( playList[currentSong].isLooping() && playList[currentSong].loopCount()==-1 ) println("Looping Infinitely");
   //println("Keyboard Looping Question", looping);
   if ( !playList[currentSong].isPlaying() ) println( "Nothing is playing, Pick a Song" );
   if ( playList[currentSong].isPlaying() && !playList[currentSong].isLooping() ) println("Play Once");
   //
  /* Auto Play Code for Future Use
   Contains instructions from Key Board Short Cuts
   Note: PAIN Thresholds, 3 minutes & 75%, can be variables
   Note: Variables can be set in a Menu Button
   
   if ( playList[currentSong].isPlaying() ) {
   if ( !playList[currentSong].isLooping() && looping==true) looping=false; //Protect .loop() from .rewind() as STOP Loop
   } else if ( looping == false && !playList[currentSong].isPlaying() && playList[currentSong].length() < 60000 ) { //PAIN Minutes is 1 minute, 60, 60,000ms
   //TRUE: if song is less than 1 minute, STOP, I want to hear it from the beginning
   //.pause() in keyPressed() {} is actually STOP
   playList[currentSong].rewind(); //NOTE: !.isPlaying() & .rewind() = STOP
   } else if ( looping == false && !playList[currentSong].isPlaying()  && ( playList[currentSong].position() > playList[currentSong].length()*0.75 ) ) { //Calc PAIN # as % of Song
   //TRUE: if 75% played, we need a STOP & Rewind Button
   //.pause() in keyPressed() {} is actually STOP
   playList[currentSong].rewind(); //NOTE: !.isPlaying() & .rewind() = STOP
   } else {
  /* Future coding
   currentSong = currentSong + 1; //currentSong++; currentSong+=1
   playList[currentSong].play();
   */
}
/* Previous IF-Else
 if ( playList[currentSong].isPlaying() ) {
 //Empty IF, TRUE
 } else {
 playList[currentSong].rewind(); //CAUTION: !.isPlaying() & .rewind() = STOP
 }
 
 //Printing Text to Console | CANVAS
 fill(black); //Note: background for rect()
 rect(width*1/4, height*0, width*1/2, height*1/10); //Text DIV
 fill(white); //Ink
 textAlign (CENTER, CENTER); //Align X&Y, see Processing.org / Reference
 //Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
 int size = 25; //Change the number until it fits, largest font size
 textFont(generalFont, size); //CAUTION: SIZE is hardcoded, needs to be changed manually
 println("String Variable is:", testingOnly);
 text(testingOnly, width*1/4, height*0, width*1/2, height*1/10);
 fill(255); //Reset to white for rest of the program
 //
 */
//} //End draw
//
void keyPressed() {
  if ( key=='A' || key=='a') { //Randomly Pick another song in the Play List
    currentSong = int ( random( numberMusicSongs-numberMusicSongs, numberMusicSongs ) );
    println( "Current Song # is:", currentSong );
    playList.pause(); //Note: computer plays harddrive file,
    playList.rewind(); //     mulitple files will play at the same time
    currentSong = int ( random( numberMusicSongs-numberMusicSongs, numberMusicSongs ) );
    println( "Current Song changed to:", currentSong );
    playList =  minim.loadFile( filePathNameMusic[currentSong] );
    playList.play();
  }
  //
  if ( key=='P' || key=='p' ) { //Play Pause Button
    //How much of the song should play before the Pause Button is actually a rewind button
    if ( playList.isPlaying() ) {
      playList.pause();
    } else {
      playList.play();
    }
  } //End Play Pause Button
  if ( key=='L' || key=='l' ) { //Loop Once
    playList.loop(1);
    looping = true;
  } //End Loop Once
  if ( key=='I' || key=='i' ) { //Loop Infinite Times
    playList.loop();
    looping = true;
  } //End Loop Infinite Times
  if ( key=='S' || key=='s' ) { // STOP Button
    playList.pause();
    playList.rewind(); //Affects LOOP Times
    looping = false;
    // End STOP Button
  }//
  if (playlist.position()<10000 );
  if ( playlist.position()>=10000 && playlist.position()<=playlist.length()*0.75 );
  if ( playlist.position()>playlist.length()*0.75 ) {
    /* NEXT
     - Pauses current song, Rewinds current song, curentSong++, Play current song
     - Error arrayListOutofBounds
     -TBA
     */
    currentSong = int ( random( numberMusicSongs-numberMusicSongs, numberMusicSongs ) );
    println( "Current Song, Random Number:", currentSong );
    playList.pause(); //Note: computer plays harddrive file,
    playList.rewind(); //     mulitple files will play at the same time
    //Try Catch solved arrayListOutofBounds
    if ( currentSong >= numberMusicSongs-1 ) {
      currentSong = 0;
    } else {
      currentSong++
    }
    
    playList =  minim.loadFile( filePathNameMusic[currentSong] );
    playList.play();
  }

  println( "New Value of SKIP", skip, "Position:", playlist.position(), "Crossed Last 75%"), playlist.position()<=playlist.length()*0.75, "\t\tLast 75% starts at:", playList.length()*0.75, "Song Ends at:", playList.length() ) ;
  //
  /* Note: NEXT: example rules for GUI
   - FF: first 10 seconds means NEXT
   - FF: last 25% means NEXT
   - FF means between above, it is a FF Button
   - Note: between the above, NEXT Exists
   
   Preferences, might need to be in draw()
   Local, might need to be Global
   
   Previous Code Statements
   int skip = 5000; //Basic Preference
   if ( key=='H' || key=='h' ) skip = 5000 ;
   if ( key=='G' || key=='g' ) skip = 10000 ;
   if ( key=='G' || key=='g' ) skip = playList.length()*0.25 ;
   */
  //
} //End keyPressed
//
void mousePressed() {
} //End mousePressed
//
//End MAIN Program
//
