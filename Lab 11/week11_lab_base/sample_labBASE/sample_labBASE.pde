//final int LEVEL_ONE=0;
//final int LEVEL_TWO=1;


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
