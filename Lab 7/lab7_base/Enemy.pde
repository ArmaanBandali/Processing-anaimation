class Enemy extends Character {
  //fields for its attributes

  //constructor
  Enemy(PVector position, PVector velocity) {
    super(position, velocity);
  }
  
  void killed() {
    enemies.remove(this);
  }

  //methods
  void move() {
    position.add(velocity);
  }

  void update() {
    move();
    super.handleWalls();
  }

  void drawMe() {
    pushMatrix();
    strokeWeight(5);
    stroke(255, 255, 0);
    fill(0, 255, 0);
    translate(position.x, position.y);
    ellipse(0, 0, characterWidth, characterWidth);
    popMatrix();
  }
}
