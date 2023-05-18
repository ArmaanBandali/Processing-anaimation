class MovingObject {
  
  PVector pos, vel, dim;
  
  MovingObject(PVector pos, PVector vel, PVector dim) {
    this.pos=pos;
    this.vel=vel;
    this.dim=dim;
  }
  
  void move() {
    pos.add(vel);
  }
  
  void accelerate(PVector force) {
    vel.add(force);
  }
  
  boolean collision(MovingObject other) {
    return abs(pos.x-other.pos.x)<dim.x/2+other.dim.x/2&&abs(other.pos.y-pos.y)<(dim.y/2+other.dim.y/2);
  }
  
  void update() {
    move();
    handleWalls();
  }
  
  void handleWalls() {
    if (pos.x>width+dim.x/2) pos.x=-dim.x/2;
    if (pos.x<-dim.x/2) pos.x=width+dim.x/2;
    if (pos.y>height+dim.y/2) pos.y=-dim.y/2;
    if (pos.y<-dim.x/2) pos.y=height+dim.y/2;
  }
  
  void drawMe() {
  }
  
  boolean bump(MovingObject other){
    return abs(pos.x-other.pos.x)<dim.x/2+other.dim.x/2&&abs(other.pos.y-pos.y)<(dim.y/2+other.dim.y/2);
  }
}
