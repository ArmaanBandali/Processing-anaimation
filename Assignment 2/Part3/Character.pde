class Heart{
  int xPosition;
  int yPosition;
  float xVelocity;
  float yVelocity;
  float wingAngle=0;
  int wingDirection=1;
  boolean alive=true;
  int timeOfDeath=0;
  int alpha=255;
  
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
  
  void drawBrokenHeart(){
    //alpha-=1;
    //alpha=255-255/(millis()-timeOfDeath);
    alpha=255-(int)map(millis()-timeOfDeath,0,2000,0,255);
    pushMatrix();
    translate(xPosition, yPosition);
    
    stroke(0,alpha);
    fill(0,alpha);
    pushMatrix();
    translate(-5,0);
    pushMatrix();
    translate(-40,0);
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
    fill(#a10303,alpha);
    arc(-25,0,50,50,PI,2*PI,PIE);
    beginShape();
    vertex(-50,0);
    curveVertex(-75,-175);
    curveVertex(-50,0);
    curveVertex(0,50);
    curveVertex(175,100);
    vertex(-10,40);
    vertex(0,30);
    vertex(-10,20);
    vertex(0,10);
    vertex(0,0);
    endShape();
    popMatrix();
    
    stroke(0,alpha);
    fill(0,alpha);
    pushMatrix();
    translate(5,0);
    scale(-1,1);
    pushMatrix();
    translate(-40,0);
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
    fill(#a10303,alpha);
    arc(-25,0,50,50,PI,2*PI,PIE);
    beginShape();
    vertex(-50,0);
    curveVertex(-75,-175);
    curveVertex(-50,0);
    curveVertex(0,50);
    curveVertex(175,100);
    vertex(-10,40);
    vertex(0,30);
    vertex(-10,20);
    vertex(0,10);
    vertex(0,0);
    endShape();
    popMatrix();
    
    popMatrix();
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
  
  boolean isAlive(){ ///////////////////////////
    return alive;
  }
  
  void killed(){
    alive=false;
    timeOfDeath();
  }
  
  void timeOfDeath(){
    timeOfDeath=millis();
  }
  
  boolean death(){
    return (millis()-timeOfDeath > 2000);
  }
  
  void updateVelocity(){
    if (xVelocity<0 && xVelocity>-5){
      xVelocity-=1;
    }
    if (xVelocity>=0 && xVelocity<5){
      xVelocity+=1;
    }
    if (yVelocity<0 && yVelocity>-5){
      yVelocity-=1;
    }
    if (yVelocity>=0 && yVelocity<5){
      yVelocity+=1;
    }
  }
}
