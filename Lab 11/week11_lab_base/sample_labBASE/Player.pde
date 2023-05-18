class Player extends Character {
  final static int MAX_HEALTH=10;

  ArrayList<Missile> missiles;
  int fireTimer;
  int turning=1;
  int invincibleTimer;
  
  int currFrame = 0;      //index referring to the current frame being displayed
  PImage[] activeFrames;  //pointer referring to the currently active image sequence
  int animationRate = 6;


  Pickup item;
  int attackPower=1;

  Player(PVector pos, PImage catImg) {
    super(pos, new PVector(), catImg);
    activeFrames = catFramesSitting; //it's in sitting state initially, so set its image sequence active
    damp=0;
    health=MAX_HEALTH;
    missiles=new ArrayList<Missile>();
  }
  
   void updateFrame() {
     if (frameCount % animationRate == 0) { //Display each image for 6 frames before switching to the next 
        if (currFrame < activeFrames.length-1) //if within array length
           currFrame++;                        //switch to the next image
        else 
           currFrame = 0; //if reaching the end of the array restart from the begining
  
        img = activeFrames[currFrame];
      }
    }

  //override the overSide wall collision handler to prevent the player from going offscreen
  void overSide(int side) {
    switch(side) {
    case NORTH:
      pos.y=img.height/2;
      break;
    case SOUTH:
      pos.y=height-img.height/2;
      break;
    case EAST:
      pos.x=width-img.width/2;
      break;
    case WEST:
      pos.x=img.width/2;
      break;
    }
  }

  void takeDamage(int dmg) {
    if (invincibleTimer==0&&hitTimer==0) {
      super.takeDamage(dmg);
      playSound(MEOW);
      //Your job: play sound MEOW
    }
  }

  void die() {
    loseGame();
  }



  void update() {
    super.update();
    if (fireTimer>0) fireTimer--;

    if (invincibleTimer>0) {
      invincibleTimer--;
      image(item.img, pos.x-item.img.width/2, pos.y-item.img.height/2);
    }

    if (invincibleTimer==0) item=null;

    updateMissiles();

    updateFrame();
  }

  void fire() {
    if (fireTimer==0) {
      missiles.add(new Missile(new PVector(pos.x+(turning*catFramesSitting[0].width/2), pos.y), new PVector(turning*5, 0), missileImg));
      fireTimer=30;
      playSound(FIRE);
      //Your job: play sound FIRE
    }
  }

  void drawMe() {
    pushMatrix();
    translate(pos.x, pos.y);
    scale(turning, 1);
    image(img, -img.width/2, -img.height/2);
    popMatrix();
  }


  void updateMissiles() {
    for (int i=0; i<missiles.size(); i++) {
      Missile m = missiles.get(i);
      m.update(missiles);
      m.drawMe();

      for (int j=0; j<enemies.size(); j++) {
        Enemy e= enemies.get(j);
        if (m.collision(e)) {
          e.takeDamage(attackPower);
          m.isDead=true;
        }
      }

      if (boss!=null&&m.collision(boss)) {
        boss.takeDamage(attackPower);
        m.isDead=true;
      }
    }
  }

  void drawHealthBar() {
    pushMatrix();
    translate(5, 5);
    noStroke();
    fill(255, 200, 200);
    float percent=(float) health/ MAX_HEALTH;
    rect(0, 0, 500*percent, 50);
    popMatrix();
  }
  
  void sit() {
     activeFrames = catFramesSitting;
  }
  
  void walk() {
     activeFrames = catFramesMoving; //set walking image sequence active
  }
  
  void attack() {
     activeFrames = catFramesAttack; //set attacking image sequence active
  }
}
