import ddf.minim.*;

PImage landingScreen;
PImage hallway;
PImage gamingRoom;
PImage backyard;
PImage backyardbg;
PImage street;
PImage bedroom;
PImage[] character;
PImage[] lawnMower;
PImage trashBag;
PImage trashBin;
PImage trashBin2;
PImage trashBin3;
PImage card;
PImage[] gopher;
PImage dog;
PImage gameOver;
PImage lawn; //unique
PImage dialogueBubble;
PImage hand1;
PImage hand2;

PImage symbol1;
PImage symbol2;
PImage symbol3;
PImage symbol4;
PImage symbol5;
PImage symbol6;
PImage symbol7;
PImage symbol8;
PImage symbol9;
PImage symbol10;
PImage symbol11;
PImage symbol12;

Minim minim;
AudioPlayer bg, effect;

gameState state; 
level gameLevel;

Background background;
Character character1;
LawnMower lawnMower1;
TrashBag trashBag1;
Gopher gopher1;
Dog dog1;
Hand hand;
ArrayList<Dialogue> dialogue=new ArrayList<Dialogue>();


boolean lawnMowed=false; //whether lawn game is done for this level
boolean trashTakenOut=false; //whether trash game is done for this level
boolean brotherEntertained=false; //whether memory game is done for this level
boolean won=false; //whether you beat level three
boolean dialogueLock=false; //whether dialogue is being displayed
float roundTimer=75000; //initial round timer
float maxTime=75000; //maximum round timer
float clockedTime=0; //keeps track of the time you beat a level
int colorTimer=0;
boolean timerActive=false;


void setup(){
  size(1200,800);
  imageMode(CORNER);
  textAlign(CENTER);
  state=gameState.landingScreen;
  gameLevel=level.levelOne;
  createImages();
  initDialogues();
  
  background=new Background();
  character1=new Character(new PVector(0,0),character[0],new PVector(0,0));
  lawnMower1=new LawnMower(new PVector(400,400),lawnMower[0]);
  trashBag1=new TrashBag(new PVector(100,height-180),trashBag);
  gopher1=new Gopher(new PVector(),gopher[0]);
  dog1=new Dog(new PVector(550,height-dog.height),dog);
  hand=new Hand(new PVector(width/2,height/2),hand1);
  
  minim = new Minim(this);
  bg=minim.loadFile("Sounds/music_zapsplat_game_music_action_fun_funky_electro_disco_023.mp3");
  bg.loop();
  
  //state=gameState.openingGaming;
  //state=gameState.mowingGame;
  //state=gameState.trashGame;
  //state=gameState.memoryGame;
  //state=gameState.hallway;
  //state=gameState.gameEnd;
}

void draw(){
  background(#ffffff);
  switch(state){
    case gameStart:
      background.drawBGstartScreen();
    ; break;
    case gameOver:
      background.drawBGgameOver();
    ; break;
    case landingScreen:
      background.drawBGlandingScreen();
    ; break;
    case mowingGame:
      background.drawBGbackyard();
      mowingGame();
    ; break;
    case trashGame:
      background.drawBGstreet();
      trashGame();
    ; break;
    case memoryGame:
      background.drawBGbedroom();
      memoryGame();
    ; break;
    case hallway:
      background.drawBGhallway();
      updateTimer();
      drawTimer();
    ; break;
    case gameEnd:
      background.drawBGgameEnd();
    ; break;
    default:
    ;
  }
  activeDialogue();
}
