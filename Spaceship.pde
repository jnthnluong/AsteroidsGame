class Spaceship extends Floater  
{   
  //your code here
  /*
    protected int corners;  //the number of corners, a triangular floater has 3   
   protected int[] xCorners;   // x coordinate of a corner
   protected int[] yCorners;   // y coordinate of a corner
   // coordinates work like coordinates in the triangle() function, 
   protected int myColor;   
   protected double myCenterX, myCenterY; //holds center coordinates   
   protected double myXspeed, myYspeed; //holds the speed of travel in the x and y directions   
   protected double myPointDirection; //holds current direction the ship is pointing in degrees    
   */
  Spaceship() {
    corners = 8;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -20; 
    yCorners[0] = 40; 
    
    xCorners[1] = 20;
    yCorners[1] = 40;
   
    xCorners[2] = 40;
    yCorners[2] = 20;
    
    xCorners[3] = 40;
    yCorners[3] = -20;
    
    xCorners[4] = 20;
    yCorners[4] = -40;
    
    xCorners[5] = -20;
    yCorners[5] = -40;
    
    xCorners[6] = -40;
    yCorners[6] = -20;
    
    xCorners[7] = -40;
    yCorners[7] = 20;
    
    

    
    myColor = color(50,130,149);
    myCenterX = width/2;
    myCenterY = height/2;
    myXspeed = 5;
    myYspeed = 5;
    myPointDirection = 90;
  }
}
