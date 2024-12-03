
//your variable declarations here
Star [] backgroundStars = new Star [400];
Spaceship Ball;
public boolean rotatingR = false;
public boolean rotatingL = false;

Asteroid scaryBall;
public void setup() 
{
  size(800, 800);
  background(0);
  //Loop();
  //your code here
  scaryBall = new Asteroid();
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
  if(rotatingR){
    Ball.turn(5);
  }
  if(rotatingL){
    Ball.turn(-5);
  }
  if(Ball.isForward()){
    Ball.accelerate(-0.25/2);
  }
  if(Ball.isBackward()){
    Ball.accelerate(0.25/2);
  }
  //your code here
  Ball.move();
  Ball.show();
  scaryBall.move();
  scaryBall.show();
}//-7 , 13
public void keyReleased(){
  if(key == 'd' || key == 'D'){
    rotatingR = false;
  }
  if(key == 'a' || key == 'A'){
    rotatingL = false;
  }
  if(key == 'w' || key == 'W'){
    Ball.setForward(false);
  }
  if(key == 's' || key == 'S'){
    Ball.setBackward(false);
  }
}
public void keyPressed() {
  //System.out.println(key);
  if (key == 'w' || key == 'W') {
   //Ball.accelerate(-2.5);
    Ball.setForward(true);
  }
  if (key == 'd' || key == 'D') {
    //Ball.turn(5);
    rotatingR = true;
  }
  if (key == 'a' || key == 'A') {
    //Ball.turn(-5);
    rotatingL = true;
  }
  if (key == 's' || key == 'S') {
    Ball.setBackward(true);
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
