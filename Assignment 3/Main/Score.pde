class Score{
  int score=0;
  
  Score(){
    score=0;
  }
  
  void displayScore(){
    pushMatrix();
    translate(0,45);
    textFont(font);
    textSize(30);
    fill(0,255);
    text("Score: "+score, 60, 20);
    popMatrix();
  }
  
  void incrementScore(){
    score++;
  }
}
