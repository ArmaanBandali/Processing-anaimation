class BulletBoost extends PowerUp{
  int bulletBoostColour=#c21010;
  
  BulletBoost(){
    super();
  }
  
  void update(){
    drawbulletBoost();
    if (collision(drone)){
      pushMatrix();
      translate(0,0);
      position.set(-100,-100);
      drone.bulletDamage=2;
      active=true;
      toBePlaced=false;
      placed=false;
      popMatrix();
    }
    super.update();
  }
  
  void drawbulletBoost(){
    if (toBePlaced && !placed){
      position.set(random(0,width),random(0,height));
      toBePlaced=false;
    }
    if (!active){
      pushMatrix();
      translate(position.x, position.y);
      fill(bulletBoostColour,100);
      stroke(bulletBoostColour);
      circle(0,0,radius);
      popMatrix();
      placed=true;
    }
  }
}
