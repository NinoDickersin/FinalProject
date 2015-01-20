import ddf.minim.*;
int counter; //counter for pixels
PImage startScreen; //used for start screen
boolean startOver = false; //checks if mouse is over start button
PImage backgroundImg; //used for background image
int imageCount = 8; //counts number of sprite images
PImage[] ferretSprite = new PImage[imageCount]; //sprites for ferret
int spriteCount = 0; //keeps track of what sprite is currently being used
int x; //Used for background
int y; //Used for background
AudioPlayer player; //mp3 player
Minim minim; //audio context
float XVelocity; //Velocity of X
float YVelocity; //Velocity of Y
float XPosition; //X position of ferret
float YPosition; //Y position of ferret
float gravity; //Acceleration towards ground
int controlY = 670;
int runX = 70;
int runY = 750; //run button position
int runSize = 90; //Size of run button
color runColor = color(255,255.255); //Color of run button
color runHighlight = color(100,100,100); //color when highlighted
boolean runOver = false; //if mouse is over run button
int angleSliderX = 170; //x position of angle slider
int angleSliderY = 710; //y position of angle slider
boolean angleSliderOver = false; //if mouse is over the angle slider
boolean angleSliderStopped = false; //checks if the angle has been found
int angleSliderIncrement = 0; //increment of the sliding box
int powerSliderX = angleSliderX; //x position of power slider
int powerSliderY = 800; //y position of power slider
boolean powerSliderOver = false; //if mouse is over power slider
boolean powerSliderStopped = false; //if power has been found
int powerSliderIncrement = angleSliderIncrement; //increment of the sliding box
int sliderAngleNeg = 1; //negation for moving slider box
int sliderPowerNeg = 1; //negation for other moving slider box
boolean run = false; //if ferret is in motion
int ferretRad = 80; //radius of ferret
int cannonWidth; //width of cannon
int cannonLength; //length of cannon
float cannonAngle = -45; //angle of launch
float cannonPower = 20; //power of cannon
boolean oneTime = true; // makes sure code only runs once
boolean pressedStart = false; //checks to see if the player has pressed the start button
boolean moveBackground = false; // Whether or not the background is moving
void setup(){
  size(displayWidth, displayHeight);
  backgroundImg = loadImage("background.jpg");
  backgroundImg.resize(displayWidth, displayHeight);
  startScreen = loadImage("startScreen.jpg");
  startScreen.resize(displayWidth, displayHeight);
  playMusic();
  background(startScreen);
}
void draw(){
  mouseUpdate(mouseX, mouseY);
  if (!pressedStart){
    rect (displayWidth / 2 - 200, displayHeight / 2 - 100, 400, 200);
  }else{
    background(backgroundImg);
    counter += XPosition;
    set(-frameCount, 0, backgroundImg);
    x = constrain(x, 0, backgroundImg.width - width);
    y = constrain(y, 0, backgroundImg.height - height);
    stroke(0,0,0);
    controlPanel();
  }
}
void controlPanel(){
  rect(0, controlY, displayWidth, displayHeight - controlY);
  angleSlider();
  powerSlider();
  if (runOver){
    fill(runHighlight); 
  }else{
    fill(runColor); 
  }
  ellipse(runX, runY, runSize, runSize);
  cannonSetup(100, 50, cannonAngle);
  ferretSetup();
  fill(0,0,0);
  if (run){
    update();
    endRun();
    rect(runX - 15, runY - 10, 10, 20);
    rect(runX  + 5, runY - 10, 10, 20);
  }else{
    triangle(runX - 10, runY + 10, runX - 10, runY - 10, runX + 15, runY);
  }
  noFill();
}

void playMusic(){
  minim = new Minim(this);
  player = minim.loadFile("cheetahmen.mp3", 2048);
  player.play();
}
void stopMusic(){
  player.close();
  minim.stop();
  super.stop(); 
}
void cannonSetup(int l, int w, float a){
 fill(0,0,0);
 rect (runX, controlY - (w + 20), l, w);
 //translate(runX, controlY - (w + 20));
 //rotate(radians(a));
 noFill();
}

