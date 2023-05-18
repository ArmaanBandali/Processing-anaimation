int butterflyWidth=100; //diameter of "wing" arc, plus width of rect. body
int numButterflies=5; 
ArrayList<Butterfly> butterflies = new ArrayList<Butterfly>(); 


void setup() {
  for (int i=0;i<numButterflies;i++) 
  {
    int bx=(int)random(butterflyWidth/2, width-butterflyWidth/2); //note the cast (int). random function returns a float; we need to explicitly convert it to integer type
    //to store in the array of integers
    int by=(int)random(butterflyWidth/2, height-butterflyWidth/2); //keep butterflies within the screen
    butterflies.add(new Butterfly(bx, by, 0));
  }
}


void draw() {
  fill(120, 120, 255, 50);
  rect(0, 0, width, height); //this will be our background. 
  //Will create a cool effect when we aniate our butterflies. :)
  for (int i=0;i<butterflies.size();i++) 
  {
    Butterfly currButterfly = butterflies.get(i);
    currButterfly.drawMe();
    currButterfly.move();
    if (mousePressed&&dist(mouseX, mouseY, currButterfly.x, currButterfly.y)<butterflyWidth/2){
      if (mouseButton==LEFT) 
      {
        currButterfly.speed=-5;    
        continue;
      }
      if (mouseButton==RIGHT){
        //butterflies.clear();
        currButterfly.draw=!currButterfly.draw;
      }
    }
  }
}

void mousePressed(){
}

class Butterfly {

  //fields
  int x;
  int y;
  int speed;
  boolean draw;

  //Constructor
  Butterfly(int x, int y_, int speed) {
    this.x=x;
    y=y_;
    this.speed=speed;
    this.draw=true;
  }
  
  void drawMe() {
    if (!draw){
      return;
    }
    //butterfly
    pushMatrix();
    translate(x, y);
    //body
    fill(0);
    stroke(0);
    rect(-10, -40, 20, 80, ROUND);

    //attenae
    line(-10, -40, -10, -60);
    noFill();
    arc(-20, -60, 20, 20, -PI, 0);
    line(10, -40, 10, -60);
    arc(20, -60, 20, 20, -PI, 0);

    //wings
    stroke(255, 50, 50);
    fill(255, 120, 120, 180);
    arc(-10, 0, 80, 70, radians(110), radians(250));
    arc(10, 0, 80, 70, radians(-70), radians(70));
    popMatrix();
  }
  
  void move() {
    y+=speed;
  }
}

void settings() 
{
  size(butterflyWidth+numButterflies*butterflyWidth, 600);
}
