class Missile extends MovingObject {

  boolean isDead=false;


  Missile(PVector pos, PVector vel, PImage img) {
    super(pos, vel, img);
    img.resize(60, 60);
  }



  void update(ArrayList list) {
    if (!isDead) {
      super.update(); //we only update the missile (move and draw it) if the missile is not dead.
    }
    else list.remove(this);
  }

  void overSide(int SIDE) {
    isDead=true;
  }
}
