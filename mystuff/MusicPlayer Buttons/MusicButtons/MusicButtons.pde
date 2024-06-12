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
int numberSoundEffects = 4; //DEV Verify, OS able to count (CS20 Solution)
int numberMusicSongs = 11; //DEV Verify, OS able to count (CS20 Solution)
String[] filePathNameMusic = new String[numberMusicSongs];
String[] filePathNameSoundEffect = new String[numberSoundEffects];
AudioPlayer playList; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
AudioPlayer soundEffects; //"Play List" for Sound Effects
int currentSong = numberMusicSongs - numberMusicSongs; //JAVA starts counting at 0, not for all languages
int skip = 5000; //Default Preference, see draw() | keyPressed()
//
int appWidth, appHeight;
//
Boolean looping=false;
Boolean ignoreNextAutoPlayPause=false, ignoreNextAutoPlayStop=false;
int pausePosition=0; //Default playList.play() parameter
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
  String pathwaySoundEffects = "../../audio/soundEffects/"; //Relative Path
  String pathwayMyMusic = "../../audio/MyMusic/"; //Relative Path
  String quitButtonSound = "Suspense";
  String duvet = "BôaDuvet";
  String commas = "AyraStarrCommas";
  String MASC = "DojaCatMASC";
  String drive = "drivebreakbeat";
  String forest = "forestlullaby";
  String pink = "JustForMe";
  String pantheress = "Pain";
  String solitude = "solitudedark";
  String summer = "SummertimeSadness";
  String Rihanna = "TakeABow";
  String Tems = "TemsMeU";
  String extension = ".mp3";
  //println ( pathwaySoundEffects+quitButtonSound+extension );
  //println ( "Relative Pathway:", pathwayMusic+duvet+extension );
  String pathQuitButtonSound = sketchPath( pathwaySoundEffects + quitButtonSound + extension ); //Absolute Path
  //
  filePathNameMusic[currentSong+1] = pathwayMyMusic + duvet + extension;
  //println( currentSong, filePathNameMusic[currentSong] );
  //Equivalent Functions: ++ | +=1
  filePathNameMusic[currentSong+=1] = pathwayMyMusic + commas + extension;
  //println( currentSong, filePathNameMusic[currentSong] );
  filePathNameMusic[currentSong+=1] = pathwayMyMusic + MASC + extension;
  //println( currentSong, filePathNameMusic[currentSong] );
  filePathNameMusic[currentSong+=1] = pathwayMyMusic + drive + extension;
  //println( currentSong, filePathNameMusic[currentSong] );
  filePathNameMusic[currentSong+=1] = pathwayMyMusic + forest + extension;
  //println( currentSong, filePathNameMusic[currentSong] );
  filePathNameMusic[currentSong+=1] = pathwayMyMusic + Rihanna + extension;
  //println( currentSong, filePathNameMusic[currentSong] );
  filePathNameMusic[currentSong+=1] = pathwayMyMusic + pantheress + extension;
  //println( currentSong, filePathNameMusic[currentSong] );
  filePathNameMusic[currentSong+=1] = pathwayMyMusic + solitude + extension;
  //println( currentSong, filePathNameMusic[currentSong] );
  filePathNameMusic[currentSong+=1] = pathwayMyMusic + summer + extension;
  //println( currentSong, filePathNameMusic[currentSong] );
  filePathNameMusic[currentSong+=1] = pathwayMyMusic + Tems + extension;
  //println( currentSong, filePathNameMusic[currentSong] );
  filePathNameMusic[currentSong+=1] = pathwayMyMusic + pink + extension;
  //println( currentSong, filePathNameMusic[currentSong] );
  //
  filePathNameSoundEffect[0] = pathQuitButtonSound;
  //println ( "Absolute Pathway:", filePathNameSoundEffect[0] ); //pathQuitButtonSound
  //
  soundEffects = minim.loadFile( filePathNameSoundEffect[0] );
  //
  //Random Start Prototype
  println( "Current Song, Random Number:", int ( random(0, 8) ) );
  //
  //Note: Music starts before CANVAS ... Purpose of Player
  //Note: See Easter Egg about Time-On and Looping Songs
  println(currentSong, filePathNameMusic[currentSong]);
  playList =  minim.loadFile( filePathNameMusic[currentSong] ); // "" is compiler error
  playList.loop(0); //Testing Only
  //
} //End setup
//
void draw() {
    /*
  //Instrpection of Booleans and Associated Varaiables
   println( "Song Position", playList.position(), "Song Length", playList.length() );
   if ( playList.isLooping() && playList.loopCount()!=-1 ) println("There are", playList.loopCount(), "loops left.");
   if ( playList.isLooping() && playList.loopCount()==-1 ) println("Looping Infinitely");
   //println("Keyboard Looping Question", looping);
   if ( !playList.isPlaying() ) println( "Nothing is playing, Pick a Song" );
   if ( playList.isPlaying() && !playList.isLooping() ) println("Play Once");
   */
  //
  //Random Start Prototype
  //println( "Current Song, Random Number:", currentSong );
  //
  /* Auto Play Code for Future Use
   Contains instructions from Key Board Short Cuts
   Note: PAIN Thresholds, 3 minutes & 75%, can be variables
   Note: Variables can be set in a Menu Button
   */
  if ( playList.isPlaying() ) {
    if ( !playList.isLooping() && looping==true) looping=false; //Protect .loop() from .rewind() as STOP Loop
  } else if ( looping == false && !playList.isPlaying() && playList.length() < 180000 ) { //PAIN Minutes is 3 minutes, 180s, 180,000ms
    //TRUE: if song is less than 3 minutes, STOP, I want to hear it from the beginning
    //.pause() in keyPressed() {} is actually STOP
    playList.rewind(); //NOTE: !.isPlaying() & .rewind() = STOP
  } else if ( looping == false && !playList.isPlaying()  && ( playList.position() > playList.length()*0.75 ) ) { //Calc PAIN # as % of Song
    //TRUE: if 75% played, we need a STOP & Rewind Button
    //.pause() in keyPressed() {} is actually STOP
    playList.rewind(); //NOTE: !.isPlaying() & .rewind() = STOP
  } else {
    /* Future coding: see keyPressed FF Key between 10s & 75%
     println( "Current Song # is:", currentSong );
     playList.pause(); //Note: computer plays harddrive file,
     playList.rewind(); //     mulitple files will play at the same time
     //Try Catch solves arrayListOutOfBounds
     if ( currentSong >= numberMusicSongs-1 ) { //Note: posssible error when !=, better code ... currentSong<0
     currentSong = 0;
     } else {
     currentSong++;
     }
     println( "Current Song changed to:", currentSong );
     playList =  minim.loadFile( filePathNameMusic[currentSong] );
     playList.play();
     */
    println( "Else of IF-Elseif-Else ( .isPlaying) " );
  }
  //Debugging else of AutoPlay with println() & IF to mimic else of IF-Elseif-Else (computer has made mistake)
  //println("Playing Boolean:", playList.isPlaying(), "\tCurrent Song is:", currentSong, "DO NOT Press FF:", playList.position()>playList.length()*0.75, "\t\tSong Position:", playList.position(), "End of Song:", playList.length() );
  //
  if ( !playList.isPlaying() && ignoreNextAutoPlayStop==false && looping==false && ignoreNextAutoPlayPause==false ) { //ERROR: ELSE Required, STOP & PAUSE broken, BOOLEAN Needed
    //Note: 3rd time for NEXT Code
    println( "Additional IF !playList.isPlaying, First IF Portion" );
    playList.pause(); //Note: computer plays harddrive file,
    playList.rewind(); //     mulitple files will play at the same time
    //Try Catch solves arrayListOutOfBounds
    if ( currentSong >= numberMusicSongs-1 ) { //Note: posssible error when !=, better code ... currentSong<0
      currentSong = 0;
    } else {
      currentSong++;
    }
    //println( "Current Song changed to:", currentSong );
    playList =  minim.loadFile( filePathNameMusic[currentSong] );
    playList.play();
  } else if ( !playList.isPlaying() && ignoreNextAutoPlayStop==false && looping==true && ignoreNextAutoPlayPause==false ) {
    //EMPTY Else
    //println( "Additional IF !playList.isPlaying, First Else-If" );
  } else if ( !playList.isPlaying() && ignoreNextAutoPlayStop==false && looping==false && ignoreNextAutoPlayPause==true ) {
    //EMPTY Else
    println( "Additional IF !playList.isPlaying, Second Else-If ... Postion is ...", playList.position() );
  } else {
    //EMPTY Else: no code is exectured, means ignores NEXT Feature in draw()
    //
    /* Solution Notes for Required BOOLEAN
     - Boolean made TRUE in keyPressed() PAUSE or STOP, returns ignoring NEXT
     - Boolean made FALSE in keyPressed() PLAY or STOP or LOOP, returns executing NEXT
     */
     //println( "Additional IF !playList.isPlaying, ELSE Loop" );
  }
  //
} //End draw
//
void keyPressed() {
   if ( key=='A' || key=='a') { //Randomly Pick another song in the Play List
    currentSong = int ( random( numberMusicSongs-numberMusicSongs, numberMusicSongs ) );
    println( "Current Song, Random Number:", currentSong );
    playList.pause(); //Note: computer plays harddrive file,
    playList.rewind(); //     mulitple files will play at the same time
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
  } // End STOP Button
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
    if ( key=='G' || key=='g' ) { //Two Preference Option
    println ( "New Value of SKIP", skip, "Position:", playList.position(), "Crossed Last 75%", playList.position()>playList.length()*0.75, "\t\tLast 75% starts at:", playList.length()*0.75, "Song Ends at:", playList.length() ) ;
    if ( skip == 5000 ) {
      skip = int ( playList.length()*0.25 ); //tuncated to nearest millisecond
    } else {
      skip = 5000;
    }
    println ( "New Value of SKIP", skip, "Position:", playList.position(), "Crossed Last 75%", playList.position()>playList.length()*0.75, "\t\tLast 75% starts at:", playList.length()*0.75, "Song Ends at:", playList.length() ) ;
  }
  /* Repeating Code
   - NOTE: two repetitions of the same code exist
   - If a change happens to one, both should be automatically changed
   - Best Practice: Procedural Programming
   */
  if ( key=='F' || key=='f' ) {
    /* NEXT Code
     - Order of Nested IFs: <10 seconds, between 10s & 75%, >75%, then else allows for regular skip on any file when not playing
     - Create a void next() to group this code if needing to use it other places
     - NEXT Button
     */
    if ( playList.position()<10000 ) {
      println( "Current Song # is:", currentSong );
      playList.pause(); //Note: computer plays harddrive file,
      playList.rewind(); //     mulitple files will play at the same time
      //Try Catch solves arrayListOutOfBounds
      if ( currentSong >= numberMusicSongs-1 ) { //Note: posssible error when !=, better code ... currentSong<0
        currentSong = 0;
      } else {
        currentSong++;
      }
      println( "Current Song changed to:", currentSong );
      playList =  minim.loadFile( filePathNameMusic[currentSong] );
      playList.play();
    }
    //CAUTION: inequalities do not confuse computer
    if ( playList.position()>=10000 && playList.position()<=playList.length()*0.75 ) playList.skip( skip ) ; //SKIP Forward 1 second (1000 milliseconds);
    if ( playList.position()>playList.length()*0.75 ) {
      /* NEXT
       - Pauses current song, Rewinds current song, currentSong++, Play current song
       - ERROR: arrayListOutOfBounds
       - TBA
       */
      println( "Current Song # is:", currentSong );
      playList.pause(); //Note: computer plays harddrive file,
      playList.rewind(); //     mulitple files will play at the same time
      //Try Catch solves arrayListOutOfBounds
      if ( currentSong >= numberMusicSongs-1 ) { //Note: posssible error when !=
        currentSong = 0;
      } else {
        currentSong++;
      }
      println( "Current Song changed to:", currentSong );
      playList =  minim.loadFile( filePathNameMusic[currentSong] );
      playList.play();
    }

    println ( "New Value of SKIP", skip, "Position:", playList.position(), "Crossed Last 75%", playList.position()>playList.length()*0.75, "\t\tLast 75% starts at:", playList.length()*0.75, "Song Ends at:", playList.length() ) ;
  }
  if ( key=='R' || key=='r' ) {
    /* Previous Code
     - Order of Nested IFs: <10 seconds, between 10s & 75%, >75%, then else allows for regular skip on any file when not playing
     - Create a void next() to group this code if needing to use it other places
     */
    playList.skip( -skip ) ; //SKIP Reverse 1 second (1000 milliseconds)
    println ( "New Value of SKIP", skip, "Position:", playList.position(), "Crossed Last 75%", playList.position()>playList.length()*0.75, "\t\tLast 75% starts at:", playList.length()*0.75, "Song Ends at:", playList.length() ) ;
  }
  //
  /* Note: Basic PREVIOUS Code
   println( "Current Song # is:", currentSong );
   playList.pause(); //Note: computer plays harddrive file,
   playList.rewind(); //     mulitple files will play at the same time
   //Try Catch solves arrayListOutOfBounds
   if ( currentSong <= 0-1 ) { //Note: posssible error when !=, better code ... currentSong<0
   currentSong = numberMusicSongs;
   } else {
   currentSong++;
   }
   println( "Current Song changed to:", currentSong );
   playList =  minim.loadFile( filePathNameMusic[currentSong] );
   playList.play();
   }
   */
  //
} //End keyPressed
//
void mousePressed() {
} //End mousPressed
//
//End MAIN Program
//
