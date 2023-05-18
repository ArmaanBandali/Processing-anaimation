class Heart{
  int xPosition;
  int yPosition;
  float xVelocity;
  float yVelocity;
  
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
  }
  
  void updatePosition(){ //same as move character
    xPosition+=xVelocity;
    yPosition+=yVelocity;
  }
  
}
