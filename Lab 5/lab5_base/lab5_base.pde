int butterflyWidth=100; //diameter of "wing" arc, plus width of rect. body
int numButterflies=5; 
int space=10;
int score;
boolean gameOver=false;
int globalTimer=0;
int gameOverTime=420;

ArrayList<Butterfly> butterflies = new ArrayList<Butterfly>(); 

void setup() {
  size(600, 600);
  
  PFont font=loadFont("ComicSansMS-Bold-48.vlw");
  textFont(font);
  textSize(30);

  for (int i=0;i<numButterflies;i++) {
    addNewButterfly();
  }
}

void addNewButterfly() {
  int bx=(int)random(butterflyWidth/2, width-butterflyWidth/2); 
  int by=(int)random(butterflyWidth/2, height-butterflyWidth/2); 
  butterflies.add(new Butterfly(bx, by, (int)random(-5, 5), (int)random(-5, 5)));
}

void drawScore() {
  fill(0);
  text("Congratulations you killed "+score+" butterflies.", 20, 50);
}

void drawFinalScore() {
  fill(0);
  textSize(45);
  text("Congratulations you killed ", 20, height/3);
  text(score, width/2, height/2);
  text("butterflies.", width/2-100, 2*height/3);
  textSize(30);
}

void draw() {
  fill(120, 120, 255, 50);
  rect(0, 0, width, height); 
  
  if(globalTimer==gameOverTime){
    gameOver=true;
  }
  
  if (globalTimer%60==0){
    addNewButterfly();
  }

  if (!gameOver){
    for (int i=0;i<butterflies.size();i++) {

      Butterfly currButterfly = butterflies.get(i);
      currButterfly.update();
      
      if (currButterfly.isAlive()&&mousePressed&&dist(mouseX, mouseY, currButterfly.x, currButterfly.y)<butterflyWidth/2) {
        currButterfly.kill();
        score++;
      }
    }
    drawScore();
  }
  else {
    drawFinalScore();
  }
  
  
  globalTimer++;
}
