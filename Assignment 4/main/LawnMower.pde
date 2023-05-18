class LawnMower extends MovingObject{
  boolean mowed=false;
  int boundx=370;
  int boundy=260;
  boolean stunned=false;
  int stunTimer=0;
  int direction=0;
  boolean fueled=true;
  int fuelGague=16;
  int fuelTimer=0;
  int MAX_FUEL=16;
  boolean fuelRelease=true;
  int imageCount=0;
  int imageRef=0;
  
  LawnMower(PVector pos,PImage img){
    super(pos,img);
    dimensions=new PVector(img.width,img.height);
  }
  
  //draw the lawnmower
  void drawMe(){
    if(gameLevel==level.levelThree && !fueled){
      text("The lawnmower died! Hit the space bar repeatedly to start it up again",600,225);
    }
    if(stunned && (millis()-stunTimer)%100>50){
      return;
    }
    pushMatrix();
    translate(position.x,position.y);
    if(direction==1){
      scale(-1,1);
    }
    else if(direction==2){
      rotate(-PI/2);
    }
    else if(direction==3){
      rotate(PI/2);
    }
    image(image,-dimensions.x/2,-dimensions.y/2); //not consistent
    popMatrix();
  }
  
  //change the lawn pixels based on the lawnMowers position
  void mowLawn(PImage lawn){
    lawn.loadPixels();
    int xOffset1=0;
    int yOffset1=0;
    int xOffset2=0;
    int yOffset2=0;
    if(direction==1){
      xOffset1=-(int)dimensions.x/2;
      xOffset2=-25;
      yOffset1=-25;
      yOffset2=25;
    }
    else if(direction==2){
      xOffset1=-25;
      xOffset2=25;
      yOffset1=-(int)dimensions.x/2;
      yOffset2=-25;
    }
    else if(direction==3){
      xOffset1=-25;
      xOffset2=25;
      yOffset1=25;
      yOffset2=(int)dimensions.x/2;
    }
    else{
      xOffset1=25;
      xOffset2=(int)dimensions.x/2;
      yOffset1=-25;
      yOffset2=25;
    }
    for (int i=int(position.x+xOffset1);i<int(position.x+xOffset2);i++){
      for (int j=int(position.y+yOffset1);j<int(position.y+yOffset2);j++){
          lawn.pixels[i+j*lawn.width]=#bcf5c6;
      }
    }
    lawn.updatePixels();
  }
  
  //animate, check for stun, collision, walls, and completion
  void update(){
    animate();
    if(gameLevel==level.levelThree){
      fueled();
    }
    velocity.mult(damp);
    if(stunned){
      stunned();
    }
    else if(!fueled){
    }
    else{
      move();
      if (checkWalls(boundx,boundy)){
        velocity.mult(-1);
        move();
        velocity.mult(0);
      }
      accelerate();
      mowLawn(background.BGbackyard);
    }
    if(lawnMowed(background.BGbackyard)) mowed=true;
  }
  
  //accelerate the lawnmower
  void accelerate(){
    if (up) super.accelerate(upAcc);
    if (left) super.accelerate(leftAcc);
    if (right) super.accelerate(rightAcc);
    if (down) super.accelerate(downAcc);
  }
  
  //check to see if the lawn is mowed
  boolean lawnMowed(PImage lawn){
    color c;
    lawn.loadPixels();
    for(int i=225;i<width-225;i++){
      for(int j=225;j<height-225;j++){
        c=lawn.pixels[i+j*width];
        if(c==color(#3ee632)){
            return false;
          }
        }
      }
    return true;
  }
  
  //unstun the lawnmower after a given time
  void stunned(){
    if(millis()-stunTimer>1000){
      stunned=false;
    }
  }
  
  //check to see if the lawn mower is fueled
  void fueled(){
    if(millis()-fuelTimer>1000){
      fuelTimer=millis();
      if (fuelGague>0){
        fuelGague--;
      }
    }
    if(fuelGague==0){
      fueled=false;
    }
    else{
      fueled=true;
    }
  }
  
  //animate the lawnmower
  void animate(){
    if(imageCount%5==0 && imageCount!=0){
      if(imageRef==3){
        imageRef=0;
      }
      else{
        imageRef++;
      }
      imageCount++;
    }
    image=lawnMower[imageRef];
  }
}
