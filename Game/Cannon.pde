public class Cannon{
  int imageCount = 9; //counts number of sprite images
  PImage[] cannonSprite = new PImage[imageCount]; //sprites for cannon
  int spriteCount = 0; //keeps track of what sprite is currently being used
  float cannonAngle; //angle of launch
  float cannonPower; //power of cannon
  int xpos; //xposition of cannon
  int ypos; //yposition of cannon

    Cannon(int XPosition, int YPosition){
        for(int i = 0; i < imageCount; i++){
          ferretSprite[i] = loadImage("cannon" + i + ".png");
        }
	cannonPower = 100;
	cannonAngle = 45;
    }
    void setAngle(int a){
	cannonAngle = a;
        spriteCount = (a / 10) - 1;
    }
    void setPower(int p){
	cannonPower = p;
    }
    int getAngle(int a){
	return cannonAngle;
    }
    int getPower(int p){
	return cannonPower;
    }
    
    void drawCannon(){
     image(cannonSprite[spriteCount], XPosition, YPosition); 
    }
}
