//Global Variables
//Minim minim; //creates object to access all functions
int numberSoundEffects = 4; //DEV Verify, OS able to count (CS20 Solution)
int numberMusicSongs = 11; //DEV Verify, OS able to count (CS20 Solution)
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
  String  duvet = "BôaDuvet";
  String lana = "SummertimeSadness";
  String  pinkpantheress= "Pain";
  String pink = "JustForMe";
  String Rihanna = "TakeABow";
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
  String pathduvetSong = sketchPath( pathwayMyMusic + BôaDuvet + extension );//Absolute Pathway
  String pathlanaSong = sketchPath( pathwayMyMusic + SummertimeSadness + extension );//Absolute Pathway
  String pathpinkpantheressSong = sketchPath( pathwayMyMusic + Pain + extension );//Absolute Pathway
  String pathpinkSong = sketchPath( pathwayMyMusic + JustForMe + extension );//Absolute Pathway
  String pathRihannaSong = sketchPath( pathwayMyMusic + TakeABow + extension );//Absolute Pathway
  println ("Absolute Pathway:", pathRihannaSong ); //pathQuitButtonSound
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
void buttons(){
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
  }//END MUTE
  //
  if ( key=='A' || key=='a') { //Randomly Pick another song in the Play List
    currentSong = int ( random( numberMusicSongs-numberMusicSongs, numberMusicSongs ) );
    println( "Current Song, Random Number:", currentSong );
    playList.pause(); //Note: computer plays harddrive file,
    playList.rewind(); //     mulitple files will play at the same time
    playList =  minim.loadFile( filePathNameMusic[currentSong] );
    playList.play();
  //
  //
} //End keyPressed
//
void mousepressed(){
} //End mousePressed
//
//End MAIN Program
//
