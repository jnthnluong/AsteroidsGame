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
  private boolean movingF, movingB;

  public Spaceship() {
    movingF = false;
    movingB = false;
    corners = 9;
    xCorners = new int[corners];
    yCorners = new int[corners];

    xCorners[0] = -50/2;
    yCorners[0] = 50/2;

    xCorners[1] = 50/2;
    yCorners[1] = 0;

    xCorners[2] = -50/2;
    yCorners[2] = -50/2;

    xCorners[3] = 0;
    yCorners[3] = 50/2;

    xCorners[4] = 50/2;
    yCorners[4] = -50/2;

    xCorners[5] = -120/2; // tip of the spaceship
    yCorners[5] = 0;

    xCorners[6] = 50/2;
    yCorners[6] = 50/2;

    xCorners[7] = 0;
    yCorners[7] = -50/2;

    xCorners[8] = -50/2;
    yCorners[8] = 50/2;

    //xCorners[1] = 0;
    // yCorners[1] = 60;
    /*
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
     
     xCorners[6] = -30;
     yCorners[6] = -50;
     
     xCorners[7] = -40;
     yCorners[7] = -20;
     
     xCorners[8] = -40;
     xCorners[8] = -80;
     
     xCorners[9] = -40;
     yCorners[9] = 20;
     
     xCorners[10] = -30;
     yCorners[10] = 50;
     
     */



    myColor = color(175, 168, 168);
    //198,88,88 redish vermilion color


    myCenterX = width/2;
    myCenterY = height/2;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 90;
  }
  // my additions to the floater class (mainly getters and setters) 
  // ALSO there are only getters if i ever want to get a specific speed
  public void setXspeed(double speed) {
    myXspeed = speed;
  }
  public void setCenterX(double x) {
    myCenterX = x;
  }
  public void setCenterY(double y) {
    myCenterY = y;
  }
  public void setYspeed(double speed) {
    myYspeed = speed;
  }
  public double getYspeed() {
    return myYspeed;
  }
  public double getXspeed() {
    return myXspeed;
  }
  public void setDirection(double direction) {
    myPointDirection = direction;
  }
  public color getColor() {
    return myColor;
  }
  public boolean isForward(){
    return movingF;
  }
  public boolean isBackward(){
    return movingB;
  }
  public void setForward(boolean x){
    movingF = x;
  }
  public void setBackward(boolean x){
    movingB = x;
  }
   public void show ()  //copy of show from floater to create jets and hyperspace animations
  {             
    fill(myColor);
    //noFill();
    stroke(0);    

    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));

    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);

    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);
    
    if(movingF){
      stroke(247,161,47);
      fill(247,161,47);
    
      //line(15,5,40,5);
      rect(15,10,25,2.5);
      rect(15,-10,25,2.5);
    }
    if(movingB){
      stroke(247,161,47);
      fill(247,161,47);
      
      rect(-40,15,25,2.5);
      rect(-40,-15,25,2.5);
    }

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
 
}
