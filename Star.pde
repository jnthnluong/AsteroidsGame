class Star //note that this class does NOT extend Floater
{
  //your code here
  double myX, myY;
  color myColor;

  Star() {
    myX = (Math.random()*width);
    myY = (Math.random()*height);
    myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
  }
  void show() {
    fill(myColor);
    ellipse((float)myX, (float)myY, 5, 5);
  }
  void move() {
    myX += (Math.random()*0.001-0.0005);
    myY += (Math.random()*0.001-0.0005);
  }
}
