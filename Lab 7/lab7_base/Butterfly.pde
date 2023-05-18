class Butterfly extends Character {

  //fields for its attributes
  float dampeningFactor;
  ArrayList<Bullet> bullets;
  
  //constructor
  Butterfly(PVector pos) {
    super(pos);
    position=pos;
    velocity= new PVector();
    //set its velocity to 0 so that it will stand still intially
    dampeningFactor=0.75;
    bullets = new ArrayList<Bullet>();
  }

  //methods
  void move() {
    velocity.mult(dampeningFactor);
    position.add(velocity);
  }

  void accelerate(PVector acc) {
    velocity.add(acc);
  }

  void update() {
    move();
    super.handleWalls();
    for (int i=0; i<bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.update();
      b.drawMe();
      for (int j=0; j<enemies.size(); j++) {
        Enemy e = enemies.get(j);
        b.hit(e);
      }
      if(!b.isAlive) bullets.remove(i);
    }
  }
  
  void fire() {
    bullets.add(new Bullet(new PVector(position.x, position.y), new PVector(0, -15)));
  }

  void drawDyingMe() {
    //butterfly
    pushMatrix();
    translate(position.x, position.y);
    //body
    fill(0);
    stroke(0);
    rect(-10, -40, 20, 80, ROUND);

    //attenae
    line(-10, -40, -10, -60);
    noFill();
    arc(-20, -60, 20, 20, -PI, 0);


    //wings
    stroke(255, 50, 50);
    fill(0);
    arc(-10, 0, 80, 70, radians(150), radians(230));
    arc(10, 0, 80, 70, radians(-70), radians(70));
    popMatrix();
  }

  void drawMe() {
    //butterfly
    pushMatrix();
    translate(position.x, position.y);
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
    stroke(255, 50, 50);
    fill(255, 120, 120, 180);
    arc(-10, 0, 80, 70, radians(110), radians(250));
    arc(10, 0, 80, 70, radians(-70), radians(70));
    popMatrix();
  }
}
