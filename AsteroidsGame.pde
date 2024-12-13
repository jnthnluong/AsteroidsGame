
//your variable declarations here
Star [] backgroundStars = new Star [400];
Spaceship Ball;
ArrayList<Asteroid> deathBall = new ArrayList<Asteroid>();
public boolean rotatingR = false;
public boolean rotatingL = false;
ArrayList<Bullet> PewPew = new ArrayList<Bullet>();
public double health = 100;
public double shootingCooldown = 0.5; //x/60 second cooldown to shoot
public boolean isAlive = true;
Asteroid deadShip;
public boolean setLost = false;
public void setup() 
{
  size(800, 800);
  background(0);
  rect(50, 50, 150, 50);
  //Loop();
  //your code here

  Ball = new Spaceship();
  Ball.setXspeed(0);
  Ball.setYspeed(0);
  deadShip = new Asteroid(Ball);


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
  shootingCooldown = 0.5;
}


public void draw() 
{
  if (health<=0)isAlive = false;
  strokeWeight(1);
  if ((int)(Math.random()*100) == 1 && isAlive) {
    deathBall.add(new Asteroid());
  }

  background(0);
  //deadShip.show();
  if (!isAlive) {
    for (int i = deathBall.size()-1; i >= 0; i--) {
      deathBall.remove(i);
    }


    if (setLost == false) {
      deadShip.setXspeed(Ball.getXspeed()/2);
      deadShip.setYspeed(Ball.getYspeed()/2);
      deadShip.setX(Ball.getX());
      deadShip.setY(Ball.getY());
      setLost = true;
    }
    deadShip.setColor(color(175, 168, 168));
    fill(175, 168, 168);
    deadShip.show();
    //System.out.println("dead");
  }
  for (int i = 0; i < backgroundStars.length; i++) {
    backgroundStars[i].move();
    backgroundStars[i].show();
  }
  if (isShooting && shootingCooldown <= 0 && isAlive) {
    PewPew.add(new Bullet(Ball));
    shootingCooldown = 0.5;
  } else {
    shootingCooldown--;
  }
  for (int i = PewPew.size()-1; i >=0; i--) {
    PewPew.get(i).move();
    PewPew.get(i).show();
    if (PewPew.get(i).getTimer() > 240) {
      PewPew.remove(i);
    }
    fill(255, 0, 0, 100);
    //ellipse(PewPew.get(i).getX(), PewPew.get(i).getY(), 2.5, 2.5);
  }
  if (hitBoxEnabled) { 
    fill(255, 0, 0, 100);
    noStroke();
    ellipse(Ball.getX(), Ball.getY(), 80, 80);
  }
  for (int i = deathBall.size()-1; i >=0; i--) {
    deathBall.get(i).move();
    stroke(255);
    strokeWeight(2);
    deathBall.get(i).show();
    int deathBallX = deathBall.get(i).getX();
    int deathBallY = deathBall.get(i).getY();

    //provides the average distance from "center"/location of asteroid to each corner
    double avgRadius = deathBall.get(i).getRadius();
    //System.out.println(avgRadius);
    //System.out.println(avgRadius);
    if (hitBoxEnabled) {
      fill(255);
      ellipse(deathBallX, deathBallY, 5, 5);
      fill(255, 0, 0, 100);
      noStroke();
      ellipse(deathBallX, deathBallY, 2*(float)avgRadius, 2*(float)avgRadius);
    }
    if (isAlive) {
      if (dist(Ball.getX(), Ball.getY(), deathBallX, deathBallY) < avgRadius+40) {//40 == radius of spaceship
        //System.out.println(i);
        health-=5;
        if (health<=0) {
          Ball.setXspeed(Ball.getXspeed()/2);
          Ball.setYspeed(Ball.getYspeed()/2);
        }
        deathBall.remove(i);
      }
    }

    for (int g = PewPew.size()-1; g >= 0; g--) {
      if (dist(PewPew.get(g).getX(), PewPew.get(g).getY(), deathBallX, deathBallY) < avgRadius+15) { //+10 so that bullets can easily hit asteroids
        //System.out.println(dist(PewPew.get(g).getX(), PewPew.get(g).getY(), deathBallX, deathBallY));
        //System.out.println("shot"+g);
        // for some reason an error(index out of bounds) occurs w/o the break at the end?

        deathBall.remove(i);
        PewPew.remove(g);
        break; //
      }
    }
  } // end of asteroid collision check

  if (rotatingR) {
    Ball.turn(5);
  }
  if (rotatingL) {
    Ball.turn(-5);
  }
  if (Ball.isForward() && isAlive) {
    Ball.accelerate(-0.25/2);
  }
  if (Ball.isBackward() && isAlive  ) {
    Ball.accelerate(0.25/2);
  }
  //your code here
  Ball.move();

  if (isAlive) {
    Ball.show();
  }
  if (health <= 0) health = 0;
  noStroke();
  fill(0, 255, 0);
  rect(50, 50, (float)(3*health), 25);
}//-7 , 13
boolean isShooting = false;
public void keyReleased() {
  if (key == 'n' || key == 'N') {
    isShooting = false;
  }

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
  if (key == 'n' || key == 'N') {
    isShooting = true;
  }  
  if (key == 'j') {
    for (int i = 0; i < 150; i++) {
      deathBall.add(new Asteroid());
    }
  }
  if (key == 'g') {
    if (hitBoxEnabled) {
      hitBoxEnabled = false;
    } else {
      hitBoxEnabled = true;
    }
  }
  //System.out.println(key);
  if (key == 'w' || key == 'W' && isAlive) {
    //Ball.accelerate(-2.5);
    Ball.setForward(true);
  }
  if (key == 'd' || key == 'D'&& isAlive) {
    //Ball.turn(5);
    rotatingR = true;
  }
  if (key == 'a' || key == 'A' && isAlive) {
    //Ball.turn(-5);
    rotatingL = true;
  }
  if (key == 's' || key == 'S' && isAlive) {
    Ball.setBackward(true);
  }  
  if (keyCode == 32 && isAlive) { //spacebar
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
