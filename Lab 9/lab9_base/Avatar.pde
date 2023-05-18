class Avatar {
  //image that is the character
  PVector pos;
  PVector vel;
  float damp = 0.8; //constant damping factor

  int maxHealth=10;
  int health = maxHealth;
  float healthPercentage=1;
  PImage img;

  Avatar(PImage img, PVector pos) {
    //what to do with the img parameter?
    this.img = img;
    this.pos = pos;
    vel = new PVector();
  }


  void move(PVector acc) {
    vel.add(acc);
  }


  void update() {
      //the winning condition: if the character reaches the top, we need to update the state to WON.
    if (pos.y < 0) {
       pos.y =0;
       if (state==LEVEL_ONE){
         state=LEVEL_TWO;
       }
       else{
         state = WON;
       }
       clearLevel();
    } 
    vel.mult(damp);
    pos.add(vel); 

    //boundary detection. just keep the player from going off the walls.
    if (pos.x<img.width/2) pos.x=img.width/2;
    if (pos.x>width-img.width/2) pos.x=width-img.width/2;
    if (pos.y>height-img.height/2) pos.y=height-img.height/2;
    
    if (health==7&&!powerup.done){
      powerup.active=true;
    }
    healthPercentage=(float)health/maxHealth;

    //the win condition: if the character reaches the top, 
    //we need to update the state to WON.
  }

  void hit() {
    health--;

    //reposition the character in the middle of the bottom of the window
    repositionAtBottomOfScreen(); //defined a new method to place player at bottom screen. 

    //and update the health percentage
    healthPercentage=(float)health/maxHealth;

    //check if the health is 0 (i.e. the player has lost)
    //if yes, set the state to LOST
    //replace the character in the middle of the screen
    if(health==0){
      state=LOST;
    }
  }

  void drawMe() {
    pushMatrix();
    translate(pos.x, pos.y);
    image(img,0,0);
    //draw the image
    popMatrix();
  }

  //defined a new method to place player at bottom screen. rationale: we need to perform this operation
  //at multiple points in the game. both when we take a hit, and when  we clear a level. whenever you need 
  //to perform an operation involving multiple lines of code or these lines are repeated in more than one 
  //occasion in your sketch, consider defining a method to optimize your code structure.
  void repositionAtBottomOfScreen() {
    pos.x=width/2-img.width/2;
    pos.y=height-img.height/2;
  }

  void drawHealthBar() {
    int healthBarWidth = 200;
    pushMatrix();
    fill(0, 64);
    translate(20, 20);
    rect(0, 0, healthBarWidth, 20); //container for health
    fill(255, 0, 0, 255);
    rect(0, 0, healthBarWidth * healthPercentage, 20); //health bar
    popMatrix();
  }
}
