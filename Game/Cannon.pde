public class Cannon extends Item{
  int imageCount = 9; //counts number of sprite images
  PImage[] cannonSprite = new PImage[imageCount]; //sprites for cannon
  int spriteCount = 0; //keeps track of what sprite is currently being used
  float cannonAngle; //angle of launch
  float cannonPower; //power of cannon
  int xpos; //xposition of cannon
  int ypos; //yposition of cannon

    Cannon(int XPosition, int YPosition){
        this();
        for(int i = 0; i < imageCount; i++){
          cannonSprite[i] = loadImage("cannon" + i + ".png");
        }
        xpos = XPosition;
        ypos = YPosition;
    }
    
    Cannon(){
      level = 0;
      cannonPower = 1;
      cannonAngle = 45;
    }
    void setAngle(int a){
	cannonAngle = float(a);
        spriteCount = (a / 10) - 1;
        if(spriteCount < 0){
         spriteCount = 0; 
        }
    }
    void setPower(int p){
	cannonPower = float(p) * (level + 3) + 5;
    }
    float getAngle(){
	return cannonAngle;
    }
    float getPower(){
	return cannonPower;
    }
    
    void drawCannon(){
     image(cannonSprite[spriteCount], xpos, ypos); 
    }
    
    void buy(){
    if(canBuy(level * 1000)){
      level += 1;
      setPower(int(this.getPower() + 1));
    }
    }
    
}
