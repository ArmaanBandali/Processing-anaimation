
int numberOfCards=8;

//Run the mowing game
void mowingGame(){
  image(backyardbg,0,0);
  lawnMower1.drawMe();
  lawnMower1.update();
  if (lawnMower1.mowed){
    state=gameState.hallway;
    lawnMowed=true;
  }
  if(gameLevel!=level.levelOne){
    gopher1.update();
    gopher1.drawMe();
  }
  text("Mow the lawn by using the arrow keys!",width/2,85);
  drawTimer();
  updateTimer();
}

//Run the memory game
void memoryGame(){
  character1.drawMe();
  character1.update();
  if (character1.cardsLeft==0){
    state=gameState.hallway;
    brotherEntertained=true;
  }
  fill(0);
  text("Entertain your brother by playing a memory game with him!\nUse the mouse to select a card to match.\nMatch all the cards to complete the task",width/2,100 );
  hand.drawMe();
  hand.update();
  drawTimer();
  updateTimer();
}

//Run the trash game
void trashGame(){
  character1.position.set(100,height-200);
  character1.drawMe();
  character1.update();
  trashBag1.drawMe();
  trashBag1.update();
  if(gameLevel!=level.levelOne){
    dog1.drawMe();
    dog1.update();
  }
  for(int i=0;i<trashBag1.cans.size();i++){
    trashBag1.cans.get(i).drawMe();
    trashBag1.cans.get(i).update();
  }
  if(trashBag1.trashed){
    state=gameState.hallway;
    trashTakenOut=true;
  }
  text("Take out the trash by throwing it into the bin\nAim with the mouse inside the arc, then click to shoot.",width/2,100);
  drawTimer();
  updateTimer();
}

void initLevelOne(){
  numberOfCards=8;
  roundTimer=75000;
  maxTime=75000;
  character1.cardsLeft=numberOfCards;
  randomizeSymbols();
  for(int i=0;i<numberOfCards;i++){
    character1.cards.add(new Card(new PVector(card.width+10+(width/8)*i,height/2),card,symbols.get(0)));
    symbols.remove(0);
  }
  
  trashBag1.target=3;
  if(trashBag1.cans.size()>0){
    for(int i=0;i<trashBag1.cans.size();i++){
      trashBag1.cans.remove(0);
    }
  }
  for(int i=0;i<trashBag1.target;i++){
    trashBag1.cans.add(new TrashBin(new PVector(width-160-120*i,height-155),trashBin));
  }
  
  backyard.loadPixels();
  j=0;
  k=0;
  for (int i=0;i<backyard.pixels.length;i++){
    if(i/1200==j+1){
      j++;
    }
    if(k==1200){
      k=0;
    }
    if(j<225||j>height-228){
      backyard.pixels[i] = #bcf5c6; //lawn mowed green
    }
    else{
      if(k<295||k>width-228){
        backyard.pixels[i] = #bcf5c6; //lawn mowed green
      }
      else{
        backyard.pixels[i] = #3ee632; //green
      }
    }
    k++;
  }
}

//Initialize all elements unique to levelTwo
void initLevelTwo(){
  numberOfCards=16;
  roundTimer=105000;
  maxTime=105000;
  character1.cardsLeft=numberOfCards;
  randomizeSymbols();
  for(int i=0;i<numberOfCards;i++){
    if(i>7){
      character1.cards.add(new Card(new PVector(card.width+10+(width/8)*(i-8),height/2+100),card,symbols.get(0)));
    }
    else{
      character1.cards.add(new Card(new PVector(card.width+10+(width/8)*i,height/2),card,symbols.get(0)));
    }
    symbols.remove(0);
  }
  
  trashBag1.target=3;
  if(trashBag1.cans.size()>0){
    for(int i=0;i<trashBag1.cans.size();i++){
      trashBag1.cans.remove(0);
    }
  }
  for(int i=0;i<trashBag1.target;i++){
    trashBag1.cans.add(new TrashBin(new PVector(width-160-120*i,height-155),trashBin));
  }
  
  backyard.loadPixels();
  j=0;
  k=0;
  for (int i=0;i<backyard.pixels.length;i++){
    if(i/1200==j+1){
      j++;
    }
    if(k==1200){
      k=0;
    }
    if(j<225||j>height-228){
      backyard.pixels[i] = #bcf5c6; //lawn mowed green
    }
    else{
      if(k<295||k>width-228){
        backyard.pixels[i] = #bcf5c6; //lawn mowed green
      }
      else{
        backyard.pixels[i] = #3ee632; //green
      }
    }
    k++;
  }
}

