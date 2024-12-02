class Asteroid extends Floater{
  private double myRotationSpeed;
  Asteroid(){
    myRotationSpeed = 5;
    //myColor = color(157,133,133);
    myColor = 255;
    myCenterX = (int)(Math.random()*width);
    myCenterY = (int)(Math.random()*height);
    myXspeed = 4;
    myYspeed = 4;
    myPointDirection = (int)(Math.random()*360);
    
    corners = 5;
    xCorners = new int[corners];
    yCorners = new int[corners];
    
    xCorners[0] = 0;
    yCorners[0] = 30;
    
    xCorners[1] = 40;
    yCorners[1] = 20;
    
    xCorners[2] = 20;
    yCorners[2] = -40;
    
    xCorners[3] = -30;
    yCorners[3] = -30;
    
    xCorners[4] = 30;
    yCorners[4] = 10;
    
    
    
  }
  public void move(){
    
  }
  
  public void turn(){
    
    
  }
  
  public int getX(){
    return (int)myCenterX;
  }
  public int getY(){
    return (int)myCenterY;
  }
  
}
