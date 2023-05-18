class Enemy extends Character {


  Enemy(PVector pos, PVector vel, PImage img) {
    super(pos, vel, img);
  }

  void die() {
    
    score++;
    println(score);
    enemies.remove(this);
  }
}
