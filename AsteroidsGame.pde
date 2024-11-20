//your variable declarations here
Star [] backgroundStars = new Star [400];
Spaceship Ball;
public void setup() 
{
  size(800, 800);
  background(0);
  //Loop();
  //your code here
  Ball = new Spaceship();
  Ball.setXspeed(0);
  Ball.setYspeed(0);
  for (int i = 0; i <backgroundStars.length; i++) {
    backgroundStars[i] = new Star();
  }
}

public void draw() 
{
  
  background(0);
  for (int i = 0; i < backgroundStars.length; i++) {
    backgroundStars[i].move();
    backgroundStars[i].show();
  }
  //your code here
  Ball.move();
  Ball.show();
}
public void keyPressed() {
  //System.out.println(key);
  if (key == 'w' || key == 'W') {
    Ball.accelerate(-2.5);
  }
  if (key == 'd' || key == 'D') {
    Ball.turn(5);
  }
  if (key == 'a' || key == 'A') {
    Ball.turn(-5);
  }
  if (key == 's' || key == 'S') {

    Ball.accelerate(2.5);
  }
  if (keyCode == 32) { //spacebar
    fill(Ball.getColor(),100 );
    Ball.setXspeed(0);
    Ball.setYspeed(0);
    Ball.setCenterX((Math.random()*width));
    Ball.setCenterY((Math.random()*height));
    Ball.setDirection(Math.random()*360);
  }
  /*
  key codes
   w = 87
   a = 65
   s = 83
   d = 68
   */
}
