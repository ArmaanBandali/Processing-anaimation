// Health powerup shows up as a black dot and restores 3 health
class Powerup{
  PVector pos;
  int dim;
  boolean active;
  boolean done;
  
  Powerup(){
    //pos=new PVector(random(0,width),random(0,height));
    pos=new PVector(width/2, height/2);
    active=false;
    done=false;
    dim=35;
  }
  
  boolean collision(Avatar other) {
    if (dist(pos.x, pos.y, other.pos.x+other.img.width/2, other.pos.y+other.img.height/2) < other.img.width/2+dim/2) {
      return true;
    }
    return false;
  }
  
  void drawMe(){
    if(active){
      pushMatrix();
      fill(0);
      noStroke();
      circle(pos.x,pos.y,dim);
      popMatrix();
    }
  }
}
