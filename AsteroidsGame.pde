//your variable declarations here
Spaceship Ball;
public void setup() 
{
  size(800,800);
  background(0);
  //Loop();
  //your code here
  Ball = new Spaceship();
  Ball.setXspeed(0);
  Ball.setYspeed(0);
}

public void draw() 
{
  background(0);
  //your code here
  Ball.move();
  Ball.show();
}
public void keyPressed(){
  System.out.println(keyCode);
  if(keyCode == 87){
    Ball.accelerate(-2.5);
  }
  if(keyCode == 65){
    Ball.turn(-10);
  }
  if(keyCode == 68){
    Ball.turn(10);
  }
  if(keyCode == 83){
    //check if ball has a non 0 speed then start dropping it toward 0?? this might not work bc the spaceship rotates and its movement is a little funny
    if(Ball.getXspeed() != 0){
      Ball.accelerate(2.5);
    }
    
  }
  /*
  key codes
  w = 87
  a = 65
  s = 83
  d = 68
  */
}
