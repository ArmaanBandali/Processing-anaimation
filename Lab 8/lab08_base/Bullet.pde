class Bullet extends MovingObject {
  //fields for its properties
  boolean isAlive;  //current bullet will be destroied if false 

  Bullet(PVector pos, PVector vel) {
    super(pos, vel, new PVector(5, 25));
    isAlive=true;
  }

  void handleWalls() {
    if (abs(pos.x-width/2)>width/2||abs(pos.y-height/2)>height/2) {
      isAlive=false;
    }
  }

  //method for collision detection b/w current bullet & an enemy
  void hit(Enemy e) {
    //Since this is a collision between an oval and a circle, we need to use the approach
    //based on bouding box
    if (abs(pos.x-e.pos.x)<dim.x/2+e.dim.x/2 && abs(pos.y-e.pos.y)<dim.y/2+e.dim.y/2) {
      e.killed();
      isAlive=false; //set the flag to false so that it will be removed - done in Butterfly
    }
  }

  void drawMe() {
    pushMatrix();
    translate(pos.x, pos.y);
    noStroke();
    fill(160, 0, 0);
    ellipse(0, 0, dim.x, dim.y);
    popMatrix();
  }
}
