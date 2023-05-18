class Score{
  int score=0;
  
  int updateScore(){
    return ++score;
  }
  
  void displayScore(){
    textFont(font);
    textSize(30);
    fill(0,255);
    text("Score: "+score, 20, 50);
  }
  
}
