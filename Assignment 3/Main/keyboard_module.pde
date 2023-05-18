//obviously this all belongs to the prof //<>//

boolean up, down, left, right;
PVector upAcc = new PVector(0, -2);
PVector downAcc = new PVector(0, 2);
PVector leftAcc = new PVector(-2, 0);
PVector rightAcc = new PVector(2, 0);


void keyPressed() {
  if (key==' '){
    drone.fire();
  }
  if (key==CODED){
    if (keyCode==LEFT) left=true;
    if (keyCode==UP) up=true;
    if (keyCode==DOWN) down=true;
    if (keyCode==RIGHT) right=true;
  }
}

void keyReleased() {
  if (key==CODED){
    if (keyCode==LEFT) left=false;
    if (keyCode==UP) up=false;
    if (keyCode==DOWN) down=false;
    if (keyCode==RIGHT) right=false;
  }
}
