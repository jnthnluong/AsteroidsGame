//your variable declarations here
Floater Ball;
public void setup() 
{
  size(800,800);
  background(0);
  noLoop();
  //your code here
  Ball = new Spaceship();
}

public void draw() 
{
  //your code here
  Ball.move();
  Ball.show();
}
