// Health powerup shows up as a black dot and restores 3 health
//   Health powerup on line 103 and in class
GameWorld gw;
Avatar avt;
int countMons = 10;
PImage monImg;
PImage avtImg;
ArrayList<Monster> monsters = new ArrayList<Monster>();
Powerup powerup;
int state;
final int LEVEL_ONE = 0;  //For the gameplay part, let's name it as such with a foresight of level expansion
final int LEVEL_TWO=1;
final int WON = 2;
final int LOST = 3;
PFont font;

void setup() {
  size(1100,800);
  font=createFont("Arial",32);
  state=LEVEL_ONE;
  monImg=loadImage("monster.png");
  avtImg=loadImage("character.png");
  //load the monster image and add the monsters
  for (int i =0; i < 10; i++) {
    spawnMon();
  }
  gw=new GameWorld();
  avt=new Avatar(avtImg,new PVector(width/2-avtImg.width/2,height-avtImg.height/2));
  powerup=new Powerup();
}

void draw() {
  background(0);
  textFont(font);
  textSize(60);
  switch(state) {
   case LEVEL_ONE: gamePlay(); break;
   case LEVEL_TWO: gamePlay(); break;
   case WON: text("You Win!",width/2-120,height/2); break;
   case LOST: text("Game Over!",width/2-150,height/2);
   break;
   //When winning, output message "You Win!"
   //When losing, output message "Game Over"

  }
}

void gamePlay() {
  gw.display();

  avt.update();
  avt.drawMe();

  if (up) avt.move(upAcc);
  if (down) avt.move(downAcc);
  if (left) avt.move(leftAcc);
  if (right) avt.move(rightAcc);

  for (int i =0; i < monsters.size(); i++) {
    Monster mon = monsters.get(i);

    mon.update();

    if (mon.collision(avt)) {
      avt.hit();
      monsters.remove(mon);
      if (monsters.size() < 5) spawnMon();
    }

    avt.drawHealthBar();
  }
  if(powerup.collision(avt)&&powerup.active){
    powerup.active=false;
    powerup.done=true;
    avt.health+=3;
  }
  powerup.drawMe();
}

void gamePlay2() {
  gw.display();

  avt.update();
  avt.drawMe();

  if (up) avt.move(upAcc);
  if (down) avt.move(downAcc);
  if (left) avt.move(leftAcc);
  if (right) avt.move(rightAcc);

  for (int i =0; i < monsters.size(); i++) {
    Monster mon = monsters.get(i);

    mon.update();

    if (mon.collision(avt)) {
      avt.hit();
      monsters.remove(mon);
      if (monsters.size() < 10) spawnMon();
    }

    avt.drawHealthBar();
  }
  if(powerup.collision(avt)&&powerup.active){
    powerup.active=false;
    powerup.done=true;
    avt.health+=3;
  }
  powerup.drawMe();
}

void clearLevel(){
  for(int i=monsters.size()-1;i<0;i--){
    monsters.remove(i);
  }
  for(int i=0;i<15;i++){
    spawnMon();
  }
  avt.repositionAtBottomOfScreen();
}

  void spawnMon() {
    monsters.add(new Monster(monImg, new PVector(random(monImg.width, width-monImg.width), random(monImg.height/2, height/4)), new PVector(random(-10, 10), 0)));
  }

  void textScreen(String str) {
    background(255);
    PFont font = loadFont("Arial-Black-48.vlw");
    fill(0, 255, 255);
    textFont(font, 60);
    text(str, width/2-120, height/2);
  }
