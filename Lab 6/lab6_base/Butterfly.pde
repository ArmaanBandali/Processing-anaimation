class Butterfly {

  //fields
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float bfWidth;

  int removeTimer =-1;
  float rotPos = PI/12;
  float rotVel = 0.07;

  Butterfly(float x, float y, float xSpeed, float ySpeed) {
    this.x=x;
    this.y=y;
    this.xSpeed=xSpeed;
    this.ySpeed=ySpeed;
    bfWidth=100;
  }


  void update() {
    move();
    handleCollision();

    /*if (removeTimer ==-1) { //When removeTimer not started yet
      drawButterfly();      //draw a normal bug
    }*/

    if (removeTimer >0) {
      removeTimer--; 
      rotPos += rotVel;
      
      //make the wing rotate within (-PI/10, PI/10)
      if (rotPos > PI/10 || rotPos < -PI/10) 
      rotVel = -rotVel;

      //drawCapturedButterfly(); //Before removeTimer runs out draw captured bug
    }

    if (removeTimer==0) {       //When removeTimer runs out
      butterflies.remove(this);  //remove this butterfly from list.
    }
  }


  boolean isAlive() {
    return removeTimer==-1;
  }

  boolean captured() {
    boolean capped = false;
    if (isAlive()) {
      removeTimer=60;
      xSpeed=0;
      ySpeed=0;
      capped = true;
    }
    return capped;
  }

  void handleCollision() {
    if (x<-bfWidth/2) x=width+bfWidth/2; 
    if (x>width+bfWidth/2) x=-bfWidth/2;
    if (y<-bfWidth/2) y=height+bfWidth/2;
    if (y>height+bfWidth/2) y=-bfWidth/2;
  }

  //methods
  void move() {
    y+=ySpeed;
    x+=xSpeed;
  }

  void drawCapturedButterfly() {
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
    rotate(rotPos);
    arc(0, 0, 80, 70, radians(170), radians(200));
    popMatrix();

    //make right wing flap
    pushMatrix();
    translate(-10, 0);
    rotate(rotPos);
    arc(10, 0, 80, 70, radians(-30), radians(30));
    popMatrix();
    popMatrix();
  }


  void drawButterfly() {
    if (isAlive()){
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
    else {
      drawCapturedButterfly();
    }
    
  }
  
  boolean hitButterfly(float x, float y) {
    boolean hit = false;

    if ( dist(this.x, this.y, x, y) < bfWidth/2)
      hit = true;

    return hit;
  }

  
}
