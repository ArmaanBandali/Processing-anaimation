class Enemy extends MovingObject{
  //fields for its attributes


  //Constructor
  Enemy(PVector pos, PVector vel) {
    super(pos, vel, new PVector(50, 50));
  }

  //methods
  
  void killed() {
    enemies.remove(this);
  }
  
  void drawMe() {
    pushMatrix();
    strokeWeight(5);
    stroke(255, 255, 0);
    fill(0, 255, 0);
    translate(pos.x, pos.y);
    ellipse(0, 0, dim.x, dim.x);
    popMatrix();
  }
}
//class Enemy {


//  PVector pos, vel, dim;
 

//  Enemy(PVector pos, PVector vel) {
//    this.pos=pos;
//    this.vel=vel;
//    dim=new PVector(80, 80);
//  }

//  void update() {
//    move();
//    handleWalls();
//    render();
//  }

//  void accelerate(PVector force) {
//    vel.add(force);
//  }
  
//   boolean collision(Butterfly other) {
//    return abs(pos.x-other.pos.x)<dim.x/2+other.dim.x/2&&abs(other.pos.y-pos.y)<dim.y/2+other.dim.y/2;
//  }


//  void hit() {
//    enemies.remove(this);
//  }

//  void move() {
//    pos.add(vel);
//  }

//  void render() {
//    pushMatrix();
//    fill(0, 255, 0);
//    translate(pos.x, pos.y);
//    ellipse(0, 0, dim.x, dim.y);
//    popMatrix();
//  }

//  void handleWalls() {
//    if (pos.x>width+dim.x/2) pos.x=-dim.x/2;
//    if (pos.x<-dim.x/2) pos.x=width+dim.x/2;

//    if (pos.y<-dim.y/2) pos.y=height+dim.y/2;
//    if (pos.y>height+dim.y/2) pos.y=-dim.y/2;
//  }
//}
