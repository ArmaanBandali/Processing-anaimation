class PowerUp{
  boolean active=false;
  boolean toBePlaced=true;
  boolean placed=false;
  PVector position;
  int radius=30;
  int activeTimer=0;
  
  PowerUp(){
    position=new PVector(random(0,width),random(0,height)); 
  }
  
  void update(){
    if(millis()-activeTimer>2000){
      toBePlaced=true;
      activeTimer=millis();
    }
  }
  
  boolean collision(Player character){
    return abs(position.x-character.position.x)<character.characterWidth/2+radius/2-5 && abs(position.y-character.position.y)<character.characterHeight/2+radius/2-5; ///test
  }
}
