class BasicEnemy extends Character{
  
  int virusColour1=#0d9e2f;
  int virusColour2=#054013;
  int virusColourDead=0;
  int virusColour=0;
  float alpha=255;
  float poreMovement=0;
  int poreDirection=1;
  boolean killed=false;
  int timeOfDeath=0;
  int deathTime=1000;
  boolean boss;
  
  BasicEnemy(PVector position, PVector velocity, int health, float characterWidth, float characterHeight){
    super(position, velocity, health, characterWidth, characterHeight);
    boss=false;
    shield=int(random(0,4))%4==0; //1 in 5 chance to have a shield
  }
  
  void update(){ 
    super.update();
    if(hitCharacter(drone)&&!killed){
      damagePlayer();
    }
  }
  
  void killed(){
    killed=true;
    timeOfDeath=millis();
    score.incrementScore();
    gameHandler.noDamageCounter++;
  }
  
  void damagePlayer(){
     if(!drone.hurt){ 
       drone.decreaseHealth(1);
       if(drone.health==0){
         drone.killed();
       }
       drone.timeOfHurt();
       drone.hurt();
     }
  }
  
  void drawCharacter(){
    if (killed && millis()-timeOfDeath>deathTime){
      viruses.remove(this);
    }
    if (killed){
      virusColour=virusColourDead;
      alpha=255-(int)map(millis()-timeOfDeath,0,1000,0,255);
    }
    else{
      virusColour=virusColour1;
      alpha=255;
    }
    pushMatrix();
    translate(position.x,position.y);
    
    fill(virusColour,alpha);
    noStroke();
    pushMatrix();
    for (int i=0; i<10; i++){
      rotate(PI/5);
      if (i%2==0){
        rect(-2,-25+poreMovement/8,4,8);
        triangle(-4,-28+poreMovement/8,4,-28+poreMovement/8,0,-20+poreMovement/8);
      }
      else{
        rect(-2,-25,4,8);
        triangle(-4,-28,4,-28,0,-20);
      }
    }
    popMatrix();
    circle(0,0,40);
    fill(virusColour2,alpha);
    stroke(0,alpha);
    strokeWeight(0.5);
    circle(-6,-10,5);
    circle(8,2,8);
    circle(-11,13,3);
    strokeWeight(1);
    
    if (poreMovement>16 || poreMovement<-16){
      poreDirection*=-1;
    }
    poreMovement+=poreDirection;
    
    popMatrix();
    
    if (shield){
      drawShield();
    }
  }
}
