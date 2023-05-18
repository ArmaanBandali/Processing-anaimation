class Cursor{
  int cursorColour=0;
  int cursorTimer=0;
  int timerEnd=0;
  
  void drawCursor(){
    timerEnd=millis();
    noFill();
    stroke(0);
    strokeWeight(2);
    if (timerEnd-cursorTimer < 500){
      stroke(cursorColour);
      strokeWeight(4);
    }
    else{
      cursorClicked();
    }
    pushMatrix();
    translate(mouseX,mouseY);
    circle(0,0,50);
    line(-50,0,50,0);
    line(0,-50,0,50);
    popMatrix();
    strokeWeight(1);
  }
  
  void cursorClicked(){
    cursorColour=#e0160b;
  }
  
  void cursorReset(){
    cursorColour=0;
  }
  
  void cursorTimerUpdate(){
    cursorTimer=millis();
  }
  
  void cursorTimerReset(){
    cursorTimer=0;
  }
  
  int cursorTimer(){
    return cursorTimer;
  }
}
