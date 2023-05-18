class BossButterfly extends Butterfly {

   int health;
   float scale = 1.5;
   //Timer used to gurangantee one click only reduce health by 1 
   //(otherwise one sticky click could be counted multiple times and thereby reduce health down to 0)
   int clickTimer;

   BossButterfly(float x, float y, float xspd, float yspd) {
      super(x, y, xspd, yspd);
      health=3;
   }
   
   //Subclass overrides superclass drawButterfly() method to draw a boss charater
   void drawButterfly() {
     pushMatrix();
     translate(x, y);
     scale(scale);
  
     if(removeTimer > 0) rotate(rotPos); //Boss will rotate whole body when captured before removeTimer runs out
      //As the Boss looks the same except for rotating body, so no separate method necessary
  
        //body
        fill(250, 150, 0);
        stroke(0);
        rect(-10, -40, 20, 80, ROUND);
  
        //attenae
        line(-10, -40, -10, -60);
        noFill();
        arc(-20, -60, 20, 20, -PI, 0);
        line(10, -40, 10, -60);
        arc(20, -60, 20, 20, -PI, 0);
  
        //wings
        stroke(255, 50, 50);
        fill(0, 250, 250, 180);
        arc(-10, 0, 80, 70, radians(110), radians(250));
        arc(10, 0, 80, 70, radians(-70), radians(70));
        popMatrix();
    }
    
    void update() {
      super.update();  //call parent class' update method to 
  
      if (clickTimer>0) clickTimer--; //decrease clickTimer for each frame
    }
    
    boolean  captured() {
      boolean bossCapped = false;
      if (health > 0) {
        if (clickTimer == 0) { //only when clickTimer runs out, health will be reduced by 1
          health--;
          scale *= 0.85; //shrink by 15% with each hit
          clickTimer=30; //set the clickTimer so that a single click won't be incidentally counted as more than once 
        }
      } else {   //when heath reached 0
         bossCapped = super.captured(); //call superclass captured method to return capped and incur boss removal
      }
  
      return bossCapped;
    }
    
}
