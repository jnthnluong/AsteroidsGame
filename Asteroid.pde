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
