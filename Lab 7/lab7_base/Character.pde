class Character{
  PVector position, velocity;
  float characterWidth;
  
  Character(PVector position, PVector vel){
    this.position = position;
    velocity = vel;
    characterWidth=50;
  }
  
  Character(PVector position){
    this.position = position;
    velocity = new PVector();
    characterWidth=100;
  }
  
  void move(){
    position.add(velocity);
  }
  
  void update(){
    move();
    handleWalls();
  }
  
  void handleWalls() {
    if (position.x<-characterWidth/2) position.x=width+characterWidth/2;
    if (position.x>width+characterWidth/2) position.x=-characterWidth/2;
    if (position.y<-characterWidth/2) position.y=height+characterWidth/2;
    if (position.y>height+characterWidth/2) position.y=-characterWidth/2;
  }
  
  
}
