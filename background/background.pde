  PImage img;
  int x;
  int y;
void setup(){
  size(1000, 1080);
  img = loadImage("background.jpg");
  background(0);
}
void draw(){
  set(-frameCount, 0, img);
}
  
