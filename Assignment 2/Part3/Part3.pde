//Game by Armaan Bandali, February 15, 2021
//
//Break hearts with your bullets, then reload by shooting the ammo box
//
//Primary Level ECO Features: Heart has a breaking effect when clicked, then fades away before being removed
//      Custom cursor to look like a gun reticle that flashes red when clicked
//Intermediate Level ECO Features: Wings on each heart flap with push and pop matrix
//      Difficulty scales the longer a heart is kept alive by increasing its speed over time
//Advanced Level Features: 3 different achievements show up at the bottom left corner of the screen when triggered
//      achievement values are arbitrary and are smaller for the sake of grading
//      Must reload bullets by clicking the ammo box 

ArrayList<Heart> hearts = new ArrayList<Heart>();
Cursor cursor = new Cursor();
Score score = new Score();
Bullets bullets = new Bullets();
GameHandler gameHandler = new GameHandler();

PFont font;
int heartWidth=100;
int ammoBoxWidth=50;
int background=#fadef7;
boolean hit=false;
boolean speedUp=false;
int numSpeedUps=1;

void setup(){
  size(900,600);
  font=createFont("Cambria", 32);
  int x=0;
  int y=0;
  for (int i=0; i < 6; i++){
    x = (int)random(0,width);
    y = (int)random(0,height);
    hearts.add(new Heart(x,y));
  }
}

void draw(){
  background(background);
  gameHandler.updateGameCounter();
  gameHandler.updateNumCharacters(hearts.size());
  if (gameHandler.gameCounter()%(5000*numSpeedUps)>4900){
    if (speedUp){
      for (int j=0; j < hearts.size(); j++){
        hearts.get(j).updateVelocity(); //<>//
      }
      numSpeedUps++;
    }
    speedUp=false;
  }
  else{
    speedUp=true;
  }
  if (gameHandler.newCharacter() && gameHandler.numberOfCharacters()<10){
    gameHandler.addNewCharacter();
    int x = (int)random(0,width);
    int y = (int)random(0,height);
    hearts.add(new Heart(x,y));
  }
  bullets.drawAmmoBox();
  for (int i=0; i < hearts.size(); i++){
    if (hearts.get(i).isAlive()){
      hearts.get(i).drawHeart();
      hearts.get(i).updatePosition();
    }
    else {
      if (!hearts.get(i).death()){
        hearts.get(i).drawBrokenHeart();
      }
      else{
        hearts.remove(i);
      }
    }
  }
  score.displayScore();
  cursor.drawCursor();
  bullets.drawBullets();
  gameHandler.displayAchievements();

}

void mousePressed(){
  bullets.updateBullets();
  cursor.cursorTimerUpdate();
  if (bullets.ammoOut() && dist(mouseX,mouseY,bullets.ammoX(),bullets.ammoY())<ammoBoxWidth/2){
    bullets.refreshBullets();
    bullets.ammoClicked();
    gameHandler.ammoBoxesClicked();
    hit=true;
  }
  for (int i=0; i < hearts.size(); i++){
    if (hearts.get(i).isAlive() && dist(mouseX, mouseY, hearts.get(i).xPosition, hearts.get(i).yPosition)<heartWidth/2 && bullets.numberOfBullets()!=0){////////////////////////////////////
      score.updateScore();
      hearts.get(i).killed();
      gameHandler.updateNoMiss();
      gameHandler.updateKilled();
      hit=true;
    }
  }
  if (!hit){
    gameHandler.resetNoMiss();
  }
  gameHandler.updateNumCharacters(hearts.size());
  hit=false;
}