//initialize all elements unique to level three
void initLevelThree(){
  numberOfCards=24;
  roundTimer=150000;
  maxTime=150000;
  character1.cardsLeft=numberOfCards;
  randomizeSymbols();
  for(int i=0;i<numberOfCards;i++){
    if(i>15){
      character1.cards.add(new Card(new PVector(card.width+10+(width/8)*(i-16),height/2+200),card,symbols.get(0)));
    }
    else if(i>7){
      character1.cards.add(new Card(new PVector(card.width+10+(width/8)*(i-8),height/2+100),card,symbols.get(0)));
    }
    else{
      character1.cards.add(new Card(new PVector(card.width+10+(width/8)*i,height/2),card,symbols.get(0)));
    }
    symbols.remove(0);
  }
  
  trashBag1.target=4;
  if(trashBag1.cans.size()>0){
    for(int i=0;i<trashBag1.cans.size();i++){
      trashBag1.cans.remove(0);
    }
  }

  ArrayList<PImage> tempCans=new ArrayList<PImage>();
  
  tempCans.add(trashBin);
  tempCans.add(trashBin);
  tempCans.add(trashBin2);
  tempCans.add(trashBin3);
  for (int i=0;i<4;i++){
    int t=(int)random(0,tempCans.size());
    int lengthCan=tempCans.get(t).height;
    trashBag1.cans.add(new TrashBin(new PVector(width-160-120*i,height-lengthCan),tempCans.get(t)));
    tempCans.remove(t);
  }

  backyard.loadPixels();
  j=0;
  k=0;
  for (int i=0;i<backyard.pixels.length;i++){
    if(i/1200==j+1){
      j++;
    }
    if(k==1200){
      k=0;
    }
    if(j<225||j>height-228){
      backyard.pixels[i] = #bcf5c6; //lawn mowed green
    }
    else{
      if(k<295||k>width-228){
        backyard.pixels[i] = #bcf5c6; //lawn mowed green
      }
      else{
        backyard.pixels[i] = #3ee632; //green
      }
    }
    k++;
  }
}

//reset all variables and fields between levels
void reset(){
  lawnMowed=false;
  trashTakenOut=false;
  brotherEntertained=false;

  timerActive=false;
  
  character1.numChosen=0;
  character1.chosenCard1=0;
  character1.chosenCard2=0;
  character1.cardTimer=0;
  character1.cardTimerActive=false;
  character1.lineCoordinate=new PVector();
  character1.verifying=false;
  
  for(int i=0;i<numberOfCards;i++){
    character1.cards.remove(0);
    if(gameLevel==level.levelTwo){
      symbols.remove(0);
    }
  }
  
  trashBag1.airborne=false; /////////////bad init level2
  trashBag1.position.set(-100,-100);
  trashBag1.offscreen=false;
  trashBag1.hitSide=false;
  trashBag1.score=0;
  trashBag1.toRemove=-1;
  trashBag1.remove=false;
  trashBag1.trashed=false;
  
  lawnMower1.mowed=false;
  lawnMower1.position.set(400,400);
  lawnMower1.velocity.set(0,0);
  gopher1.active=false;
  gopher1.image=gopher[0];
  gopher1.imageCount=0;
  gopher1.imageRef=0;
  
  dialogue.get(3).activated=false;
  dialogue.get(4).activated=false;
}

