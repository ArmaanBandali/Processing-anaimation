class HealthBoost extends PowerUp{
  int healthBoostColour=#53eb4b;
  
  HealthBoost(){
    super();
  }
  
  void update(){
    drawhealthBoost();
    if (collision(drone)){
      pushMatrix();
      translate(0,0);
      position.set(-100,-100);
      if (drone.health<15){
        drone.health++; 
      }
      active=true; 
      toBePlaced=false;
      placed=false;
      activeTimer=millis();
      popMatrix();
    }
    if(millis()-activeTimer>2000 && active){
      toBePlaced=true;
      active=false;
      activeTimer=millis();
    }
    super.update();
  }
  
  void drawhealthBoost(){
    if (toBePlaced && !placed){
      position.set(random(0,width),random(0,height));
      toBePlaced=false;
      placed=true;
    }
    if (!active){
      pushMatrix();
      translate(position.x, position.y); 
      fill(healthBoostColour,100);
      stroke(healthBoostColour);
      circle(0,0,radius);
      popMatrix();
      placed=true;
    }
  }
}
