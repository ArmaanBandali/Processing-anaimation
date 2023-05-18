float charWidth=50; //diameter of "wing" arc, plus width of rect. body

int count = 15;
Butterfly player;
ArrayList<Enemy> enemies=new ArrayList<Enemy>();


void setup() {
  size(1000, 800);

  player=new Butterfly(new PVector(width/2, height/2));

  for (int i=0; i<count; i++) {
    enemies.add(new Enemy(new PVector(random(charWidth/2, width-charWidth/2), random(charWidth/2, height-charWidth/2)), 
      new PVector(random(-5, 5), random(-5, 5))));
  }
}

void draw() {
  background(120, 120, 255);

  player.update();
  player.drawMe();
  
  if (up) player.accelerate(upAcc);
  if (left) player.accelerate(leftAcc);
  if (right) player.accelerate(rightAcc);
  if (down) player.accelerate(downAcc);

  for (int i=0; i<enemies.size(); i++) {
    Enemy e=enemies.get(i);
    e.update();
    e.drawMe();
    if (e.bump(player)){
      player.damage();
      e.killed();
    }
    if (abs(e.pos.x-player.pos.x)<e.dim.x+player.dim.x+40 && abs(e.pos.y-player.pos.y)<e.dim.y+player.dim.y+40){
      if (e.pos.x<player.pos.x){
        e.accelerate(new PVector(0.3,0));
      }
      else{
         e.accelerate(new PVector(-0.3,0));
      }
      if (e.pos.y<player.pos.y){
        e.accelerate(new PVector(0,0.3));
      }
      else{
         e.accelerate(new PVector(0,-0.3));
      }
    }
    player.drawHealthBar();
  }
}

//int butterflyWidth=100;

//Butterfly b;
//int MAX_HEALTH=10;

//ArrayList<Enemy> enemies=new ArrayList<Enemy>();

//void setup() {
//  size(600, 600);
//  b=new Butterfly(new PVector(width/2, height-100));

//  for (int i=0;i<10;i++) {
//    enemies.add(new Enemy(new PVector(random(width), -100), new PVector(0, random(8))));
//  }
//}



//void draw() {
//  background(255);
//  if (up) b.accelerate(upForce);
//  if (down) b.accelerate(downForce);
//  if (left) b.accelerate(leftForce);
//  if (right) b.accelerate(rightForce);

//  b.update();

//  for (int i=0;i<enemies.size();i++) {
//    Enemy e=enemies.get(i);
//    e.update();
//    if (e.collision(b)) {
//      b.hit();
//    }
//  }

//  drawHealthBar();
//}


//void drawHealthBar() {
//  int max=200;
//  pushMatrix();
//  translate(100, 10);
//  fill(255, 0, 0);
//  float playerHealthPercentage=0;
//  rect(-100, -25, max*playerHealthPercentage, 50);
//  popMatrix();
//}
