class GameHandler{
  int numberOfCharacters=6;
  int numberOfCharactersKilled=0;
  int noMiss=0; //number of characters killed without wasting a bullet
  boolean noMissDone=false;
  boolean killsDone=false;
  boolean ammoDone=false;
  int ammoBoxesClicked=0;
  int timeOfLastAdd=0; //time that the last character was added
  int achievementDisplayTime=0;
  int gameCounter=0;
  
  void displayAchievements(){
    textFont(font);
    textSize(30);
    fill(0,255);
    if (numberOfCharactersKilled==10 || killsDone){
      killsDone=true;
      if (achievementDisplayTime==0){
        updateAchievementTime();
      }
      if (millis()-achievementDisplayTime < 4000){
        text("Slayer: 10 hearts broken",5, height-40);
      }
      else {
        achievementDisplayTime=0;
        numberOfCharactersKilled++;
        killsDone=false;
      }
      return;
    }
    if (ammoBoxesClicked==5 || ammoDone){
      ammoDone=true;
      if (achievementDisplayTime==0){
        updateAchievementTime();
      }
      if (millis()-achievementDisplayTime < 4000){
        text("Gunslinger: Ammo reloaded 5 times", 5, height-40);
      }
      else {
        achievementDisplayTime=0;
        ammoBoxesClicked++;
        ammoDone=false;
      }
      return;
    }
    if (noMiss==5 && !noMissDone){
      if (achievementDisplayTime==0){
        updateAchievementTime();
      }
      if (millis()-achievementDisplayTime < 4000){
        text("Deadeye: 5 hearts broken without missing", 5, height-40);
      }
      else {
        achievementDisplayTime=0;
        noMissDone=true;
      }
      return;
    }
  }
  
  void updateNumCharacters(int numCharacters){
    numberOfCharacters=numCharacters;
  }
  
  int numberOfCharacters(){
    return numberOfCharacters;
  }
  
  boolean newCharacter(){
    return millis()-timeOfLastAdd > 2000;
  }
  
  void addNewCharacter(){
    timeOfLastAdd=millis();
  }
  
  void updateKilled(){
    numberOfCharactersKilled++;
  }
  
  void updateNoMiss(){
    noMiss++;
  }
  
  void resetNoMiss(){
    noMiss=0;
  }
  
  void ammoBoxesClicked(){
    ammoBoxesClicked++;
  }
  
  void updateAchievementTime(){
    achievementDisplayTime=millis();
  }
  
  void updateGameCounter(){
    gameCounter=millis();
  }
  
  int gameCounter(){
    return gameCounter;
  }
}
