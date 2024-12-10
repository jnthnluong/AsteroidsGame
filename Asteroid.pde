class Asteroid extends Floater {
  private double myRotationSpeed,myAvgRadius;
  private int myAsteroidType;
  Asteroid() {
   
    myAsteroidType = (int)(Math.random()*2);
    myRotationSpeed = Math.random()*4-2;
    //myColor = color(157,133,133);
    myColor = color(98,61,64);
    myCenterX = (int)(Math.random()*width+width); // +width so that asteroids come from the side of the screen
    myCenterY = (int)(Math.random()*height+height);
    myXspeed = Math.random()*4-2;
    myYspeed = (Math.random()*4-2);
    myPointDirection = (int)(Math.random()*360);
    myRotationSpeed = 1;
    corners = 5;
    xCorners = new int[corners];
    yCorners = new int[corners];
   // System.out.println(myAsteroidType);
    if (myAsteroidType == 0) { // just a little variation in each asteroid shape
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
    
   

    for (int i = 0; i < corners; i++) { // makes every asteroid different
      xCorners[i] = xCorners[i] + (int)(Math.random()*40-20);
      yCorners[i] = yCorners[i] + (int)(Math.random()*40-20);
    }
    double avgRadius = 0;
    for (int g = 0; g < xCorners.length; g++) {
      double temp = dist((float)myCenterX,(float)myCenterY,(float)(xCorners[g]+myCenterX), (float)(yCorners[g]+myCenterY));
      //System.out.println(temp);
      avgRadius += temp;
    }
    myAvgRadius = avgRadius/5;
    //System.out.println(myAvgRadius);
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
 
  public double getRadius(){
    return myAvgRadius;
  }
  public void move() {
    super.move();
    super.turn(myRotationSpeed);
  }

  
  
  public int[] getXCorners(){
    return xCorners;
  }
  public int [] getYCorners(){
    return yCorners;
  }

  
}
