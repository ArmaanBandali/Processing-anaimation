ArrayList<Heart> hearts = new ArrayList<Heart>();

void setup(){
  size(900,600);
  int x=0;
  int y=0;
  for (int i=0; i < 6; i++){
    x = (int)random(0,width);
    y = (int)random(0,height);
    hearts.add(new Heart(x,y)); //<>//
  }
}

void draw(){
  background(#d1c7c7);
  for (int i=0; i < hearts.size(); i++){
    hearts.get(i).drawHeart();
    hearts.get(i).updatePosition();
  }

}

//void settings(){}