//randomize the order of the cards for the memory game
void randomizeSymbols(){
  int t=0;
  if(gameLevel==level.levelOne){
    temp.add(symbol1);
    temp.add(symbol1);
    temp.add(symbol2);
    temp.add(symbol2);
    temp.add(symbol3);
    temp.add(symbol3);
    temp.add(symbol4);
    temp.add(symbol4);
  }
  else if(gameLevel==level.levelTwo){
    numberOfCards=16;
    temp.add(symbol1);
    temp.add(symbol1);
    temp.add(symbol2);
    temp.add(symbol2);
    temp.add(symbol3);
    temp.add(symbol3);
    temp.add(symbol4);
    temp.add(symbol4);
    temp.add(symbol5);
    temp.add(symbol5);
    temp.add(symbol6);
    temp.add(symbol6);
    temp.add(symbol7);
    temp.add(symbol7);
    temp.add(symbol8);
    temp.add(symbol8);
  }
  else{
    numberOfCards=24;
    temp.add(symbol1);
    temp.add(symbol1);
    temp.add(symbol2);
    temp.add(symbol2);
    temp.add(symbol3);
    temp.add(symbol3);
    temp.add(symbol4);
    temp.add(symbol4);
    temp.add(symbol5);
    temp.add(symbol5);
    temp.add(symbol6);
    temp.add(symbol6);
    temp.add(symbol7);
    temp.add(symbol7);
    temp.add(symbol8);
    temp.add(symbol8);
    temp.add(symbol9);
    temp.add(symbol9);
    temp.add(symbol10);
    temp.add(symbol10);
    temp.add(symbol11);
    temp.add(symbol11);
    temp.add(symbol12);
    temp.add(symbol12);
  }
  for (int i=0;i<numberOfCards;i++){
    t=(int)random(0,temp.size());
    symbols.add(temp.get(t));
    temp.remove(t);
  }
}

//update the level timer
void updateTimer(){
  if(timerActive)
  roundTimer=(maxTime+clockedTime-millis())/1000;
  if(roundTimer<0){
    state=gameState.gameOver;
  }
}

//draw the level timer
void drawTimer(){
  textSize(32);
  fill(0);
  text(roundTimer,width-100,50);
}

void mousePressed(){
  if(dialogueLock){
    return;
  }
  if(state==gameState.landingScreen){
    if(mouseX>450 && mouseX<730 && mouseY>615 && mouseY<665){
      state=gameState.gameStart;
    }
  }
  if(state==gameState.memoryGame){
    if(!character1.cardTimerActive){
      character1.chooseCard();
    }
    hand.click();
  }
  if(state==gameState.hallway){
    if(!brotherEntertained&&mouseX<width/3){
      state=gameState.memoryGame;
    }
    if(!trashTakenOut&&mouseX>=width/3&&mouseX<2*width/3){
      state=gameState.trashGame;
    }
    if(!lawnMowed&&mouseX>2*width/3){
      state=gameState.mowingGame;
    }
  }
  if(state==gameState.trashGame){
    if(!trashBag1.airborne){
      character1.animate=true;
      trashBag1.airborne=true;
    }
  }
  if(state==gameState.gameStart){
    if(mouseX>475 && mouseX<730 && mouseY>665 && mouseY<715){
      state=gameState.hallway;
      clockedTime=millis();
      timerActive=true;
    }
  }
  if(state==gameState.gameEnd){
    if(mouseX>470 && mouseX<720 && mouseY>665 && mouseY<715){
      if(gameLevel==level.levelTwo){
        state=gameState.gameStart;
        gameLevel=level.levelThree;
        reset();
        initLevelThree();
        return;
      }
      else if(gameLevel==level.levelThree){
        state=gameState.gameOver;
        won=true;
        return;
      }
      state=gameState.gameStart;
      gameLevel=level.levelTwo;
      reset();
      initLevelTwo();
    }
  }
  if(state==gameState.gameOver){
    if(mouseX>475 && mouseX<730 && mouseY>665 && mouseY<715){
      state=gameState.landingScreen;
      gameLevel=level.levelOne;
      clockedTime=millis();
      reset();
      initLevelOne();
    }
  }
}
