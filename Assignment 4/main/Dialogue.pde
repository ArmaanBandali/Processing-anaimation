class Dialogue extends GameObject{
  String text;
  int textSize;
  int activeTimer=0;
  boolean activated=false;
  PVector resize;
  boolean resized=false;
  int displayTimer;
  boolean left;
  
  Dialogue(PVector pos, PImage img, String text,int textSize,PVector resize, int displayTimer, boolean left){
    super(pos,img);
    this.text=text;
    this.textSize=textSize;
    this.resize=resize;
    this.displayTimer=displayTimer;
    active=false;
    this.left=left;
  }
  
  //draw the dialogue
  void drawMe(){
    resize();
    tint(255,100);
    pushMatrix();
    translate(position.x+dimensions.x/2,position.y+dimensions.y/2);
    if(left){
      scale(-1,1);
    }
    image(image,0,0);
    popMatrix();
    fill(0);
    textSize(textSize);
    textAlign(LEFT);
    if(left){
      text(text,position.x+dimensions.x/2-300,position.y+dimensions.y/2+100);
    }
    else{
      text(text,position.x+dimensions.x/2+20,position.y+dimensions.y/2+100);
    }
    textAlign(CENTER);
    textSize(32);
    noTint();
  }
  
  //make this dialogue active on the screen
  void active(){
    if(!activated){
      if(!dialogueLock){
        dialogueLock=true;
        activated=true;
        active=true;
        activeTimer=millis();
      }
    }
  }
  
  //resize the image
  void resize(){
    if(!resized){
      resized=true;
      image.resize((int)resize.x,(int)resize.y);
    }
  }
  
  //check if dialogue has been on the screen for long enough
  void checkTimer(){
    if(millis()-activeTimer>displayTimer){
      dialogueLock=false;
      active=false;
    }
  }
}

//add all oof the dialogues at the start of the game
void initDialogues(){
  dialogue.add(new Dialogue(new PVector(750,100),dialogueBubble,"Ahhh Friday gaming\n with the boys",24,new PVector(320,232),2500,true));
  dialogue.add(new Dialogue(new PVector(25,-200),dialogueBubble,"Pause your game and go\n finish your chores first!",24,new PVector(320,232),2500,true));
  dialogue.add(new Dialogue(new PVector(750,100),dialogueBubble,"It's online I can't pause it!",24,new PVector(320,232),2500,true));
  dialogue.add(new Dialogue(new PVector(750,100),dialogueBubble,"Uggghhh fine",24,new PVector(320,232),2500,true));
  dialogue.add(new Dialogue(new PVector(-150,-300),dialogueBubble,"I want to play a game!",24,new PVector(320,232),2500,false));
  dialogue.add(new Dialogue(new PVector(300,300),dialogueBubble,"K fine I'll play your game",24,new PVector(320,232),2500,false));
  dialogue.add(new Dialogue(new PVector(105,75),dialogueBubble,"I might as well have fun\n throwing out the trash",24,new PVector(320,232),2500,true));
  dialogue.add(new Dialogue(new PVector(400,-100),dialogueBubble,"This lawnmower turns...\n weird...",24,new PVector(320,232),2500,true));
  dialogue.add(new Dialogue(new PVector(750,100),dialogueBubble,"Finally, time for\n some gaming",24,new PVector(320,232),2500,true)); //8
  
  dialogue.add(new Dialogue(new PVector(25,-200),dialogueBubble,"These chores won't\n do themselves!",24,new PVector(320,232),2500,true));
  dialogue.add(new Dialogue(new PVector(105,75),dialogueBubble,"The neighbour's dog\n won't make this easy",24,new PVector(320,232),2500,true));
  dialogue.add(new Dialogue(new PVector(400,-100),dialogueBubble,"Where were these\n gophers yesterday?",24,new PVector(320,232),2500,true));
  dialogue.add(new Dialogue(new PVector(300,300),dialogueBubble,"Where are you getting\n all these tiles??",24,new PVector(320,232),2500,false));
  dialogue.add(new Dialogue(new PVector(750,100),dialogueBubble,"Time to win\n that tournament!",24,new PVector(320,232),2500,true));
  
  dialogue.add(new Dialogue(new PVector(25,-200),dialogueBubble,"You know the drill",24,new PVector(320,232),2500,true)); //14
  dialogue.add(new Dialogue(new PVector(400,-100),dialogueBubble,"Oh no the mower\n is dying...",24,new PVector(320,232),2500,true));
  dialogue.add(new Dialogue(new PVector(300,300),dialogueBubble,"Seriously, where are you\n getting all these tiles???",24,new PVector(320,232),2500,false));
  dialogue.add(new Dialogue(new PVector(105,75),dialogueBubble,"I swear these trash cans\n are different",24,new PVector(320,232),2500,true));
  dialogue.add(new Dialogue(new PVector(750,100),dialogueBubble,"I really hope there are\n no chores tomorrow",24,new PVector(320,232),2500,true));
  dialogue.add(new Dialogue(new PVector(750,100),dialogueBubble,"Uggghhh fine",24,new PVector(320,232),2500,true));
}

//run through each dialogue and display the active one
void activeDialogue(){
  Dialogue tempDialogue;
  for(int i=0;i<dialogue.size();i++){
    tempDialogue=dialogue.get(i);
    if(tempDialogue.active){
      tempDialogue.drawMe();
      tempDialogue.checkTimer();
    }
  }
}
