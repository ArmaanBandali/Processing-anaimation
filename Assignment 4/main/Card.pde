class Card extends GameObject{
  PImage symbol;
  boolean chosen=false;
  Card(PVector pos, PImage img, PImage symbol){
    super(pos,img);
    this.symbol=symbol;
    active=true;
  }
  
  //draw the card if it hasn't been matched yet, blue for unselected, white for selected
  void drawMe(){
    if (active){
      super.drawMe();
      if (chosen){
        fill(#f4f72f);
        image(symbol,position.x+image.width/2-symbol.width/2,position.y+image.height/2-symbol.height/2);
      }
    }
  }
}
