void setup() {
  size(600, 600);
  
  //background
  background(255); 
  fill(0,0,255);
  rect(100,100,400,450);
  strokeWeight(3);
  stroke(183/2, 114/2, 15);
  fill(183, 114, 30);

  //feet
  arc(300, 350+200, 350, 400, -PI, 0);

  //body
  ellipse(300, 350, 250, 400);

  //arms
  ellipse(300+100, 350, 80, 200);
  ellipse(300-100, 350, 80, 200);

  //ears
  ellipse(300+100, 120, 80, 80);
  ellipse(300-100, 120, 80, 80);

  //head
  ellipse(300, 150, 200, 200);
  
  //face
  noStroke();
  fill(247,202,147);
  ellipse(260,150,80,80);
  ellipse(340,150,80,80); 
  ellipse(300,190,80,80);
  
  //irises
  fill(180,180,255);
  ellipse(260,150,30,30);
  ellipse(340,150,30,30);
  
  //pupils
  fill(0); 
  ellipse(260,150,8,8);
  ellipse(340,150,8,8);
  
  //nose
  triangle(300,190,280,170,320,170);
  
  noFill();
  stroke(183/2, 114/2, 15);
  strokeWeight(5);
  arc(300,190,80,80,0,PI);
  
  
  
  //butterfly
  
  //body
  fill(0);
  rect(100,100,20,80,ROUND);
  
  //attenae
  line(100,100,100,80);
  noFill();
  arc(90,80,20,20,-PI,0);
  line(120,100,120,80);
  arc(130,80,20,20,-PI,0);
  
  //wings
  stroke(255,50,50);
  fill(255,120,120);
  arc(100,140,80,70,radians(110),radians(250));
  arc(120,140,80,70,radians(-70),radians(70));
    
 
}


