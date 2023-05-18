float butterflyWidth=100; //diameter of "wing" arc, plus width of rect. body
int numButterflies=5; 
int space=10;

int score;

ArrayList<Butterfly> butterflies = new ArrayList<Butterfly>(); 
PFont font;

void setup() {
  size(800, 600);

  for (int i=0; i<numButterflies; i++) {
    addNewButterfly(random(1)>.5);
  }
  
  for (int i=0; i < 2; i++) {
    float bx= random(butterflyWidth/2, width-butterflyWidth/2); 
    float by= random(butterflyWidth/2, height-butterflyWidth/2); 
    butterflies.add(new BossButterfly(bx, by, random(-5, 5), random(-5, 5)));
  }

  font=loadFont("ComicSansMS-Bold-48.vlw");
  textFont(font);
  textSize(30);
}

void addNewButterfly() {
  int bx=(int)random(butterflyWidth/2, width-butterflyWidth/2); 
  int by=(int)random(butterflyWidth/2, height-butterflyWidth/2); 
  butterflies.add(new Butterfly(bx, by, (int)random(-5, 5), (int)random(-5, 5)));
}

void addNewButterfly(boolean addBoss){
  if (addBoss){
    float bx= random(butterflyWidth/2, width-butterflyWidth/2); 
    float by= random(butterflyWidth/2, height-butterflyWidth/2); 
    butterflies.add(new BossButterfly(bx, by, random(-5, 5), random(-5, 5)));
  }
  else{
    addNewButterfly();
  }
}

void draw() {
  fill(120, 120, 255, 50);
  rect(0, 0, width, height); 


  for (int i=0; i<butterflies.size(); i++) {

    Butterfly currButterfly = butterflies.get(i);
    currButterfly.update();
    currButterfly.drawButterfly();

    if (mousePressed && currButterfly.hitButterfly(mouseX,mouseY)) {
      if (currButterfly.captured())
        score++;
    }
  }

  drawScore();

  if (butterflies.size()<10&&frameCount%180==0) {
    addNewButterfly(random(1)>.5);
  }
}

void drawScore() {
  if (score > 0) {
    fill(0);
    text("Congratulations you've captured "+score+" butterflies!", 80, 50);
  }
}
