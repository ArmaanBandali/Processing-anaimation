class ShieldPotion extends PowerUp{
  int shieldPotionColour=#95beed;
  
  ShieldPotion(){
    super();
  }
  
  void update(){
    super.update();
    drawShieldPotion();
    if (collision(drone)){
      pushMatrix();
      translate(0,0);
      position.set(-100,-100);
      drone.shield=true;
      active=true;
      toBePlaced=false;
      placed=false;
      popMatrix();
    }
  }
  
  void drawShieldPotion(){
    if (toBePlaced && !placed){
      position.set(random(0,width),random(0,height));
      toBePlaced=false;
    }
    if (!active){
      pushMatrix();
      translate(position.x, position.y); 
      fill(shieldPotionColour,100);
      stroke(shieldPotionColour);
      circle(0,0,radius);
      popMatrix();
      placed=true;
    }
  }
}
