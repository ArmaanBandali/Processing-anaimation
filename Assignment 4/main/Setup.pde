ArrayList<PImage> symbols=new ArrayList<PImage>();
ArrayList<PImage> temp=new ArrayList<PImage>();

//holds the states of the game
enum gameState{
  gameStart,
  landingScreen,
  mowingGame,
  trashGame,
  memoryGame,
  hallway,
  gameEnd,
  gameOver
}

//holds the levels of the game
enum level{
  levelOne,
  levelTwo,
  levelThree
}

int j=0;
int k=0;

//initialize all images used in the game
void createImages(){
  landingScreen=createImage(1200,800,RGB);
  gameOver=createImage(1200,800,RGB);
  hallway=createImage(1200,800,RGB);
  gamingRoom=createImage(1200,800,RGB);
  backyard=createImage(1200,800,RGB);
  street=createImage(1200,800,RGB);
  bedroom=createImage(1200,800,RGB);
  trashBag=createImage(50,50,RGB);
  trashBin=createImage(110,100,RGB);
  card=createImage(50,50,RGB);
  symbol1=createImage(25,25,RGB);
  symbol2=createImage(25,25,RGB);
  symbol3=createImage(25,25,RGB);
  symbol4=createImage(25,25,RGB);
  symbol5=createImage(25,25,RGB);
  symbol6=createImage(25,25,RGB);
  symbol7=createImage(25,25,RGB);
  symbol8=createImage(25,25,RGB);
  symbol9=createImage(25,25,RGB);
  symbol10=createImage(25,25,RGB);
  symbol11=createImage(25,25,RGB);
  symbol12=createImage(25,25,RGB);
  landingScreen.loadPixels();
  gameOver.loadPixels();
  hallway.loadPixels();
  gamingRoom.loadPixels();
  backyard.loadPixels();
  street.loadPixels();
  bedroom.loadPixels();
  trashBag.loadPixels();
  trashBin.loadPixels();
  card.loadPixels();
  symbol1.loadPixels();
  symbol2.loadPixels();
  symbol3.loadPixels();
  symbol4.loadPixels();
  symbol5.loadPixels();
  symbol6.loadPixels();
  symbol7.loadPixels();
  symbol8.loadPixels();
  symbol9.loadPixels();
  symbol10.loadPixels();
  symbol11.loadPixels();
  symbol12.loadPixels();
  for (int i = 0; i < card.pixels.length; i++) {
    trashBag.pixels[i] = #000000; //black
    card.pixels[i] = #3041c7; //darker blue
  }
  for (int i=0;i<gamingRoom.pixels.length;i++){
    landingScreen.pixels[i] = #ffffff; //white
    gameOver.pixels[i] = #ffffff; //white
    gamingRoom.pixels[i] = #f72f2f; //red
    backyard.pixels[i] = #3ee632; //green
    street.pixels[i] = #6c6e6b; //grey
    bedroom.pixels[i] = #ecbcf5; //light pink
  }
  for (int i=0;i<symbol1.pixels.length;i++){
    symbol1.pixels[i] = #ffffff; //white
    symbol2.pixels[i] = #d41515; //red
    symbol3.pixels[i] = #2e0404; //brown
    symbol4.pixels[i] = #543e3e; //mauve
    symbol5.pixels[i] = #4ad417; //green
    symbol6.pixels[i] = #180cb3; //blue
    symbol7.pixels[i] = #60aab3; //turquoise
    symbol8.pixels[i] = #faf87a; //yellow
    symbol9.pixels[i] = #fa61d6; //pink
    symbol10.pixels[i] = #f0ba8b; //peach
    symbol11.pixels[i] = #ff7700; //orange
    symbol12.pixels[i] = #a5ff8a; //light green
  }
  for (int i=0;i<backyard.pixels.length;i++){
    if(i/1200==j+1){
      j++;
    }
    if(k==1200){
      k=0;
    }
    if(j<225||j>height-228){
      backyard.pixels[i] = #bcf5c6; //lawn mowed green
    }
    else{
      if(k<295||k>width-228){ ///////////////////////////////////
        backyard.pixels[i] = #bcf5c6; //lawn mowed green
      }
      else{
        backyard.pixels[i] = #3ee632; //green
      }
    }
    k++;
  }
  for (int i=0;i<trashBin.pixels.length;i++){
    trashBin.pixels[i] = #db9c44; //orange
  }
  j=0;
  for (int i=0;i<hallway.pixels.length;i++){
    if(j==width){
      j=0;
    }
    if(j<width/3){
      hallway.pixels[i] = #824fb8; //purple
    }
    else if(j>=width/3&&j<2*width/3){
      hallway.pixels[i] = #7dafe8; //blue
    }
    else{
      hallway.pixels[i] = #b4f29d; //green
    }
    j++;
  }
  
  hallway=loadImage("Images/hallway.png");
  backyardbg=loadImage("Images/backyard.png");
  street=loadImage("Images/trashbg.png");
  bedroom=loadImage("Images/memorybg.png");
  gamingRoom=loadImage("Images/gamingRoom.png");
  
  lawnMower=new PImage[4];
  loadImages(lawnMower,"lawnmower");
  gopher=new PImage[5];
  loadImages(gopher,"gopher");
  resizeImages(gopher,38,76);
  character=new PImage[5];
  loadImages(character,"shooting");
  resizeImages(character,int(character[0].width*1.25),int(character[0].height*1.25));
  
  trashBag=loadImage("Images/bag.png");
  trashBin=loadImage("Images/trashcan1.png");
  trashBin2=loadImage("Images/trashcan1.png");
  trashBin3=loadImage("Images/trashcan1.png");
  dog=loadImage("Images/dog1.png");
  hand1=loadImage("Images/hand1.png");
  hand2=loadImage("Images/hand2.png");
  dialogueBubble=loadImage("Images/dialogueBubble.png");
  
  hand1.resize(50,60);
  hand2.resize(50,60);
  trashBag.resize(100,100);
  trashBin.resize(150,150);
  trashBin2.resize(150,200);
  trashBin3.resize(150,250);
  
  randomizeSymbols();
  landingScreen.updatePixels();
  gameOver.updatePixels();
  hallway.updatePixels();
  gamingRoom.updatePixels();
  backyard.updatePixels();
  street.updatePixels();
  bedroom.updatePixels();
  lawnMower[0].updatePixels();
  trashBag.updatePixels();
  trashBin.updatePixels();
}

//load an array of images, based off of Eric's tutorials
void loadImages(PImage[] imgArray, String imageName){ 
  for (int i=1; i<imgArray.length+1; i++) {
    PImage temp=loadImage("Images/"+imageName+i+".png");
    imgArray[i-1]=temp;
  }
}

//resize an array of images
void resizeImages(PImage[] imgArray, int resizeX, int resizeY){
  for (int i=0; i<imgArray.length; i++) {
    imgArray[i].resize(resizeX,resizeY);
  }
}
