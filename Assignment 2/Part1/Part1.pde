Heart character1 = new Heart(450,300);
Heart character2 = new Heart(450,300);

void setup(){
  size(900,600);
}

void draw(){
  background(#d1c7c7);
  character1.drawHeart();
  character2.drawHeart();
  character1.updatePosition();
  character2.updatePosition();
}
