class Monster {
  PImage img;
  PVector pos;
  PVector vel;

  Monster(PImage img, PVector pos, PVector vel) {
    this.img = img;
    this.pos = pos;
    this.vel = vel;
  }

  void detectEdges() {
   
    if (pos.x <= 0 || (pos.x + img.width) >= width) {
      vel.x *= -1;
      vel.y = img.height; 
    }

    if (pos.y  >= height/2) {
      pos.y = -img.height;
    }
  }

  boolean collision(Avatar other) {
    if (dist(pos.x, pos.y, other.pos.x, other.pos.y) < img.width/2 + img.width/2) {
      return true;
    }
    return false;
  }


  void update() {
    pos.add(vel);
    detectEdges();
    drawMe();
    if (vel.y > 0) vel.y = 0;   
  }

  void drawMe() {
    pushMatrix();
    translate(pos.x, pos.y);
    image(img, 0, 0);
    popMatrix();
  }
}
