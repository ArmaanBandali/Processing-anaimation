int butterflyWidth=100; //diameter of "wing" arc, plus width of rect. body
int numButterflies=5; 

void setup() {
  size(butterflyWidth+numButterflies*butterflyWidth, 600);
}


void draw() {
  fill(120, 120, 255, 50);
  rect(0, 0, width, height); //this will be our background. 
  //Will create a cool effect when we aniate our butterflies. :)
}


void drawButterfly(float x, float y) {
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

