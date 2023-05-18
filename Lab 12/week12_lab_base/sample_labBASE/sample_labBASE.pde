//final int LEVEL_ONE=0;
//final int LEVEL_TWO=1;
import controlP5.*;

ControlP5 controlP5;
Button play;
Button replay;


/// stuff for playing a single level.
final int INTRO=0;
final int GAMEPLAY=1;
final int BOSS_INTRO=2;
final int WON=3;
final int LOST=4;

final String intro="BEGIN LEVEL ONE!";
final String bossIntro="ENTER THE BOSS!";
final String WIN="You did it!";
final String LOSE="You failed...";

int gameState;
int lvlState;
int introTimer = 120;
int bossIntroTimer = 1;

int score;
int scoreForBoss = 5;
int numEn=2;
int enemySpawnInterval=100;
int numPW = 1;

int scrollrate=1;
int scroll;
PVector scrollForce;

ArrayList<Pickup> pickups=new ArrayList<Pickup>();
ArrayList<Enemy> enemies=new ArrayList<Enemy>();
Boss boss;

Background bg;

void setup() {
  size(1000, 500);
  textAlign(CENTER);
  loadAssets();
  controlP5 = new ControlP5(this);
  play = controlP5.addButton("Play", 0, width/2-60, height-200, 150, 50);
  replay = controlP5.addButton("Replay", 0, width/2-60, height-200, 150, 50);
  controlP5.getController("Replay").hide(); 
  PFont pfont = createFont("Arial", 16, true);       //An alternative way for you to create a PFont object
  play.getCaptionLabel().setFont(pfont);             //Set the font to the one created play.setColorLabel(color(0));                                       //Set caption color to be black
  play.setColorForeground(color(0, 250, 0));         //Set foreground color to green
  play.setColorBackground(color(0, 250, 250));       //Set background color to cyan 

  //initialize level

  //reset all the fields
  //level wide reset
  bg=new Background(loadImage("bg.png"));
  lvlState=INTRO;
 
  scrollForce=new PVector(-2, 0);

  //put the enemies and pickups in the list
  //initializePickups();
  spawnEnemies();
}

void draw() {
  switch(gameState) {
  case INTRO:
    showIntroScreen();
    break;
  case WON:
    showScreen(WIN);
    break;
  case LOST:
    showScreen(LOSE);
    break;
  default:
    playLevel();
  }
}
