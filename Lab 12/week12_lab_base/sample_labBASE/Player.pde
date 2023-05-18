class Player extends Character {
  final static int MAX_HEALTH=10;

  ArrayList<Missile> missiles;
  int fireTimer;
  int turning=1;
  int invincibleTimer;


  Pickup item;
  int attackPower=1;

  Player(PVector pos, PImage catImg) {
    super(pos, new PVector(), catImg);
    damp=0;
    health=MAX_HEALTH;
    missiles=new ArrayList<Missile>();
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

  void updateFrame() {
    //Your job: implement this method to animate the player avater: cat
  }

  void fire() {
    if (fireTimer==0) {
      missiles.add(new Missile(new PVector(pos.x+(turning*catSitImg.width/2), pos.y), new PVector(turning*5, 0), missileImg));
      fireTimer=30;
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
}
