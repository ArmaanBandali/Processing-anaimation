class GameObject{
  PVector position;
  boolean active;
  PImage image;
  PVector dimensions;
  int imageCount=0;
  int imageRef=0;
  
  GameObject(PVector pos, PImage img){
    position=pos;
    image=img;
    dimensions=new PVector(img.width,img.height);
  }
  
  //draw the object
  void drawMe(){
    image(image,position.x,position.y);
  }
  
  //update the object
  void update(){
  }
  
  //check for collisions with another object
  boolean collision(GameObject object){
    return abs(object.position.x+object.dimensions.x/2-(position.x+dimensions.x/2))<object.dimensions.x/2+dimensions.x/2 && abs(object.position.y+object.dimensions.y/2-(position.y+dimensions.y/2))<object.dimensions.y/2+dimensions.y/2;
  }
  
  //animate this object
  void animate(PImage[] imgs, int frameRate){
    if(imageCount%frameRate==0){
      if(imageRef<imgs.length-1){
        imageRef++;
      }
    }
    image=imgs[imageRef];
  }
}
