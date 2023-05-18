class Player extends Character{
  
  float fanAngle=0;
  int droneColour=#30302f;
  ArrayList<Projectile> syringes;
  boolean hit=false;
  boolean hurt=false;
  int timeOfHurt=0;
  int iFrames=0;
  int i=0;
  int bulletDamage=1;
  int bulletTicker=0;
  int hotDroneColour=#c21010;
  
  Player(PVector position, PVector velocity, int health, float characterWidth, float characterHeight){
    super(position, velocity, health, characterWidth, characterHeight);
    syringes=new ArrayList<Projectile>();
  }
  
  void checkProjectiles(){ 
    for (int i=0;i<drone.syringes.size();i++){
      for (int j=0;j<viruses.size();j++){
        if(drone.syringes.get(i).hit(viruses.get(j)) && !viruses.get(j).killed){
          viruses.get(j).decreaseHealth(bulletDamage);
          if (viruses.get(j).health<=0){
            viruses.get(j).killed();
            if(viruses.get(j).boss){
              bossAlive=false;
            }
          }
          hit=true;
        }
      }
      
      if (hit){
        drone.syringes.remove(i);
        hit=false;
      }
    }
  }
  
  void update(){
    velocity.mult(0.8);
    super.update();
    accelerate();
    updateBullets();
    checkProjectiles();
    if (hurt){
      if (millis()-timeOfHurt>1000){
        hurt();
      }
    }
    displayHealth();
  }
  
  void accelerate(){
    if (up) super.accelerate(upAcc);
    if (left) super.accelerate(leftAcc);
    if (right) super.accelerate(rightAcc);
    if (down) super.accelerate(downAcc);
  }
  
  void drawCharacter(){
    if (hurt){
      iFrames++;
      if (iFrames%10<5){
        return;
      }
      if (iFrames>10){
        iFrames=0;
      }
    }
    pushMatrix();
    translate(position.x,position.y);
    
    if (drone.bulletDamage==2){
      stroke(hotDroneColour);
    }
    else{
      stroke(0);
    }
    
    fill(droneColour);
    rect(-20,-20,40,40);
    
    pushMatrix();
    rotate(PI/4);
    noStroke();
    for (int i=0; i<4; i++){
      rotate(PI/2);
      fill(droneColour);
      rect(0,-3,-50,6);
      pushMatrix();
      translate(-50,0);
      rotate(fanAngle);
      fill(0);
      ellipse(0,0,10,50);
      rotate(PI/2);
      ellipse(0,0,10,50);
      popMatrix();
    }
    popMatrix();
    fill(0);
    if (drone.bulletDamage==2){
      stroke(hotDroneColour);
    }
    else{
      noStroke();
    }
    circle(0,0,15);
    rect(-2.5,-40,5,45);
    fanAngle+=PI/15;
    
    popMatrix();
    
    if (shield){
      drawShield();
    }
  }
  
  void fire(){           
    if (syringes.size()<10){ 
      if(bulletTicker/3==1){
        bulletDamage=1;
        bulletTicker=0;
        bulletBoost.toBePlaced=true; 
        bulletBoost.active=false;
      }
      syringes.add(new Projectile(new PVector(position.x-5,position.y-70),new PVector(0,-5)));
      if(bulletDamage==2){
        bulletTicker++;
      }
    }
  }
  
  void updateBullets(){
    for (int i=0;i<syringes.size();i++){
      syringes.get(i).update();
    }
  }
  
  void timeOfHurt(){
    timeOfHurt=millis();
  }
  
  void hurt(){
    hurt=!hurt;
  }
  
  void displayHealth(){
    pushMatrix();
    translate(0,0);
    fill(0);
    stroke(0);
    if (health>0) rect(10,10,40*health,25);
    popMatrix();
  }
  
  void drawShield(){
    pushMatrix();
    translate(position.x,position.y);
    fill(shieldColour,100);
    stroke(shieldColour);
    circle(0,0,characterWidth+50);
    popMatrix();
  }
  
  void decreaseHealth(int damage){
    if (shield){
      shield=false;
      shieldPotion.toBePlaced=true; 
      shieldPotion.active=false;
      return;
    }
    gameHandler.survivalTimer=millis();
    gameHandler.noDamageCounter=0;
    health-=damage;
  }
  
  void killed(){
    gameHandler.gameOver=true;
  }
  
}
