class Character {
  //fields
  PVector pos, vel, dim;
  float damp = 0.8; //constant damping factor
  boolean jumping = false;
  Block block = null;
  PImage img;
  int collected=0;
  
  //a constructor to initialize the fields above with initial values
  Character(PVector pos) {
    this.pos = pos;
    vel = new PVector(); //must create instance
    dim = new PVector(30, 60);
    img=loadImage("data/mouse.png");
    img.resize(50,65);
  }
  //move method, PVector force as parameter, add to acceleration
  void move(PVector acc) {
    vel.add(acc);
  }
  
  //update the physics for the character
  void update() {
    vel.mult(damp); //multiply velocity by dampening factor (0.9-0.99);
    pos.add(vel); //add velocity to position (moves character)
   
  }
  
  void jump(PVector upAcc) {
      move(upAcc);
      jumping = true;
  }

  void landOn(Block b) {
    jumping = false;
    block = b;
    if (b instanceof Cheese) { //When it's an instance of Cheese
      collected++;
      jumping = true; //still needs to maintain jumping for further landing down 
      return;
    }  
    pos.y = b.pos.y - dim.y /2 - b.dim.y / 2;
    vel.y = 0;
  }

  void fall() {
    vel.y *= -1;
  }
  
  void drawMe() {
    pushMatrix();
    translate(pos.x, pos.y);
    //rect(-dim.x/2, -dim.y/2, dim.x, dim.y); //Show the hitbox for collision test
    if(vel.x>0){
      scale(-1,1);
    }
    image(img, -img.width/2, -img.height/2);
    //ellipse(0, 0, dim.x, dim.y);
    popMatrix();
  }
}
