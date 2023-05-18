class Background {
  PImage img;
  int repeatX; //we should repeat the background as many times as the background covers the screen, times twice that many (for the right side)
  int repeatY;

  Background(PImage img) {
    this.img=img;
    repeatX=(((int)width/img.width)+1)*2; 
    repeatY=(((int)height/img.height)+1)*2;
  }

  void drawMe(float scrollx, float scrolly) {
    //draw several backgrounds spanning the length of the screen
    for (int i=-repeatX;i<repeatX;i++) {
      for (int j=-1;j<repeatY;j++)
        image(img, i*img.width+scrollx, j*img.height+scrolly);
    }
  }
}
