class Heart{
  int xPosition;
  int yPosition;
  float xVelocity;
  float yVelocity;
  float wingAngle=0;
  int wingDirection=1;
  
  Heart(int xPosition, int yPosition){
    this.xPosition=xPosition;
    this.yPosition=yPosition;
    xVelocity=random(-5,5);
    yVelocity=random(-5,5);
  }
  
  void drawHeart(){
    pushMatrix();
    
    translate(xPosition, yPosition);
    
    stroke(0);
    fill(0);
    pushMatrix();
    translate(-40,0);
    rotate(wingAngle);
    beginShape();
    vertex(0,0);
    vertex(-40,-40);
    vertex(-100,50);
    vertex(-60,30);
    vertex(-50,40);
    vertex(-30,30);
    vertex(-20,40);
    vertex(0,0);
    endShape();
    popMatrix();
    
    pushMatrix();
    scale(-1,1);
    translate(-40,0);
    rotate(wingAngle);
    beginShape();
    vertex(0,0);
    vertex(-40,-40);
    vertex(-100,50);
    vertex(-60,30);
    vertex(-50,40);
    vertex(-30,30);
    vertex(-20,40);
    vertex(0,0);
    endShape();
    popMatrix();
    
    noStroke();
    fill(#a10303);
    arc(-25,0,50,50,PI,2*PI,PIE);
    arc(25,0,50,50,PI,2*PI,PIE);
    beginShape();
    vertex(-50,0);
    curveVertex(-75,-175);
    curveVertex(-50,0);
    curveVertex(0,50);
    curveVertex(175,100);
    vertex(0,0);
    endShape();
    
    pushMatrix();
    scale(-1,1);
    beginShape();
    vertex(-50,0);
    curveVertex(-75,-175);
    curveVertex(-50,0);
    curveVertex(0,50);
    curveVertex(175,100);
    vertex(0,0);
    endShape();
    popMatrix();
    
    popMatrix();
    updateWingAngle();
  }
  
  void updateWingAngle(){
    if (wingAngle>PI/6 || wingAngle<-PI/6){
      wingDirection*=-1;
    }
    wingAngle+=(PI/90)*wingDirection;
  }
  
  void updatePosition(){ //same as move character
    detectWall();
    xPosition+=xVelocity;
    yPosition+=yVelocity;
  }
  
  void detectWall(){
    if (xPosition > width+120){
      xPosition=-120;
    }
    if (yPosition > height+50){
      yPosition=-50;
    }
    if (xPosition < -120){
      xPosition=width+120;
    }
    if (yPosition < -50){
      yPosition=height+50;
    }
  }




}
