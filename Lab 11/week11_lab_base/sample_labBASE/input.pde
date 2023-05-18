boolean left;
boolean right;
boolean up;
boolean down;
boolean fire;


PVector upForce=new PVector(0, -2);
PVector downForce=new PVector(0, 2);
PVector leftForce=new PVector(-2, 0);
PVector rightForce=new PVector(2, 0);

void keyPressed() {
  if (key==' ') {
    p.attack();
    fire=true;
  }
  else {
    if (key=='w') up=true;
    if (key=='s') down=true;
    if (key=='d') {
      right=true;
      p.turning=1;
    }
    if (key=='a') {
      left=true;
      p.turning=-1;
    }
    p.walk();
  }
}

void keyReleased() {
  p.sit();
  if (key==' ') fire=false;
  if (key=='w') up=false;
  if (key=='s') down=false;
  if (key=='d') right=false;
  if (key=='a') left=false;
}
