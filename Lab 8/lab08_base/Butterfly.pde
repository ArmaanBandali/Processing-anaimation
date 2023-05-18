class Butterfly extends MovingObject {

  //fields
  float damp;
  int MAX_HEALTH=10;
  int health=MAX_HEALTH;

  ArrayList<Bullet> bullets = new ArrayList<Bullet>();

  Butterfly(PVector pos) {
    super(pos, new PVector(), new PVector(100, 100));
    damp=.8;
  }

  //methods
  void move() {
    super.move();
    vel.mult(damp);
  }
  
  void damage() {
    health--;
    if (health==0) println("You are killed! Game Over");
  }

  void handleWalls() {
    if (pos.x<-dim.x/2) pos.x=width+dim.x/2;
    if (pos.x>width+dim.x/2) pos.x=-dim.x/2;
    if (pos.y<-dim.x/2) pos.y=height+dim.x/2;
    if (pos.y>height+dim.x/2) pos.y=-dim.x/2;
  }

  void update() {
    super.update();

    for (int i=0; i<bullets.size(); i++) {
      Bullet b =bullets.get(i);
      b.update();
      b.drawMe();

      //check each enemy for collision with the ith bullet.
      for (int j=0; j<enemies.size(); j++) {
        Enemy e = enemies.get(j);
        b.hit(e);
      }

      //if a bullet is not alive, remove it from the list of bullets
      if (!b.isAlive) bullets.remove(i);
    }
  }

  //returns true if e has collided with this Butterfly.
  boolean hit(Enemy e) {
    return abs(pos.x-e.pos.x)<dim.x/2+e.dim.x/2&&
      abs(pos.y-e.pos.y)<dim.y/2+e.dim.y/2;
  }

  void fire() {
    //When firing, a new Bullet object will be added into the list.
    //Since the bullet should be shot from the Butterfly, so it's position 
    //should be the same as that of the current Butterfly object
    bullets.add(new Bullet(new PVector(pos.x, pos.y), new PVector(0, -15)));
  }

  void drawMe() {
    //butterfly
    pushMatrix();
    translate(pos.x, pos.y);
    //body
    fill(0);
    stroke(0);
    rect(-10, -40, 20, 80, ROUND);

    //attenae
    line(-10, -40, -10, -60);
    noFill();
    arc(-20, -60, 20, 20, -PI, 0);
    line(10, -40, 10, -60);
    arc(20, -60, 20, 20, -PI, 0);

    //wings
    //stroke(255, 50, 50);
    noStroke();
    fill(255, 120, 120, 180);
    arc(-10, 0, 80, 70, radians(110), radians(250));
    arc(10, 0, 80, 70, radians(-70), radians(70));
    popMatrix();
  }
  
  void drawHealthBar() {
    int max=200;
    pushMatrix();
    translate(20, 10);
    noStroke();
    fill(255,0,0);
    float playerHealthPercentage=(float) health/MAX_HEALTH;
    rect(0,0,max*playerHealthPercentage,30);
    popMatrix();
  }
}
