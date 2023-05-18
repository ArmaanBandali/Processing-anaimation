class Character extends MovingObject{
  
  ArrayList<Card> cards;
  int numChosen=0;
  int chosenCard1;
  int chosenCard2;
  int cardTimer=0;
  boolean cardTimerActive=false;
  int cardsLeft=numberOfCards;
  PVector lineCoordinate=new PVector();
  boolean verifying=false;
  boolean animate;
  
  
  
  Character(PVector pos,PImage img,PVector vel){
    super(pos,img);
    cards=new ArrayList<Card>();
    randomizeSymbols();
    for(int i=0;i<numberOfCards;i++){
      cards.add(new Card(new PVector(card.width+10+(width/numberOfCards)*i,height/2),card,symbols.get(0)));
      symbols.remove(0);
    }
    dimensions=new PVector(50,50);
  }
  
  //update the chosen card in the memory game or animate the character in the trash game
  void update(){
    super.update();
    if (state==gameState.memoryGame){
      if(cardTimerActive){
        if(millis()-cardTimer>100){
          chooseCard();
          cardTimerActive=false;
        }
      }
    }
    if(state==gameState.trashGame){
      if(animate){
        animate();
      }
      aim();
    }
  }
  
  //set the velocity and trajectory of the trashbag
  void aim(){
    if(!trashBag1.airborne){
      if((mouseX>150&&mouseY<height-100) && sqrt(pow((mouseX-150),2)+pow((height-100-mouseY),2))<300){/////////////
        lineCoordinate.set(mouseX,mouseY);
        trashBag1.velocity.set(map(mouseX,150,450,0,10),map(height-mouseY,-400,-100,0,-4));
      }
    }
  }
  
  //choose a card that matches where the mouse pointer is, activating, deactivating, or flipping the cards based on the match
  void chooseCard(){
    for(int i=0;i<cards.size();i++){
      Card tempCard=cards.get(i);
      if(mouseX>tempCard.position.x && mouseX<tempCard.position.x+50 && mouseY>tempCard.position.y && mouseY<tempCard.position.y+50 && numChosen<2){ /////50
        if(numChosen==0){
          chosenCard1=i;
        }
        else if(numChosen==1){
          if(chosenCard1!=i){
            chosenCard2=i;
          }
        }
        tempCard.chosen=true;
        numChosen++;
      }
    }
    if(numChosen==2){
      if(!cardTimerActive){
        cardTimer=millis();
        cardTimerActive=true;
      }
      else{
        if(matchCard()){
          effect=minim.loadFile("Sounds/562196__gristi__snd-fragment-retrieve.mp3");
          effect.play(0);
          cardsLeft-=2;
          cards.get(chosenCard1).active=false;
          cards.get(chosenCard2).active=false;
        }
        numChosen=0;
        for(int j=0;j<cards.size();j++){
          Card tempCard=cards.get(j);
          tempCard.chosen=false;
        }
      }
    }
  }
  
  //check to see if the cards match
  boolean matchCard(){
    int colour1=0;
    int colour2=1;
    Card tempCard1=cards.get(chosenCard1);
    Card tempCard2=cards.get(chosenCard2);
    colour1=get((int)tempCard1.position.x+25,(int)tempCard1.position.y+25);
    colour2=get((int)tempCard2.position.x+25,(int)tempCard2.position.y+25);
    return colour1==colour2;
  }
  
  //draw the character
  void drawMe(){
    if (state==gameState.memoryGame){
      drawCards();
    }
    if (state==gameState.trashGame){
      image(image,position.x-50,position.y-100);
      fill(0);
      strokeWeight(3);
      stroke(0);
      line(150,height-100,lineCoordinate.x,lineCoordinate.y);
      pushMatrix();
      translate(lineCoordinate.x,lineCoordinate.y);
      circle(0,0,10);
      noFill();
      popMatrix();
      arc(150,height-100,590,590,3*PI/2,2*PI);
      strokeWeight(1);
    }
  }
  
  //draw the cards
  void drawCards(){
    for(int i=0;i<cards.size();i++){
      cards.get(i).drawMe();
      cards.get(i).update();
    }
  }
  
  //animate the character
  void animate(){
    imageCount++;
    super.animate(character,5);
  }
  
  //reset the character animation
  void resetImage(){
    animate=false;
    imageCount=0;
    imageRef=0;
    image=character[0];
  }
}
