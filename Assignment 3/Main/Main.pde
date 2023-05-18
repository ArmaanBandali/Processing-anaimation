int windowWidth=900;
int windowHeight=600;
PVector initPos=new PVector(450,300);
PVector initVel=new PVector(0,0);
float droneDiameter=96;
int droneHealth=10;
float virusDiameter=56;
int virusHealth=2;
float bossVirusDiameter=140;
int bossVirusHealth=6;
int virusRespawnTimer=0;
boolean bossAlive=true;
PFont font;


ArrayList<BasicEnemy> viruses=new ArrayList<BasicEnemy>();
Player drone=new Player(initPos, initVel, droneHealth, droneDiameter, droneDiameter);
Score score=new Score();
GameHandler gameHandler=new GameHandler();
BulletBoost bulletBoost=new BulletBoost();
ShieldPotion shieldPotion=new ShieldPotion();
HealthBoost healthBoost=new HealthBoost();


void setup(){
  size(1200,800);
  for (int i=0; i<10; i++){
    viruses.add(new BasicEnemy(new PVector(random(0,width),random(0,height)), new PVector(random(-2,2),random(-2,2)), virusHealth, virusDiameter, virusDiameter));
  }
  viruses.add(new BossEnemy(new PVector(random(0,width),random(0,height)), new PVector(random(-2,2),random(-2,2)), bossVirusHealth, bossVirusDiameter,bossVirusDiameter));
  font=createFont("Cambria", 32);
}

int k=0;
void draw(){
  background(#ffffff);
  if (!gameHandler.gameBegin || gameHandler.gameOver){
    if(gameHandler.gameOver){
      gameHandler.drawGameOverScreen();
    }
    if(!gameHandler.rulesBegin){
      gameHandler.drawStartScreen();
    }
    if(!gameHandler.gameBegin && gameHandler.rulesBegin){
      gameHandler.drawRulesScreen();
    }
  }
  else{
    if(gameHandler.timerStart==false){ //start achievement timers only when game starts
      gameHandler.timerStart=true;
      gameHandler.survivalTimer=millis();
    }
    drone.drawCharacter();
    drone.update();
    for(int i=0; i<viruses.size();i++){
      if (i>=viruses.size()){ //fix indexing error
        continue;
      }
      viruses.get(i).drawCharacter();
      if (i>=viruses.size()){ 
        continue;
      }
      viruses.get(i).update();
    }
    if (millis()-virusRespawnTimer>2000 && viruses.size()<11){  //respawn a virus every 2 seconds if 10 aren't already on the screen
      virusRespawnTimer=millis();
      if(!bossAlive){ //respawn a boss if it's not alive
        viruses.add(new BossEnemy(new PVector(random(0,width),random(0,height)), new PVector(random(-2,2),random(-2,2)), bossVirusHealth, bossVirusDiameter,bossVirusDiameter)); 
        bossAlive=true;
      }
      else{
        viruses.add(new BasicEnemy(new PVector(random(0,width),random(0,height)), new PVector(random(-2,2),random(-2,2)), virusHealth, virusDiameter, virusDiameter)); 
      }
    }
    score.displayScore();
    gameHandler.update();
    bulletBoost.update();
    shieldPotion.update();
    healthBoost.update();
  }
  
}
