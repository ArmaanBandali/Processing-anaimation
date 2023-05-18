class TrashBag extends MovingObject{
  PVector acc;
  boolean airborne=false;
  boolean offscreen=false;
  boolean hitSide=false;
  int score=0;
  int target=1;
  ArrayList<TrashBin> cans;
  int toRemove=-1;
  boolean remove=false;
  boolean trashed=false;
  
  TrashBag(PVector pos,PImage img){
    super(pos,img);
    acc=new PVector(0,0.1);
    velocity=new PVector(0,0);
    dimensions=new PVector(50,50);
    cans=new ArrayList<TrashBin>();
    for(int i=0;i<target;i++){
      cans.add(new TrashBin(new PVector(width-160-120*i,height-155),trashBin));
    }
  }
  
  //draw the trashbag
  void drawMe(){
    super.drawMe();
    textSize(32);
    text("Score: "+score+", Target: "+target,200,300);
  }
  
  //move the trashbag
  void move(){
    super.move();
    accelerate(acc);
    checkSide();
    if(checkWalls(0,0)){
      airborne=false;
    }
  }
  
  //update the trash bins and trash bag 
  void update(){
    if (airborne){
      move();
    }
    else{
      reset();
    }
    if (trashed() && !hitSide){
      effect=minim.loadFile("Sounds/485580__porklash__st-hit-3.mp3");
      effect.play(0);
      score++;
      airborne=false;
      cans.remove(toRemove);
    }
    if (score==target){
      trashed=true;
    }
  }
  
  //check to see if the trash bag is inside the trash can
  boolean trashed(){
    for(int i=0;i<cans.size();i++){
      TrashBin bin=cans.get(i);
      if(position.x>bin.position.x && position.x<bin.position.x+bin.dimensions.x && position.y>bin.position.y){
        toRemove=i;
        return true;
      }
    }
    return false;
  }
  
  //check to see if the etrash bag hit the side of the can first
  void checkSide(){
    for(int i=0;i<cans.size();i++){
      TrashBin bin=cans.get(i);
      if(position.x<bin.position.x-20 && position.x+dimensions.x>bin.position.x && position.y+dimensions.y>bin.position.y){
        hitSide=true;
      }
    }
  }
  
  //reset the position of the trashbag
  void reset(){
    position.set(100,height-180);
    hitSide=false;
    character1.resetImage();
  }
  
  
}
