
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
  
  void bounce(){
   if (YPosition >= controlY - (ferretRad / 2)) {
    setYVel(- 1 * 3 * YVelocity / 4);
    setXVel(getXVel() - 2);
  }
  } 
  
  
Ferret(int xi, int yi, float XVel, float YVel){
  XPosition = xi;
  YPosition = yi;
  setXVel(XVel);
  setYVel(YVel);
  //XVelocity = cannonPower * cos(radians(cannonAngle));
  //YVelocity = -1 * cannonPower * sin(radians(cannonAngle));
  for(int i = 0; i < imageCount; i++){
    ferretSprite[i] = loadImage("ferret" + i + ".png");
  }
}
void drawFerret(){
  if(spriteCount >= 7){
    spriteCount = 0;
  }else if (run){
    spriteCount ++;
  }
  image(ferretSprite[spriteCount], XPosition,YPosition,ferretRad,ferretRad);
}
  
  void movement(){
  setYVel(getYVel - gravity);
  XPosition += getXVel();
  YPosition -= getYVel();
  bounce();
  endRun(); 
  }
  
  boolean endRun(){
   if (XVelocity <= 0 && YPosition >= controlY - (ferretRad / 2)){
      setXVel(0);
      setYVel(0);
      return false;
      }
  }
  void setXVel(int x){
    XVel = x;
  }
  void setYVel(int y){
    YVel = y;
  }
  int getXVel(){
    return XVel;
  }
  int getYVel(){
    return YVel;
  }
  void setXPos(int x){
    XPos = x;
  }
  void setYPos(int y){
    YPos = y;
  }
  int getXVel(){
    return XVel;
  }
  int getYVel(){
    return YVel;
  }
}
