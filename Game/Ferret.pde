
public class Ferret{
int ferretRad = 80; //radius of ferret
float XVelocity; //Velocity of X
float YVelocity; //Velocity of Y
float XPosition; //X position of ferret
float YPosition; //Y position of ferret
float gravity = 1; //Acceleration towards ground
int imageCount = 8; //counts number of sprite images
PImage[] ferretSprite = new PImage[imageCount]; //sprites for ferret
int spriteCount = 0; //keeps track of what sprite is currently being used
  
Ferret(int xi, int yi, float XVel, float YVel){
  XPosition = xi;
  YPosition = yi;
  setXVel(XVel);
  setYVel(YVel);
  for(int i = 0; i < imageCount; i++){
  ferretSprite[i] = loadImage("ferret" + i + ".png");
  }
}
void drawFerret(boolean running){
  if(spriteCount >= 7){
    spriteCount = 0;
  }else if (running){
    spriteCount ++;
  }
  image(ferretSprite[spriteCount], XPosition,YPosition,ferretRad,ferretRad);
}
  
  void movement(){
  setYVel(getYVel() - gravity);
  XPosition += getXVel();
  YPosition -= getYVel();
  bounce();
  endRun(); 
  }
  
  void bounce(){
   if (YPosition >= displayHeight - 300 - (ferretRad / 2)) {
    setYVel(-3 * YVelocity / 4);
    setXVel(getXVel() * 2/3);
  }
  }
  
  boolean endRun(){
   if (XVelocity <= 0 && YPosition >= displayHeight - 300 - (ferretRad / 2)){
      setXVel(0);
      setYVel(0);
      return true;
      }
      return false;
  }
  void setXVel(float x){
    XVelocity = x;
  }
  void setYVel(float y){
    YVelocity = y;
  }
  float getXVel(){
    return XVelocity;
  }
  float getYVel(){
    return YVelocity;
  }
  void setXPos(float x){
    XPosition = x;
  }
  void setYPos(float y){
    YPosition = y;
  }
  float getXPos(){
    return XPosition;
  }
  float getYPos(){
    return YPosition;
  }
}
