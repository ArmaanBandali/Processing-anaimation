class Background{
  PImage BGstartScreen;
  PImage BGhallway;
  PImage BGbackyard;
  PImage BGstreet;
  PImage BGbedroom;
  PImage BGgameOver;
  PImage BGlandingScreen;
  
  Background(){
    BGstartScreen=gamingRoom;
    BGgameOver=gamingRoom;
    BGhallway=hallway;
    BGbackyard=backyard;
    BGstreet=street;
    BGbedroom=bedroom;
    BGlandingScreen=landingScreen;
  }
  
  //draw the opening screen, text, and start button
  void drawBGlandingScreen(){
    tint(255,80);
    image(BGstartScreen,0,0);
    noTint();
    fill(0);
    textSize(32);
    text("I Want to Play My Game\n\n\n\nFinish your chores before you get to play online with your friends!\nIf you don't finish quickly enough, your friends will go offline...\nand you'll lose the game!",width/2,100);
    text("Play",width/2,height/2+250);
    noFill();
    stroke(0);
    rect(475,615,255,50);
  }
  
  int colour;
  //draw the start screen, text, dialogues, and level start button
  void drawBGstartScreen(){
    if(millis()-colorTimer>80){
      colorTimer=millis();
      colour=color(random(0,255),random(0,255),random(0,255));
    }
    image(BGstartScreen,0,0);
    textSize(32);
    textAlign(CENTER);
    if(gameLevel==level.levelOne){
      text("Day One: Start",width/2,height/2+300);
      dialogue.get(0).active();
      dialogue.get(1).active();
      dialogue.get(2).active();
      dialogue.get(3).active();
    }
    else if(gameLevel==level.levelTwo){
      text("Day Two: Start",width/2,height/2+300);
      dialogue.get(9).active();
      dialogue.get(19).active();
    }
    else{
      text("Day Three: Start",width/2,height/2+300);
      dialogue.get(14).active();
      dialogue.get(19).active();
    }
    textSize(12);
    text("Call of Fort Guys",450,90);
    fill(colour);
    rect(750,80,330,130);
    noFill();
    stroke(0);
    rect(475,665,255,50);
    fill(0);
  }
  
  //draw the end screen, text, and replay button
  void drawBGgameOver(){
    tint(255,80);
    image(BGstartScreen,0,0);
    noTint();
    if(won){
      text("Congratulations! You completed three sweet, sweet days of gaming\n\n\n\nYou beat the game!",width/2,100);
    }
    else{
      text("You couldn't finish your chores in time, so your friends went offline...\nGame Over",width/2,100);
    }
    text("Replay",width/2,height/2+300);
    noFill();
    stroke(0);
    rect(475,665,255,50);
  }
  
  //draw the mowing game background screen, text, and dialogues
  void drawBGbackyard(){
    image(BGbackyard,0,0);
    if(gameLevel==level.levelOne){
      dialogue.get(7).active();
    }
    if(gameLevel==level.levelTwo){
      dialogue.get(11).active();
    }
    if(gameLevel==level.levelThree){
      dialogue.get(15).active();
    }
  }
  
  //draw the trash game background screen, text, and dialogues
  void drawBGstreet(){
    image(BGstreet,0,0);
    if(gameLevel==level.levelOne){
      dialogue.get(6).active();
    }
    if(gameLevel==level.levelTwo){
      dialogue.get(10).active();
    }
    if(gameLevel==level.levelThree){
      dialogue.get(17).active();
    }
  }
  
  //draw the memory game background screen, text, and dialogues
  void drawBGbedroom(){
    image(BGbedroom,0,0);
    if(gameLevel==level.levelOne){
      dialogue.get(4).active();
      dialogue.get(5).active();
    }
    if(gameLevel==level.levelTwo){
      dialogue.get(12).active();
    }
    if(gameLevel==level.levelThree){
      dialogue.get(16).active();
    }
  }
  
  //draw the level end screen, text, dialogues, and paly button
  void drawBGgameEnd(){
    if(millis()-colorTimer>80){
      colorTimer=millis();
      colour=color(random(0,255),random(0,255),random(0,255));
    }
    image(BGstartScreen,0,0);
    textSize(12);
    text("Call of Fort Guys",450,90);
    textSize(32);
    text("You finished your chores in time and got to play with your friends!\nEnjoy your game.",width/2,height/2-100);
    text("Play your game",width/2,height/2+300);
    if(gameLevel==level.levelOne){
      dialogue.get(8).active();
    }
    else if(gameLevel==level.levelTwo){
      dialogue.get(13).active();
    }
    else{
      dialogue.get(18).active();
    }
    fill(colour);
    rect(750,80,330,130);
    noFill();
    stroke(0);
    rect(475,665,250,50);
    fill(0);
  }
  
  //draw the game select screen and text
  void drawBGhallway(){
    if(lawnMowed&&brotherEntertained&&trashTakenOut){
      state=gameState.gameEnd;
      return;
    }
    image(BGhallway,0,0);
    textSize(32);
    fill(0);
    text("Choose an unfinished chore to do with your mouse",width/2,100);
    text("Take Out the Trash",width/2,400);
    if(trashTakenOut){
      text("Done",width/2,500);
    }
    text("Entertain your Brother",width/6,400);
    if(brotherEntertained){
      text("Done",width/6,500);
    }
    text("Mow the Lawn",5*width/6,400);
    if(lawnMowed){
      text("Done",5*width/6,500);
    }
  }
  
}
