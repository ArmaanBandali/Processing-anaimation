class Butterfly {

  //fields
  int x;
  int y;
  int ySpeed;
  int xSpeed;
  int deathTimer=-1;
  float wingRotPos = PI/12;
  float wingRotVel = 0.07;

  Butterfly(int x, int y_, int xSpeed, int ySpeed) {
    this.x=x;
    y=y_;
    this.ySpeed=ySpeed;
    this.xSpeed=xSpeed;
  }
  
  boolean isAlive() {
    return deathTimer==-1;
  }
  
  void kill() {
    deathTimer=60;
    xSpeed=0;
    ySpeed=0;
  }
  
  void handleCollision() {
    if (x<-butterflyWidth/2) x=width+butterflyWidth/2; 
    if (x>width+butterflyWidth/2) x=-butterflyWidth/2;
    if (y<-butterflyWidth/2) y=height+butterflyWidth/2;
    if (y>height+butterflyWidth/2) y=-butterflyWidth/2;
  }

  void update() {
    move();
    handleCollision();
    if (deathTimer==-1) {
      drawMe();
    }
    if (deathTimer>0) {
      deathTimer--; 
      wingRotPos += wingRotVel;
      //make the wing rotate within (-PI/10, PI/10)
      if (wingRotPos > PI/10 || wingRotPos < -PI/10) wingRotVel = -wingRotVel;

      drawDyingButterfly();
    }
    if (deathTimer==0) {
      //remove this butterfly from list.
      butterflies.remove(this);
    }
  }

  //methods
  void move() {

    y+=ySpeed;
    x+=xSpeed;
  }
  
  void drawDyingButterfly() {
    //butterfly
    pushMatrix();
    translate(x, y);
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
    
    //make left wing flap
    pushMatrix();
    translate(-10, 0);
    rotate(wingRotPos);
    arc(0, 0, 80, 70, radians(170), radians(200));
    popMatrix();
    
    //make right wing flap
    pushMatrix();
    translate(-10, 0);
    rotate(wingRotPos);
    arc(10, 0, 80, 70, radians(-30), radians(30));
    popMatrix();
    popMatrix();
  }

  void drawMe() {
    //butterfly
    pushMatrix();
    translate(x, y);
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
