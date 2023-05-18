float charWidth=100; //diameter of "wing" arc, plus width of rect. body
Butterfly player;
ArrayList<Enemy> enemies=new ArrayList<Enemy>();


void setup() {
  size(1000, 800);

  PVector initPosition = new PVector(width/2,height/2);
  player=new Butterfly(initPosition);
  for (int i=0; i<10; i++) {
    enemies.add(new Enemy(new PVector(random(charWidth/2, width-charWidth/2), 
    random(charWidth/2, height-charWidth/2)), 
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
  }
}
