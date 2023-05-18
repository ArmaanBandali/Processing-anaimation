class Character{
  PVector position, velocity;
  float characterWidth, characterHeight;
  int health;
  boolean shield=false;
  int shieldColour=#95beed;
  
  Character(PVector position, PVector velocity, int health, float characterWidth, float characterHeight){
    this.position=position;
    this.velocity=velocity;
    this.health=health;
    this.characterWidth=characterWidth;
    this.characterHeight=characterHeight;
  }
  
  void moveCharacter(){
    position.add(velocity);
  }
  
  void accelerate(PVector acceleration){
    velocity.add(acceleration);
  }
  
  void drawCharacter(){
    fill(0);
    rect(-1,-1,2,2);
  }
  
  boolean hitCharacter(Character character){
    return abs(position.x-character.position.x)<character.characterWidth/2+characterWidth/2-5 && abs(position.y-character.position.y)<character.characterHeight/2+characterHeight/2-5;
  }
  
  void decreaseHealth(int damage){
    if (shield){
      shield=false;
      return;
    }
    health-=damage;
  }
  
  void checkWalls(){
    if (position.x-characterWidth/2>width){
      position.x=0;
    }
    if (position.x<-characterWidth/2){
      position.x=width;
    }
    if (position.y-characterHeight/2>height){
      position.y=0;
    }
    if (position.y<-characterWidth/2){
      position.y=height;
    }
  }
  
  void update(){
    moveCharacter();
    checkWalls();
  }
  
  void drawShield(){
    pushMatrix();
    translate(position.x,position.y);
    fill(shieldColour,100);
    stroke(shieldColour);
    circle(0,0,characterWidth+10);
    popMatrix();
  }
}
