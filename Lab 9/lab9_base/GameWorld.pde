class GameWorld {
  //class that represents the game world.
  //the game world is an image
  PImage map;
  int mapWidth;
  int mapHeight;

  GameWorld() {
    //load the background image
    map = loadImage("background.png");
    map.resize(2*map.width, 2*map.height); //interesting................
    //scale up the image by factor of 2
    mapWidth = map.width;
    mapHeight = map.height;   
  }

  void display() {
    //display the image
    image(map, 0, 0, mapWidth, mapHeight);
  }
}
