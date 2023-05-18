class MovingObject extends GameObject{
  PVector velocity;
  float damp=0.8;
  
  MovingObject(PVector pos,PImage img){
    super(pos,img);
    velocity=new PVector(0,0);
  }
  
  //change the position of the object
  void move(){
    position.add(velocity);
  }
  
  //update the object
  void update(){
    super.update();
  }
  
  //draw the object
  void drawMe(){
    super.drawMe();
  }
  
  //accelerate the object
  void accelerate(PVector acceleration){
    velocity.add(acceleration);
  }
  
  //check if the object is in an illegal position
  boolean checkWalls(int bufferx, int buffery){
    int bufferedWidth=width-bufferx;
    int bufferedHeight=height-buffery;
    if (position.x-dimensions.x/2>bufferedWidth||position.x<-dimensions.x/2+bufferx||position.y-dimensions.y/2>bufferedHeight||position.y<-dimensions.y/2+buffery){
      return true;
    }
    return false;
  }
  
}
