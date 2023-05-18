class Hand extends MovingObject{
  boolean clicked=false;
  int clickTimer=0;
  
  Hand(PVector pos,PImage img){
    super(pos,img);
  }
  
  //set the animation and position of the hand
  void update(){
    position.set(mouseX-dimensions.x/2,mouseY);
    if(clicked && millis()-clickTimer>500){
      clicked=false;
      image=hand1;
    }
  }
  
  //trigger the clicking animation
  void click(){
    image=hand2;
    clicked=true;
    clickTimer=millis();
  }
}
