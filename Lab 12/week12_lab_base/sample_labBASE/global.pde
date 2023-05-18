final int EAST=0;
final int WEST=1;
final int SOUTH=2;
final int NORTH=3;

PImage catSitImg;
PImage missileImg;
PImage enemyImg;
PImage bossImg;
PImage collarImg;

Player p;

void showIntroScreen() {
   bg=new Background(loadImage("bg.png")); //Use the same background
   bg.drawMe(0, 0);
   textSize(60);
   fill(0);
   text("Crzay Cat Morto-Combat!", width/2, height/2); //Show a game title
}

void controlEvent(ControlEvent theEvent) {
   if (theEvent.getController().getName() =="Play") { 
      gameState = GAMEPLAY;
      controlP5.getController("Play").hide();   
   }
   if (theEvent.getController().getName() =="Replay") { 
      gameState = GAMEPLAY;
      controlP5.getController("Replay").hide();   
      score=0;
      p.health=p.MAX_HEALTH;
      p.pos.set(0, 200);
   }
}

void loadAssets() {
  textAlign(CENTER);
  enemyImg=loadImage("enemy.png");
  missileImg=loadImage("missile.png");
  bossImg=loadImage("boss.png");
  catSitImg=loadImage("cat_sit_0.png");
  catSitImg.resize(200, 100);
  collarImg=loadImage("collar.png");

  p=new Player(new PVector(0, 200), catSitImg);

}

void playLevel() {
  switch(lvlState) {
  case INTRO:
    if (introTimer>0) introTimer--;
    if (introTimer==0) lvlState=GAMEPLAY;
    showScreen(intro);
    break;
  case GAMEPLAY:
    gamePlay();
    break;
  case BOSS_INTRO:
    showScreen(bossIntro);
    bossIntroTimer--;
    if (bossIntroTimer==0) {
      lvlState=GAMEPLAY;
    }
    if (mousePressed) lvlState=GAMEPLAY; //try either condition to trigger the gameplay...
    break;
  }
}

void gamePlay() {
  if (scroll<8) scroll+=scrollrate;
  if (frameCount%180==0) scrollrate*=1.5;
  //or, try frameCount...
  bg.drawMe(-scroll%bg.img.width, 0);//scroll horizontally at a constant rate, and scroll vertically by the player


  p.update();
  p.drawMe();

  if (up) p.accelerate(upForce);
  if (down) p.accelerate(downForce);
  if (left) p.accelerate(leftForce);
  if (right) p.accelerate(rightForce);
  if (fire) p.fire();

  if (boss==null) {
    for (int i=0; i<enemies.size(); i++) {
      Enemy e=enemies.get(i);
      e.update();
      e.drawMe();
      if (e.collision(p)) {
        p.takeDamage(1);
      }
    }

    if (frameCount%enemySpawnInterval==0) {
      spawnEnemies(); 
      if (random(0, 2) < 1)  //When an enemy is spawned, given 50% chance to spawn a powerup
        spawnPowerup(numPW);
    }


    if (enemies.size()==0||score>=scoreForBoss) { //only initialize the boss once; check if the boss is null -before- initializing it
      bossIntroTimer=120;
      lvlState= BOSS_INTRO; //setting the state to BOSS INTRO and setting the boss timer will make the boss intro screen work
      boss=new Boss(new PVector(width/2, height/2), new PVector(-2, 0), bossImg);
      enemies.clear();
    }
  } else {
    boss.update();
    boss.drawMe();
    if (boss.collision(p)) p.takeDamage(2);
  }

  for (int i=0; i<pickups.size(); i++) {
    Pickup pi=pickups.get(i);
    pi.update();
    pi.drawMe();
    if (pi.collision(p)) pi.takeEffect();
  }

  p.drawHealthBar();
  drawScore();
}

void loseGame() {
  gameState=LOST;
}

void spawnEnemies() {
  while (enemies.size ()<numEn) {
    enemies.add(new Enemy(new PVector(random(width), random(height)), new PVector(0, random(-8, 8)), enemyImg));
  }
}

void spawnPowerup(int spawn) {
  for (int i=0; i<spawn; i++) {
    pickups.add(new Pickup(new PVector(random(width), random(height)), new PVector(0, random(-5, 5)), collarImg));
  }
}

void winGame() {
  gameState=WON;
}



void showScreen(String txt) {
  String text=txt;
  background(255);
  textSize(60);
  fill(0);
  text(txt, width/2, height/2);
  if(txt==LOSE){
    controlP5.getController("Replay").show();
  }
}

void drawScore() {
  pushMatrix();
  translate(width-100, 5);
  noStroke();
  fill(200, 255, 200);
  rect(0, 0, 80, 50);
  textSize(32);
  fill(0);
  text(score, 50, 30);
  popMatrix();
}




void nextLevel() {
  //how to go to next level?
}
