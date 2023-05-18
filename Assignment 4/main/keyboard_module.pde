//Code in this tab is based on Eric's tutorials

boolean up, down, left, right;
PVector upAcc = new PVector(0, -2);
PVector downAcc = new PVector(0, 2);
PVector leftAcc = new PVector(-2, 0);
PVector rightAcc = new PVector(2, 0);


void keyPressed() {
  if (key==' ' && state==gameState.mowingGame && gameLevel==level.levelThree){
    if(lawnMower1.fuelGague<16 && lawnMower1.fuelRelease){
      lawnMower1.fuelRelease=false;
      lawnMower1.fuelGague+=4;
    }
  }
  if (key==CODED){
    if (keyCode==LEFT){
      left=true;
      lawnMower1.direction=1;
    }
    if (keyCode==UP){
      up=true;
      lawnMower1.direction=2;
    }
    if (keyCode==DOWN){
      down=true;
      lawnMower1.direction=3;
    }
    if (keyCode==RIGHT){
      right=true;
      lawnMower1.direction=0;
    }
    if(state==gameState.mowingGame){
      lawnMower1.imageCount++;
    }
  }
}

void keyReleased() {
  if (key==' '){
    lawnMower1.fuelRelease=true;
  }
  if (key==CODED){
    if (keyCode==LEFT) left=false;
    if (keyCode==UP) up=false;
    if (keyCode==DOWN) down=false;
    if (keyCode==RIGHT) right=false;
  }
}
