void setup() {
  //adorable bear.
  
  
  size(600, 800);
  background(255);

  //scale down each channel for a darker version of the same hue
  stroke(42/2, 130/2, 134/2);
  strokeWeight(4);
  fill(42, 130, 134);


  //feet
  arc(300, 700, 500, 300, -radians(180), 0, CLOSE);

  //body
  ellipse(300, 450, 300, 500);

  //arms
  //left arm
  ellipse(150, 500, 100, 300);
  //right arm
  ellipse(450, 500, 100, 300);


  //ears
  //left
  ellipse(200, 160, 100, 100);
  //right
  ellipse(400, 160, 100, 100);

  //head
  ellipse(300, 200, 200, 200);


  //face
  noStroke();
  fill(199, 235, 277);
  ellipse(260, 200, 80, 80);
  ellipse(340, 200, 80, 80);
  //snout
  ellipse(300, 240, 80, 80);

  //eyes.
  //iris
  fill(120, 255, 120);
  ellipse(260, 200, 40, 40);
  ellipse(340, 200, 40, 40);
  //pupil
  fill(0);
  ellipse(260, 200, 20, 20);
  ellipse(340, 200, 20, 20);

  //smallglint- up and to the right!
  fill(255);
  ellipse(265, 195, 5, 5);
  ellipse(345, 195, 5, 5);


  //nose
  fill(0);
  //base our points off our reference, the middle of the snout ellipse.
  //order we draw the points doesn't matter
  triangle(300, 240, 280, 220, 320, 220);
  
  //smile- use a non filled arc to get a nice curved line segment!
  noFill();
  stroke(0);
  arc(300, 240, 80, 80,0,PI);
  
  
  
  //flower stem
  stroke(0,255,0);
  line(400,600,450,300);
  line(450,300,500,350);
  
  //flower
  fill(255,255,0);
  noStroke();
  ellipse(500,350,80,80);
  //petals
  fill(255,120,120);
  //facing right petal
  arc(460,350,80,80,radians(30),radians(330));
  //facing left petal
  arc(540,350,80,80,radians(-150),radians(150));
  //facing down petal
  arc(500,310,80,80,radians(-240),radians(60));
  //facing up petal
  arc(500,390,80,80,radians(-60),radians(240));
  
  //* remember that arcs move clockwise,
  //you can pass in negative angles
  //a negative angle is 'backwards' (moving counterclockwise) from 0
  //so, putting in a value such as -90 to 0 will get you an angle that appears
  //like 90 degrees in our usual coordinate system.
  //it's flipped in processing.
  //don't forget to use the radians function to convert degree arguments into radians!!
  
  
  
  
  
  
}

