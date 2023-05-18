void setup() {
  size(900, 600);
}

float z=0; //timing variable
float waveSpeed=0; //movement variable
float ballRotation=0;
float sunScale=1;
int direction=1;

color mountainFill=#4b4f4f;
color white=#ffffff;
color platformFill=#948e8e;
color waterFill=#7cc0f7;
color backgroundFill=#abf5f0;
color ballFill1=#2064f7;
color ballFill2=#fa2616;
color ballFill3=#f7d320;
color ballFill4=#d115bb;
color ballFill5=#38f711;
color ballFill6=#c7404b;
color ballFill7=#7f67c2;
color ballFill8=#e6df8a;
color ballFill9=#f06ceb;
color sunFill=#f7d914;
color balloonFill1=#f7ec19;
color balloonFill2=#d41e11;
color balloonFill3=#111bd4;
color balloonFill4=#0eb31c;
color sealPrimaryFill=#b6c4cf;
color mouthFill=#ed4c77;
color sealSpotFill=#a5b0b8;


color platformStroke=#787373;
color ballStroke=#a4a5b0;
color sunStroke=#e8ae3a;
color sunRayStroke=#c27c32;
color finStroke=#a5b0b8;

float strokeWeight1=0.5;
float strokeWeight2=1.5;
float strokeWeight3=2;
float strokeWeight4=3;


