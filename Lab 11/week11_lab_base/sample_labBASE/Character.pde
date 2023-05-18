class Character extends MovingObject {

  int health;
  int hitTimer;

  Character(PVector pos, PVector vel, PImage img) {
    super(pos, vel, img);
    health=3;
  }

  void update() {
    super.update();
    if (hitTimer>0) hitTimer--;
  }
  void takeDamage(int damage) {
    if (hitTimer==0) {
      health-=damage;
      hitTimer=30;
      if (health<=0)
        die();
    }
  }

  void die() {
  }
}