void angleSlider(){
  fill(255,255,255);
  rect(angleSliderX, angleSliderY, 800, 40);
  fill(128,255,0);
  rect(angleSliderX + 100, angleSliderY, 600, 40);
  fill(255,255,0);
  rect(angleSliderX + 200, angleSliderY, 400, 40);
  fill(255,128,0);
  rect(angleSliderX + 300, angleSliderY, 200, 40);
  fill(255,0,0);
  rect(angleSliderX + 350, angleSliderY, 100, 40);
  fill(0,0,0);
  rect(angleSliderX + angleSliderIncrement, angleSliderY, 10, 40);
  if (angleSliderIncrement >= 790 || angleSliderIncrement < 0){
  sliderAngleNeg = sliderAngleNeg * -1;
  }
  if (!angleSliderStopped){
  angleSliderIncrement = angleSliderIncrement + (10 * sliderAngleNeg);
  }
}

void powerSlider(){
  fill(255,255,255);
  rect(powerSliderX, powerSliderY, 800, 40);
  fill(128,255,0);
  rect(powerSliderX + 100, powerSliderY, 600, 40);
  fill(255,255,0);
  rect(powerSliderX + 200, powerSliderY, 400, 40);
  fill(255,128,0);
  rect(powerSliderX + 300, powerSliderY, 200, 40);
  fill(255,0,0);
  rect(powerSliderX + 350, powerSliderY, 100, 40);
  fill(0,0,0);
  rect(powerSliderX + powerSliderIncrement, powerSliderY, 10, 40);
  if (powerSliderIncrement >= 790 || powerSliderIncrement < 0){
  sliderPowerNeg = sliderPowerNeg * -1;
  }
  if (!powerSliderStopped){
  powerSliderIncrement = powerSliderIncrement + (10 * sliderPowerNeg);
  }
}

void ferretSetup(){
  if(oneTime){
  XPosition = 0;
  YPosition = 480;
  gravity = 1;
  XVelocity = cannonPower * cos(radians(cannonAngle));
  YVelocity = -1 * cannonPower * sin(radians(cannonAngle));
  }
  oneTime = false;
  for(int i = 0; i < imageCount; i++){
    ferretSprite[i] = loadImage("ferret" + i + ".png");
  }
  if(spriteCount >= 7){
    spriteCount = 0;
  }else if (run){
    spriteCount ++;
  }
  image(ferretSprite[spriteCount], XPosition,YPosition,ferretRad,ferretRad);
}

void mouseUpdate(int x, int y){
   if(mouseOver(runX, runY, runSize)){//checks for run button
      runOver = true;
   } else{
      runOver = false; 
   }
   if(mouseX > angleSliderX && mouseX < angleSliderX + 800 && mouseY > angleSliderY && mouseY < angleSliderY + 40){//checks for angle slider
     angleSliderOver = true;
   }else{
     angleSliderOver = false; 
   }
   if(mouseX > powerSliderX && mouseX < powerSliderX + 800 && mouseY > powerSliderY && mouseY < powerSliderY + 40){//checks for power slider
     powerSliderOver = true;
   }else{
     powerSliderOver = false; 
   }
   if(mouseX > displayWidth / 2 - 200 && mouseX < displayWidth / 2 + 200 && mouseY > displayHeight / 2 - 100 && mouseY < displayHeight / 2 + 100){//checks if mouse is over start button
    startOver = true; 
   }else{
     startOver = false;
   }
}

boolean mouseOver(int x, int y, int diameter){
   float disX = x - mouseX;
    float disY = y - mouseY;
   if(sqrt(sq(disX) + sq(disY)) < diameter/2){
    return true;
   }else{
    return false;
   } 
}

void update(){
    YVelocity -= gravity;
    XPosition += XVelocity;
    YPosition -= YVelocity;
    bounce();
}

void mousePressed() {
   if(angleSliderOver && angleSliderStopped == false){
    angleSliderStopped = true;
   }
   if(powerSliderOver && powerSliderStopped == false){
      powerSliderStopped = true; 
   }
   if (runOver && run == false){
     run = true;
   }else if(runOver && run == true){
     run = false;
   }
   if (startOver && pressedStart == false){
     pressedStart = true;
   }
}

void bounce(){
   if (YPosition >= controlY - (ferretRad / 2)) {
    YVelocity = - 1 * 3 * YVelocity / 4;
    XVelocity -= 2;
  } 
}
void endRun(){
   if (XVelocity <= 0 && YPosition >= controlY - (ferretRad / 2)){
      XVelocity = 0;
      YVelocity = 0;
      run = false;
      //YPosition = controlY - (ferretRad / 2);
   }
}