void draw(){
  background(backgroundFill);
  
  float sealX=width/2;
  float sealY=height/2;
  float sealRotation = map(mouseX, 0, width, -PI/4, PI/4);
  float sealScale = map(mouseY, 0, height, 0.5, 2);
  
  //mountains
  fill(mountainFill);
  quad(725,600,825,100,875,100,925,600);
  quad(615,600,715,300,765,300,815,600);
  fill(white);
  triangle(825,100,850,0,875,100);
  triangle(715,300,740,200,765,300);
  
  //first platform
  fill(platformFill);
  stroke(platformStroke);
  strokeWeight(strokeWeight1);
  rect(175,400,500,200);
  //second platform
  rect(275,250,300,150);
  strokeWeight(strokeWeight3);
  noFill();
  curve(225,200,275,250,575,250,625,200);
  curve(125,350,175,400,675,400,725,250);
  noStroke();
  strokeWeight(1);
  
  //water
  noStroke();
  fill(waterFill);
  rect(0,450,900,150);
  for (int i=0; i<19; i++){
    if (i>3 && i<14){
      fill(#948e8e);
    }
    else{
      fill(#abf5f0);
    }
    if (i>=14){
      fill(#4b4f4f);
    }
    ellipse(i*50,450,50,50);
  }
  
  //wave animation
  fill(waterFill);
  for (int i=0; i<19; i++){
    triangle(-12.5+i*50,500-waveSpeed,i*50,480-waveSpeed,12.5+i*50,500-waveSpeed);
  }
  if (waveSpeed>18 || waveSpeed<-5){
    direction*=-1;
  }
  if (direction>0){
    waveSpeed+=0.3;
    sunScale+=0.001;
  }
  else {
    waveSpeed-=0.3;
    sunScale-=0.001;
  }
  
  //beach ball 1
  pushMatrix();
  stroke(ballStroke);
  strokeWeight(strokeWeight1);
  translate(200,375);
  rotate(ballRotation);
  fill(ballFill1);
  arc(0,0,50,50,0,PI/3, PIE);
  fill(white);
  arc(0,0,50,50,PI/3,2*PI/3, PIE);
  fill(ballFill2);
  arc(0,0,50,50,2*PI/3,PI, PIE);
  fill(white);
  arc(0,0,50,50,PI,4*PI/3, PIE);
  fill(ballFill3);
  arc(0,0,50,50,4*PI/3,5*PI/3, PIE);
  fill(white);
  arc(0,0,50,50,5*PI/3,2*PI, PIE);
  popMatrix();
  
  //beach ball 2
  pushMatrix();
  translate(650,375);
  rotate(ballRotation);
  fill(ballFill4);
  arc(0,0,50,50,0,PI/3, PIE);
  fill(white);
  arc(0,0,50,50,PI/3,2*PI/3, PIE);
  fill(ballFill5);
  arc(0,0,50,50,2*PI/3,PI, PIE);
  fill(white);
  arc(0,0,50,50,PI,4*PI/3, PIE);
  fill(ballFill6);
  arc(0,0,50,50,4*PI/3,5*PI/3, PIE);
  fill(white);
  arc(0,0,50,50,5*PI/3,2*PI, PIE);
  popMatrix();
  
  //beach ball 3
  pushMatrix();
  translate(325,225);
  rotate(ballRotation);
  fill(ballFill7);
  arc(0,0,50,50,0,PI/3, PIE);
  fill(white);
  arc(0,0,50,50,PI/3,2*PI/3, PIE);
  fill(ballFill8);
  arc(0,0,50,50,2*PI/3,PI, PIE);
  fill(white);
  arc(0,0,50,50,PI,4*PI/3, PIE);
  fill(ballFill9);
  arc(0,0,50,50,4*PI/3,5*PI/3, PIE);
  fill(white);
  arc(0,0,50,50,5*PI/3,2*PI, PIE);
  popMatrix();
  
  ballRotation+=PI/180;
  
  //Sun
  stroke(sunStroke);
  strokeWeight(strokeWeight2);
  pushMatrix();
  scale(sunScale);
  fill(sunFill);
  ellipse(0,0,300,300);
  stroke(sunRayStroke);
  triangle(-50,175,0,225,50,175);
  triangle(65,175,100,220,85,160);
  triangle(100,150,200,200,160,100);
  triangle(160,85,230,105,170,65);
  triangle(175,-50,175,50,225,0);
  popMatrix();
  
  //Balloons
  stroke(white);
  strokeWeight(strokeWeight4);
  line(550,150,525,250);
  line(490,140,525,250);
  line(505,155,525,250);
  line(525,150,525,250);
  strokeWeight(1);
  noStroke();
  fill(balloonFill1);
  ellipse(550,150,40,55);
  fill(balloonFill2);
  ellipse(490,140,40,55);
  fill(balloonFill3);
  ellipse(505,155,40,55);
  fill(balloonFill4);
  ellipse(525,150,40,55);
 
  //background(white);
 
  //Seal
  pushMatrix(); //<>//
  translate(sealX, sealY); //translate to centre
  rotate(sealRotation);
  scale(sealScale);
  
  stroke(finStroke);
  strokeWeight(2);
  fill(sealPrimaryFill);
  triangle(-50,-10,-125,20,-20,30);
  pushMatrix();
  noStroke();
  translate(-100,-100);
  rotate(PI/4);
  ellipse(0,0,80,70);
  popMatrix();
  rect(-100,-80,40,100);
  arc(-75,20,50,40,0,PI);
 
  beginShape();
  curveVertex(-65,-90);
  curveVertex(-65,-90);
  curveVertex(-30,-40);
  curveVertex(20,0);
  curveVertex(60,18);
  curveVertex(100,20);
  curveVertex(100,20);
  vertex(115,20);
  vertex(85,30);
  vertex(115,40);
  vertex(100,40);
  vertex(-80,40);
  vertex(-65,-90);
  endShape();
 
 //fins
  stroke(finStroke);
  strokeWeight(2);
  triangle(-90,10,-130,40,-70,30);
  
  //mouth
  noStroke();
  fill(mouthFill);
  triangle(-135,-103,-125,-103,-132,-85);
  
  //nose
  noStroke();
  fill(0);
  circle(-140,-110,10);
  stroke(0);
  line(-135,-110,-120,-93);
  line(-135,-110,-120,-103);
  line(-135,-110,-120,-113);
  noStroke();
  
  //eye
  fill(0);
  pushMatrix();
  translate(-120,-123);
  rotate(PI/4);
  ellipse(0,0,7,12);
  popMatrix();
  
  //spots
  fill(sealSpotFill);
  ellipse(-50,0,5,10);
  ellipse(-40,-5,5,10);
  ellipse(-38,-20,5,10);
  ellipse(-30,5,5,10);
  ellipse(-23,-10,5,10);
  ellipse(-20,0,5,10);
  ellipse(-10,-5,5,10);
  
  popMatrix();
   //<>//
}
