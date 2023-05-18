class Gopher extends GameObject{
  int activeTimer=0;
  int spawnTimer=0;
  
  Gopher(PVector pos, PImage img){
    super(pos, img);
    active=false;
  }
  
  //check for collision with lawnmower
  boolean collision(){
    if(lawnMower1.direction==2 || lawnMower1.direction==3){
      return abs(lawnMower1.position.x-(position.x+dimensions.x/2))<lawnMower1.dimensions.y/2+dimensions.x/2 && abs(lawnMower1.position.y-(position.y+dimensions.y/2))<lawnMower1.dimensions.x/2+dimensions.y/2;
    }
    else{
      return super.collision(lawnMower1);
    }
  }
  
  //draw the gopher
  void drawMe(){
    if(active) super.drawMe();
  }
  
  //animate the gopher, check for collisions, and respawn the gopher
  void update(){
    animate(gopher,5);
    if(!active){
      if(millis()-activeTimer>5000){
        image=gopher[0];
        imageCount=0;
        imageRef=0;
        activeTimer=millis();
        active=true;
        spawn();
      }
    }
    else{
      imageCount++;
      activeTimer=millis();
      if(collision()){
        lawnMower1.stunned=true;
        lawnMower1.stunTimer=millis();
        active=false;
      }
      else if(millis()-spawnTimer>3000){
        spawn();
      }
    }
  }
  
  //set the position of a gopher
  void spawn(){
    spawnTimer=millis();
    position.set(random(lawnMower1.boundx,width-lawnMower1.boundx),random(lawnMower1.boundy,height-lawnMower1.boundy));
    while(collision()){
      position.set(random(lawnMower1.boundx,width-lawnMower1.boundx),random(lawnMower1.boundy,height-lawnMower1.boundy));
    }
  }
}
