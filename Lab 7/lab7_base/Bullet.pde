/*
A Bullet should disappear when it either hits an enemy or goes out of the window – needs a field of boolean
    ¤ isAlive: set to false when hitting an enemy or going out of the window
A Bullet should have a hit(Enemy e) method
    ¤ which detects collision against the enemy e and kill both the enemy and itself when that occurs
A Bullet should have a hanldWalls() method
    ¤ which kills itself when it goes out of the window
Apparently, it needs update(), and drawMe() method as well
*/

class Bullet{
  PVector pos, vel, dim;
  boolean isAlive;
  
  Bullet(PVector pos, PVector vel) {
    this.pos=pos;
    this.vel=vel;
    dim=new PVector(5, 25);
    isAlive=true;
  }
  
  void hit(Enemy e){
    if(abs(pos.x-e.position.x)<dim.x/2+e.characterWidth/2 && abs(pos.y-e.position.y)<dim.y/2+e.characterWidth/2) {
      e.killed();
      isAlive=false;
    }
  }
    
    
  void handleWalls() {
    if (abs(pos.x-width/2)>width/2||abs(pos.y-height/2)>height/2){
      isAlive=false;
    }
  }
  
  void move() {
    pos.add(vel);
  }
  
  void update() {
    move();
    handleWalls();
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
