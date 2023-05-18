class Dog extends MovingObject{
  int activeTimer=0;
  int jumpTimer=0;
  boolean jumping=false;
  PVector gravity=new PVector(0,0.2);
  
  Dog(PVector pos, PImage img){
    super(pos, img);
  }
  
  //check to see if dog collides with trashbag
  boolean collision(){
    return super.collision(trashBag1);
  }
  
  //draw the dog
  void drawMe(){
    super.drawMe();
  }
  
  //update the dog's position and check for collisions
  void update(){
    if(position.y>height-image.height || collision()){
      if(collision()){
        effect=minim.loadFile("Sounds/418105__crazymonke9__single-dog-bark-3.mp3");
        effect.play(0);
        trashBag1.reset();
        trashBag1.velocity.set(0,0);
        trashBag1.airborne=false;
      }
      jumpTimer=millis();
      jumping=false;
      velocity.set(0,0);
      position.set(550,height-image.height);
    }
    move();
    if(jumping){
      accelerate(gravity);
    }
    if(millis()-jumpTimer>5000){
        jump();
    }
  }
  
  //move the dog
  void move(){
    super.move();
    if(jumping){
      accelerate(gravity);
    }
  }
  
  //make the dog jump
  void jump(){
    jumpTimer=millis();
    jumping=true;
    velocity.set(0,-12);
  }
}
