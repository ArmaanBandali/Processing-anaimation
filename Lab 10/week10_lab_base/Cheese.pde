class Cheese extends Block {
  PImage img;

  Cheese(PVector pos, PVector dim) {
    super(pos, dim);
    img = loadImage("data/cheese1.png");
    img.resize((int) dim.x, (int) dim.y);
  }

  void drawMe() {
    pushMatrix();
    translate(pos.x, pos.y);
    image(img, -dim.x/2, -dim.y/2);
    popMatrix();
  }
  
  void drawMe(Character c) {
    pushMatrix();
    translate(-c.pos.x+pos.x, pos.y);
    image(img, -dim.x/2, -dim.y/2);
    popMatrix();
   }
  
   boolean check(Character c) {
        if (abs(c.pos.x - (pos.x-c.pos.x)) < c.dim.x / 2 + dim.x / 2 &&
            abs(c.pos.y - pos.y) < c.dim.y / 2 + dim.y / 2) {
              gameWorld.blocks.remove(this);
            return true;
        }
        return false;
  }
}
