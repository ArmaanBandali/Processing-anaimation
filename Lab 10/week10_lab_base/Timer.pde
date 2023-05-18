class Timer{
  float time=60;
  
  void drawMe(){
    pushMatrix();
    translate(10,50);
    textFont(font);
    textSize(32);
    text("Time Remaining: "+time,0,0);
    popMatrix();
  }
  
  void update(){
    time=(60000.000-millis())/1000;
  }
}
