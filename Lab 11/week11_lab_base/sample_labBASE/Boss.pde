class Boss extends Character {
  int MAX_HEALTH=10;

  Boss(PVector pos, PVector vel, PImage img) {
    super(pos, vel, img);
    health=10;
  }

  void die() {
    winGame();
  }

  void drawMe() {
    pushMatrix();
    translate(pos.x, pos.y);
    float healthRatio=(float)health/(float)MAX_HEALTH;
    float ARC=TWO_PI*healthRatio;
    fill(0);
    arc(0, -img.height/2-30, 60, 60, 0, ARC);
    image(img, -img.width/2, -img.height/2);
    popMatrix();
  }
}
