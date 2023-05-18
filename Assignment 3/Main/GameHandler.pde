class GameHandler{
  float difficultyTimer=0;
  float difficultyModifier=0.1;
  boolean gameOver=false;
  boolean gameBegin=false;
  boolean rulesBegin=false;
  boolean survivalAchievement=false;
  boolean survivalAchievementDone=false;
  boolean noDamageAchievement=false;
  boolean noDamageAchievementDone=false;
  int survivalTimer=0;
  int noDamageCounter=0;
  int achievementDisplayTimer1=0;
  int achievementDisplayTimer2=0;
  boolean achievementBeingDisplayed1=false;
  boolean achievementBeingDisplayed2=false;
  boolean timerStart=false;
  
  GameHandler(){
  }
  
  void update(){
    if(millis()-difficultyTimer>2000){ 
      difficultyTimer=millis();
      increaseDifficulty();
    }
    achievementTracker();
    if(survivalAchievement&&!survivalAchievementDone){
      if (!achievementBeingDisplayed2){
        if(!achievementBeingDisplayed1){
          achievementDisplayTimer1=millis();
        }
        achievementBeingDisplayed1=true;
      }
    }
    if(noDamageAchievement&&!noDamageAchievementDone){
      if (!achievementBeingDisplayed1){
        if(!achievementBeingDisplayed2){
          achievementDisplayTimer2=millis();
        }
        achievementBeingDisplayed2=true;
      }
    }
    if(millis()-achievementDisplayTimer1>4000 && achievementBeingDisplayed1){
      survivalAchievementDone=true;
      achievementBeingDisplayed1=false;
    }
    if(millis()-achievementDisplayTimer2>4000 && achievementBeingDisplayed2){
      noDamageAchievementDone=true;
      achievementBeingDisplayed2=false;
    }
    drawAchievement();
  }
  
  void increaseDifficulty(){
    for (int i=0;i<viruses.size();i++){
      if (viruses.get(i).velocity.x>=0 && viruses.get(i).velocity.y>=0){
        viruses.get(i).accelerate(new PVector(difficultyModifier,difficultyModifier));
      }
      if (viruses.get(i).velocity.x<0 && viruses.get(i).velocity.y>=0){
        viruses.get(i).accelerate(new PVector(-difficultyModifier,difficultyModifier));
      }
      if (viruses.get(i).velocity.x>=0 && viruses.get(i).velocity.y<0){
        viruses.get(i).accelerate(new PVector(difficultyModifier,-difficultyModifier));
      }
      if (viruses.get(i).velocity.x<0 && viruses.get(i).velocity.y<0){
        viruses.get(i).accelerate(new PVector(-difficultyModifier,-difficultyModifier));
      }
    }
  }
  
  void drawStartScreen(){
    pushMatrix();
    translate(width/2,25);
    textFont(font);
    textSize(30);
    fill(0,255);
    textAlign(CENTER);
    textSize(32);
    text("Title\n\n\n\nFight viruses by delivering vaccines using drones!\nWatch out for the boss virus and its plasmids.\nViruses will mutate and get faster over time.\n"+
    "Some virsuses are resistant and begin with shields.\n\nClick next to learn the rules.",0,0);
    noFill();
    stroke(0);
    rect(-40,520,80,40);
    fill(0,255);
    text("Next",0,550);
    popMatrix();
  }
  
  void drawRulesScreen(){
    pushMatrix();
    translate(width/2,25);
    textFont(font);
    textSize(30);
    fill(0,255);
    textAlign(CENTER);
    textSize(32);
    text("Rules and Controls\n\n\nPress the spacebar to shoot out vaccines that harm viruses\nUse the arrow keys to move around\nYour drone takes damage if you touch a virus or the plasmids"+
    "\nCollect        to gain a shield\nCollect        to double your vaccine damage\nCollect        to gain some health\nThe game is over when your drone runs out of health\n\nClick next to begin the game.",0,0);
    noFill();
    stroke(0);
    rect(-40,580,80,40);
    fill(0,255);
    text("Next",0,610);
    
    pushMatrix();
    translate(-55, 290); ////refine
    fill(#95beed,100);
    stroke(#95beed);
    circle(0,0,30);
    popMatrix();
    
    pushMatrix();
    translate(-165, 340); ////refine
    fill(#c21010,100);
    stroke(#c21010);
    circle(0,0,30);
    popMatrix();
    
    pushMatrix();
    translate(-80, 390); ////refine
    fill(#53eb4b,100);
    stroke(#53eb4b);
    circle(0,0,30);
    popMatrix();
      
    popMatrix();
  }
  
  void drawGameOverScreen(){
    pushMatrix();
    translate(width/2,25);
    textFont(font);
    textSize(30);
    fill(0,255);
    textAlign(CENTER);
    textSize(32);
    text("Game Over\n\n\n\n\nYou fought well today, but there are more drones and more vaccines to deliver.\nYour final score was "+score.score+"\nClick Retry to go back to the start screen.",0,0);
    noFill();
    stroke(0);
    rect(-40,520,80,40);
    fill(0,255);
    text("Retry",0,550);
    popMatrix();
  }
  
  void drawAchievement(){
    pushMatrix();
    translate(5,height-40);
    textFont(font);
    textSize(30);
    textAlign(LEFT);
    fill(0,255);
    if(survivalAchievement&&!survivalAchievementDone&&!achievementBeingDisplayed2){
      text("Achievement: Don't take damage for 10 seconds",0,0);
    }
    if(noDamageAchievement&&!noDamageAchievementDone&&!achievementBeingDisplayed1){
      text("Achievement: Kill 10 enemies without taking damage",0,0);
    }
    popMatrix();
    textAlign(CENTER);
  }
  
  void achievementTracker(){
    if(millis()-survivalTimer>10000 && timerStart){
      survivalAchievement=true;
    }
    if(noDamageCounter>=10){
      noDamageAchievement=true;
    }
  }
  
  void gameReset(){
    drone.hurt();
    score.score=0;
    drone.health=10;
    for(int i=0;i<viruses.size();i++){
      viruses.get(i).velocity.set(random(-1,1),random(-1,1));
    }
  }
}

void mousePressed(){
  if (mouseX>width/2-40 && mouseX<width/2+80 && mouseY>545 && mouseY<585){
    if (!gameHandler.rulesBegin)gameHandler.rulesBegin=true;///bad!!!
  }
  if (mouseX>width/2-40 && mouseX<width/2+80 && mouseY>605 && mouseY<645){
    if (!gameHandler.gameBegin)gameHandler.gameBegin=true;///bad!!!
  }
  if (mouseX>width/2-40 && mouseX<width/2+80 && mouseY>545 && mouseY<585 && gameHandler.gameOver){
    gameHandler.rulesBegin=false;
    gameHandler.gameBegin=false;
    gameHandler.gameOver=false;
    gameHandler.gameReset();
  }
}
