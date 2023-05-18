float speed = 2;
PVector upForce = new PVector(0, -speed * 24);
PVector leftForce = new PVector(-speed, 0);
PVector rightForce = new PVector(speed, 0);
boolean up, left, right;
float grav = 2;
PVector gravForce = new PVector(0, grav);
PFont font;

Character player;
//ArrayList<Block> blocks = new ArrayList<Block>();
GameWorld gameWorld;
Timer timer;

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) up = true;
    else if (keyCode == LEFT) left = true;
    else if (keyCode == RIGHT) right = true;
  }
}
void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) up = false;
    else if (keyCode == LEFT) left = false;
    else if (keyCode == RIGHT) right = false;
  }
}
void setup() {
  size(800, 600); 
  frameRate(24);
  font=createFont("Cambria",32);
  
  stroke(200);
  strokeWeight(2);
  fill(63);
  player = new Character(new PVector(width/4, height/4));
  player.jumping = true;
  gameWorld =  new GameWorld();
  timer =  new Timer();

  /*blocks.add(new Block(new PVector(width/2, height - 20), new PVector(width, 40)));
  blocks.add(new Block(new PVector(200, height - 120), new PVector(200, 40)));
  blocks.add(new Block(new PVector(400, height - 240), new PVector(200, 40)));
  blocks.add(new Block(new PVector(700, height - 360), new PVector(200, 40)));
  */
}
void draw() {
  background(191,238,255);
  gameWorld.drawMe(player);
  timer.drawMe();
  if (up && !player.jumping) {
    player.jump(upForce);
  }
  if (left) player.move(leftForce);
  if (right) player.move(rightForce);

  player.update();

  if (player.block != null) {
    if (!player.block.isOn(player)) {
      player.jumping = true;
    }
  }
  if (player.jumping) {
    player.move(gravForce);
    for (int i = 0; i < gameWorld.blocks.size(); i++) {
      Block b = gameWorld.blocks.get(i);
      if (b.check(player)) {
        if (player.vel.y > 0) {
          player.landOn(b);
        }
        else {
          player.fall();
        }
      }
    }
  }
  /*for (int i = 0; i < blocks.size(); i++) {
    blocks.get(i).drawMe();
  }*/
  timer.update();
  player.drawMe();
}
