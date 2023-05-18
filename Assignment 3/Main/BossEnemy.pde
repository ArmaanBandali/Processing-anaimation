class BossEnemy extends BasicEnemy{
  
  float poreShift=0;
  int bossVirusColour=#d61111;
  int bossVirusColour2=#820909;
  ArrayList<BossProjectile> plasmids;
  int projectileTimer=0;
  boolean hit=false;
  
  BossEnemy(PVector position, PVector velocity, int health, float characterWidth, float characterHeight){
    super(position, velocity, health, characterWidth, characterHeight);
    plasmids=new ArrayList<BossProjectile>();
    deathTime=3000;
    boss=true;
  }
  
  void checkProjectiles(){
    for (int i=0;i<plasmids.size();i++){
      if(i>=plasmids.size()){
        continue;
      }
      plasmids.get(i).update(this);
      if(i>=plasmids.size()){           
        continue;
      }
      if (plasmids.get(i).hit(drone) && !drone.hurt){
        drone.decreaseHealth(2);
        if(drone.health==0){
          drone.killed();
        }
        drone.timeOfHurt();
        drone.hurt();
        hit=true;
      }
      if (hit){
        plasmids.remove(i);
        hit=false;
      }
    }
  }
  
  void fire(){
    plasmids.add(new BossProjectile(new PVector(position.x,position.y),new PVector(random(-1.5,1.5),random(-1.5,1.5)))); //direction
  }
  
  void update(){
    super.update();
    checkProjectiles();
    if (killed && millis()-timeOfDeath>deathTime){
      viruses.remove(this);
    }
    if (millis()-projectileTimer>3000){ 
      projectileTimer=millis();
      fire();
    }
  }
  
  void drawCharacter(){
    if (killed){
      virusColour=color(random(0,255),random(0,255),random(0,255));
      alpha=255-(int)map(millis()-timeOfDeath,0,3000,0,255);
    }
    else{
      virusColour=bossVirusColour;
      alpha=255;
    }
    
    pushMatrix();
    translate(position.x,position.y);
    
    pushMatrix();
    scale(2.5,2.5);
    fill(virusColour, alpha);
    noStroke();
    pushMatrix();
    for (int i=0; i<10; i++){
      rotate(PI/5+poreShift);

      if (i%2==0){
        rect(-2,-25+poreMovement/8,4,8);
        triangle(-4,-28+poreMovement/8,4,-28+poreMovement/8,0,-20+poreMovement/8);
      }
      else{
        rect(-2,-25,4,8);
        triangle(-4,-28,4,-28,0,-20);
      }
      rotate(-poreShift);
    }
    popMatrix();
    circle(0,0,40);
    
    fill(bossVirusColour2, alpha);
    stroke(0, alpha);
    strokeWeight(0.5);
    circle(-6,-14,5);
    circle(10,6,8);
    circle(-11,13,3);
    strokeWeight(1);
    
    fill(0,alpha);
    stroke(0,alpha);
    if(!killed){
      triangle(-10,-12,-12,-8,-3,-5);
      ellipse(-8,-2,2,5);
    }
    else{
      strokeWeight(1);
      line(-12,2,-2,-4);
      line(-12,-4,-2,2);
      strokeWeight(1);
    }
    pushMatrix();
    scale(-1,1);
    if(!killed){
      triangle(-10,-12,-12,-8,-3,-5);
      ellipse(-8,-2,2,5);
    }
    else{
      strokeWeight(1);
      line(-12,2,-2,-4);
      line(-12,-4,-2,2);
      strokeWeight(1);
    }              
    popMatrix();
    if (!killed){
      arc(0,5,10,5,0,PI);
    }
    else{
      arc(0,10,10,5,PI,2*PI);
    }
    
    if (poreMovement>16 || poreMovement<-16){
      poreDirection*=-1;
    }
    poreMovement+=poreDirection;
    poreShift+=PI/360;
    popMatrix();
    
    popMatrix();
    
    if (shield){
      drawShield();
    }
  }
}
