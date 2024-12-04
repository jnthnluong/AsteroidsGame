class Asteroid extends Floater {
  private double myRotationSpeed;
  private int myAsteroidType,mySize;
  Asteroid() {
    myAsteroidType = (int)(Math.random()*2);
    myRotationSpeed = 5;
    //myColor = color(157,133,133);
    myColor = 255;
    myCenterX = (int)(Math.random()*width);
    myCenterY = (int)(Math.random()*height);
    myXspeed = 4;
    myYspeed = 4;
    myPointDirection = (int)(Math.random()*360);
    myRotationSpeed = 1;
    corners = 5;
    xCorners = new int[corners];
    yCorners = new int[corners];
   // System.out.println(myAsteroidType);
    if (myAsteroidType == 0) {
      xCorners[0] = -40;
      yCorners[0] = 40;

      xCorners[1] = 20;
      yCorners[1] = 20;

      xCorners[2] = 20;
      yCorners[2] = -20;

      xCorners[3] = -20;
      yCorners[3] = -20;

      xCorners[4] = -40;
      yCorners[4] = 20;
    }

    if (myAsteroidType == 1) {
      xCorners[0] = -20;
      yCorners[0] = 20;

      xCorners[1] = 20;
      yCorners[1] = 20;

      xCorners[2] = 40;
      yCorners[2] = 0;

      xCorners[3] = 0;
      yCorners[3] = -20;

      xCorners[4] = -40;
      yCorners[4] = -20;
    }
    int maxXDist = 0;
    int maxYDist = 0;
    for(int i = 0; i < corners; i++){ //bad, fix yes
      if(xCorners[i] > maxXDist) maxXDist = xCorners[i];
      if(yCorners[i] > maxYDist) maxYDist = yCorners[i];
      
    }
    mySize = maxXDist*maxYDist;



    for (int i = 0; i < corners; i++) {
      xCorners[i] = xCorners[i] + (int)(Math.random()*40-20);
      yCorners[i] = yCorners[i] + (int)(Math.random()*40-20);
    }
    /*
      xCorners[0] = -20;
     yCorners[0] = 20;
     
     xCorners[1] = 20;
     yCorners[1] = 20;
     
     xCorners[2] = 40;
     yCorners[2] = 0;
     
     xCorners[3] = 0;
     yCorners[3] = -20;
     
     xCorners[4] = -40;
     yCorners[4] = -20;
     */
  }
  public int getSize(){
    return mySize;
  }
  public void move() {
  }

  public void turn() {
  }

  
}
