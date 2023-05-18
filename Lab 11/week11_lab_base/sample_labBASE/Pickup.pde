class Pickup extends MovingObject {


  Pickup(PVector pos, PVector vel, PImage img) {
    super(pos, vel, img);
    img.resize(60, 60);
  }

  void takeEffect() {
    if (p.invincibleTimer==0) {
      p.invincibleTimer=120;
      if(p.health < Player.MAX_HEALTH) p.health++;
      
      pickups.remove(this);
      p.item=this;
      playSound(POWERUP);
      //Your job: play sound POWERUP
    }
  }
}
