class Projectile{
  PVector position,velocity;
  int vaccineColour=#4b9cf2;
  PVector dimensions;
  int hotBulletColour=#c21010;
  boolean hotBullet;
  
  Projectile(PVector position, PVector initialVelocity){
    this.position=position;
    this.velocity=initialVelocity;
    dimensions=new PVector(14,45);
    if (drone.bulletDamage==2){
      hotBullet=true;
    }
    else{
      hotBullet=false;
    }
    
  }
  
  void move(){
    position.add(velocity);
  }
  
  void checkWalls(){
    if (position.x>width+dimensions.x || position.x<-dimensions.x || position.y>height+dimensions.y || position.y<-dimensions.y){
      drone.syringes.remove(this);
    }
  }
  
  void drawProjectile(){
    pushMatrix();
    translate(position.x,position.y);
    
    noFill();
    if (hotBullet){
      stroke(hotBulletColour);
    }
    else{
      stroke(0);
    }
    rect(0,0,10,30);
    fill(vaccineColour);
    rect(0,0,10,20);
    noFill();
    line(5,-10,5,0);
    line(5,30,5,35);
    line(-2,35,12,35);
    line(8,5,10,5);
    line(8,10,10,10);
    line(8,15,10,15);
    line(8,20,10,20);
    
    popMatrix();
  }
  
  void update(){
    move();
    drawProjectile();
    checkWalls();
  }
  
  boolean hit(Character character){
    return abs(position.x-character.position.x)<character.characterWidth/2 && abs(position.y-character.position.y)<character.characterWidth/2;
  }
}
