void setup() {
  size(600, 600);
}

color c = color (255, 120, 120);
float scaHead = 1;

void mousePressed(){
  c = color(random(255), random(255), random(255));
}

void mouseReleased(){
  scaHead = 1;
}

void drawBG(){
  //background
  background(255); 
  fill(0,0,255);
  rect(100,100,400,450);
  strokeWeight(3);
  stroke(183/2, 114/2, 15);
  fill(183, 114, 30);
}

void drawBear(float sca, float rot){
  pushMatrix();
  translate(300,350);
  
  //feet
  arc(0, 200, 350, 400, -PI, 0);

  //body
  ellipse(0, 0, 250, 400);

  //arms
  pushMatrix();
  translate(100, -100);
  rotate(rot);
  ellipse(0, 100, 80, 200);
  popMatrix();
  ellipse(-100, 0, 80, 200);

  popMatrix();
  pushMatrix();
  translate(300,150);
  scale(sca);
  
  //ears
  ellipse(100, -30, 80, 80);
  ellipse(-100, -30, 80, 80);

  //head
  ellipse(0, 0, 200, 200);
  
  //face
  noStroke();
  fill(247,202,147);
  ellipse(-40,0,80,80);
  ellipse(40,0,80,80); 
  ellipse(0,50,80,80);
  
  //irises
  fill(180,180,255);
  ellipse(-40,0,30,30);
  ellipse(40,0,30,30);
  
  //pupils
  fill(0); 
  ellipse(-40,0,8,8);
  ellipse(40,0,8,8);
  
  //nose
  triangle(0,40,-20,20,20,20);
  
  noFill();
  stroke(183/2, 114/2, 15);
  strokeWeight(5);
  arc(0,40,80,80,0,PI);
  
  popMatrix();
}

void drawButterfly(color wingColor, int xposition, int yposition){
  //butterfly
  
  //body
  fill(0);
  rect(100+xposition,100+yposition,20,80,ROUND);
  
  //attenae
  line(100+xposition,100+yposition,100+xposition,80+yposition);
  noFill();
  arc(90+xposition,80+yposition,20,20,-PI,0);
  line(120+xposition,100+yposition,120+xposition,80+yposition);
  arc(130+xposition,80+yposition,20,20,-PI,0);
  
  //wings
  stroke(255,50,50);
  fill(wingColor);
  arc(100+xposition,140+yposition,80,70,radians(110),radians(250));
  arc(120+xposition,140+yposition,80,70,radians(-70),radians(70));
}

void draw(){
  drawBG();
  
   if (mousePressed){
    scaHead+=0.01;
  }
  
  float r = map(mouseX, 0, width, -PI, 0);
  drawBear(scaHead,r);
  drawButterfly(c, mouseX, mouseY);
 
}
