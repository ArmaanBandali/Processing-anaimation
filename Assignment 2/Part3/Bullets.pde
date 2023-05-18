class Bullets{
  int numberOfBullets=8;
  int ammoX=0;
  int ammoY=0;
  boolean ammoOut=false;
  int bulletTopColour=#8a8a8a;
  int bulletBottomColour=#ab8411;
  int ammoColour=#b58851;
  int ammoColour2=#8c6a3f;
  
  void drawBullets(){
    pushMatrix();
    translate(width-300,height-90);
    stroke(0);
    for (int i=0; i < numberOfBullets; i++){
      fill(bulletTopColour);
      arc(30+30*i,30,20,20,PI,2*PI);
      fill(bulletBottomColour);
      rect(20+30*i,30,20,30);
    }
    popMatrix();
  }
  
  void drawAmmoBox(){
    pushMatrix();
    if (!ammoOut()){
      ammoX=(int)random(0,width-25);
      ammoY=(int)random(0,height-25);
    }
    translate(ammoX,ammoY);
    fill(ammoColour);
    stroke(0);
    rect(-25,-25,50,50);
    fill(ammoColour2);
    rect(-20,-20,40,40);
    line(-20,-10,20,-10);
    line(-20,0,20,0);
    line(-20,10,20,10);
    
    fill(ammoColour);
    beginShape();
    vertex(-20,16);
    vertex(16,-20);
    vertex(20,-20);
    vertex(20,-16);
    vertex(-16,20);
    vertex(-20,20);
    vertex(-20,16);
    endShape();
    
    beginShape();
    vertex(-20,-20);
    vertex(-20,-16);
    vertex(-4,0);
    vertex(0,-4);
    vertex(-16,-20);
    vertex(-20,-20);
    endShape();
    
    pushMatrix();
    scale(-1,-1);
    beginShape();
    vertex(-20,-20);
    vertex(-20,-16);
    vertex(-4,0);
    vertex(0,-4);
    vertex(-16,-20);
    vertex(-20,-20);
    endShape();
    popMatrix();
    
    popMatrix();
    ammoOut=true;
  }
  
  void refreshBullets(){
    numberOfBullets=8;
  }
  
  void updateBullets(){
    if (numberOfBullets!=0){
      numberOfBullets--;
    }
  }
  
  int numberOfBullets(){
    return numberOfBullets;
  }
  
  boolean ammoOut(){
    return ammoOut;
  }
  
  void ammoClicked(){
    ammoOut=false;
  }
  
  int ammoX(){
    return ammoX;
  }
  
  int ammoY(){
    return ammoY;
  }
  
}
