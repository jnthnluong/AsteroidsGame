class Bullet extends Floater {
  private int timer;
  Bullet(Spaceship theShip) {
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myPointDirection = 180+theShip.getDirection(); //+180 so that it shoots from the front
    myColor = 255;
    myXspeed = theShip.getXspeed();
    myYspeed = theShip.getYspeed();
    accelerate(6);
  }

  void show() {
    fill(myColor);
    noStroke();
    ellipse((float)myCenterX, (float)myCenterY, 5, 5);
  }
  void move() {
    myCenterX += myXspeed;    //no screen wrap
    myCenterY += myYspeed;     
    timer++;
  }
  public int getTimer() {
    return timer;
  }
}
