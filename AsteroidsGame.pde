
//your variable declarations here
Star [] backgroundStars = new Star [400];
Spaceship Ball;
ArrayList<Asteroid> deathBall = new ArrayList<Asteroid>();
public boolean rotatingR = false;
public boolean rotatingL = false;




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
  /* used to make a more accurate "hitcircle" for spaceship
   double avgRadius = 0;
   int [] xCorners = Ball.getXCorners();
   int [] yCorners = Ball.getYCorners();
   for (int i = 0; i < Ball.getXCorners().length; i++) {
   double temp = dist(Ball.getX(),Ball.getY(),xCorners[i]+Ball.getX(),yCorners[i]+Ball.getY());
   avgRadius +=temp;
   }
   avgRadius = avgRadius/xCorners.length;
   System.out.println(avgRadius);
   */
}

public void draw() 
{
  strokeWeight(1);
  if ((int)(Math.random()*100) == 1) {
    deathBall.add(new Asteroid());
  }
  background(0);
  for (int i = 0; i < backgroundStars.length; i++) {
    backgroundStars[i].move();
    backgroundStars[i].show();
  }
  if (hitBoxEnabled) { 
    fill(255, 0, 0, 100);
    noStroke();
    ellipse(Ball.getX(), Ball.getY(), 80, 80);
  }
  for (int i = deathBall.size()-1; i >=0; i--) { //start at largest index to address arraylist trap
    deathBall.get(i).move();
    stroke(255);
    strokeWeight(2);
    deathBall.get(i).show();
    int deathBallX = deathBall.get(i).getX();
    int deathBallY = deathBall.get(i).getY();
    int[] xCorners = deathBall.get(i).getXCorners();
    int[] yCorners = deathBall.get(i).getYCorners();
    //provides the average distance from "center"/location of asteroid to each corner
    double avgRadius = 0;
    for (int g = 0; g < xCorners.length; g++) {
      double temp = dist(deathBallX, deathBallY, xCorners[g]+deathBallX, yCorners[g]+deathBallY);
      //System.out.println(temp);
      avgRadius += temp;
    }
    avgRadius = avgRadius/xCorners.length;
    //System.out.println(avgRadius);
    if (hitBoxEnabled) {
      fill(255);
      ellipse(deathBallX, deathBallY, 5, 5);
      fill(255, 0, 0, 100);
      noStroke();
      ellipse(deathBallX, deathBallY, 2*(float)avgRadius, 2*(float)avgRadius);
    }
    if (dist(Ball.getX(), Ball.getY(), deathBallX, deathBallY) < avgRadius+40) {//40 == radius of spaceship
      //System.out.println(i);
      deathBall.remove(i);

    }
  }

  if (rotatingR) {
    Ball.turn(5);
  }
  if (rotatingL) {
    Ball.turn(-5);
  }
  if (Ball.isForward()) {
    Ball.accelerate(-0.25/2);
  }
  if (Ball.isBackward()) {
    Ball.accelerate(0.25/2);
  }
  //your code here
  Ball.move();
  Ball.show();
}//-7 , 13
public void keyReleased() {
  if (key == 'd' || key == 'D') {
    rotatingR = false;
  }
  if (key == 'a' || key == 'A') {
    rotatingL = false;
  }
  if (key == 'w' || key == 'W') {
    Ball.setForward(false);
  }
  if (key == 's' || key == 'S') {
    Ball.setBackward(false);
  }
}
private boolean hitBoxEnabled = false;
public void keyPressed() {
  if (key == 'g') {
    if (hitBoxEnabled) {
      hitBoxEnabled = false;
    } else {
      hitBoxEnabled = true;
    }
  }
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
    //fill(Ball.getColor(), 100);
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
