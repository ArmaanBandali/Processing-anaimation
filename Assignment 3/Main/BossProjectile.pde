class BossProjectile extends Projectile{
  
  int bossProjectileColour1=#db322c;
  int bossProjectileColour2=#3acf50;
  int bossProjectileColour3=#3a7fcf;
  float rotation=0;
  
  BossProjectile(PVector position, PVector initialVelocity){
    super(position, initialVelocity);
    dimensions.set(8,8);
  }
  
  void update(BossEnemy parent){
    move();
    drawProjectile();
    checkWalls(parent);
  }
  
  void checkWalls(BossEnemy parent){
    if (position.x>width+dimensions.x+8 || position.x<-dimensions.x-8 || position.y>height+dimensions.y+8 || position.y<-dimensions.y-8){
      parent.plasmids.remove(this);
    }
  }
  
  void drawProjectile(){
    pushMatrix();
    translate(position.x,position.y);
    
    noFill();
    stroke(bossProjectileColour3);
    strokeWeight(2);
    circle(0,0,30);
    strokeWeight(1);
    noStroke();
    rotate(rotation);
    fill(bossProjectileColour1);
    ellipse(0,0,20,10);
    fill(bossProjectileColour2);
    ellipse(0,0,10,20);
    
    rotation+=PI/90;
    popMatrix();
  }
  
  boolean hit(Character character){
    return abs(position.x-character.position.x)<character.characterWidth/2+dimensions.x && abs(position.y-character.position.y)<character.characterWidth/2+dimensions.y;
  }
}
