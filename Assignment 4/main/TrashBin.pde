class TrashBin extends GameObject{
  TrashBin(PVector pos,PImage img){
    super(pos,img);
    dimensions=new PVector(110,100);
    active=true;
  }
  
  //draw the trashbin
  void drawMe(){
    super.drawMe();
  }
}
