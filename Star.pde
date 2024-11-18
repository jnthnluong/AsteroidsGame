class Star //note that this class does NOT extend Floater
{ // remember to update this on github!
  //your code here
  private double myX, myY;
  private color myColor;

  public Star() {
    myX = (Math.random()*width);
    myY = (Math.random()*height);
    myColor = color(255);
  }
  public void show() {
    fill(myColor);

    ellipse((float)myX, (float)myY, 5/2, 5/2);
  }
  public void move() { // very subtle star movement, also gives a "glistening" effect/flashing stars
    myX += (Math.random()*0.1-0.05);
    myY += (Math.random()*0.1-0.05);
  }
}
