class MovingObject {

  PVector pos, vel, acc;
  float damp;
  PImage img;

  MovingObject(PVector pos, PVector vel, PImage img) {
    damp=1;
    acc=new PVector();
    this.pos=pos;
    this.vel=vel;
    this.img=img;
  }

  boolean collision(MovingObject other) {
    return abs(other.pos.x-pos.x)<other.img.width/2+img.width/2
      &&abs(other.pos.y-pos.y)<other.img.height/2+img.height/2;
  }


  void update() {
    move();
    handleWalls();
  }

  void move() {
    vel.add(acc);
    pos.add(vel);
    vel.mult(damp);
    acc.mult(0);
  }

  void accelerate(PVector force) {
    acc.add(force);
  }


  void handleWalls() {
    if (pos.x>width) overSide(EAST);
    if (pos.x<0) overSide(WEST);
    if (pos.y>height) overSide(SOUTH);
    if (pos.y<0) overSide(NORTH);
  }

  void overSide(int side) {
    switch(side) {
    case NORTH:
      pos.y=height;
      break;
    case SOUTH:
      pos.y=0;
      break;
    case EAST:
      pos.x=0;
      break;
    case WEST:
      pos.x=width;
      break;
    }
  }


  void drawMe() {
    pushMatrix();
    translate(pos.x, pos.y);
    image(img, -img.width/2, -img.height/2);
    popMatrix();
  }
}
