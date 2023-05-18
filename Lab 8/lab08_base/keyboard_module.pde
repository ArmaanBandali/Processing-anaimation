boolean up, down, left, right;
PVector upForce=new PVector(0, -2);
PVector upAcc = new PVector(0, -2);
PVector downAcc = new PVector(0, 2);
PVector leftAcc = new PVector(-2, 0);
PVector rightAcc = new PVector(2, 0);

void keyPressed() {
  if (key==CODED) {
    if (keyCode==LEFT) left=true;
    if (keyCode==UP) up=true;
    if (keyCode==DOWN) down=true;
    if (keyCode==RIGHT) right=true;
  }

  if (key==' ') { //when space bar is hit
    player.fire();
  }
}

void keyReleased() {
  if (key==CODED) {
    if (keyCode==LEFT) left=false;
    if (keyCode==UP) up=false;
    if (keyCode==DOWN) down=false;
    if (keyCode==RIGHT) right=false;
  }
}
//PVector downForce=new PVector(0, 2);
//PVector leftForce=new PVector(-2, 0);
//PVector rightForce=new PVector(2, 0);


//void keyPressed() {
//  if (key==CODED) {
//    if (keyCode==LEFT) left=true;
//    if (keyCode==RIGHT) right=true;
//    if (keyCode==UP) up=true;
//    if (keyCode==DOWN) down=true;
//  }
//  if (key==' ') {
//    b.fire();
//  }
//}

//void keyReleased() {
//  if (key==CODED) {
//    if (keyCode==LEFT) left=false;
//    if (keyCode==RIGHT) right=false;
//    if (keyCode==UP) up=false;
//    if (keyCode==DOWN) down=false;
//  }
//}
