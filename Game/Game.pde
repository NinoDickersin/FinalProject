
int XVelocity; //Velocity of X
int YVelocity; //Velocity of Y
int XPosition = 60; //X position of ferret
int YPosition = 500; //Y position of ferret
int gravity; //Acceleration towards ground
int startX = 70;
int startY = 750; //Start button position
int startSize = 90; //Size of start button
color startColor; //Color of start button
color startHighlight; //color when highlighted
boolean startOver = false; //if mouse is over start button
boolean run = false; //if ferret is in motion



void setup(){
   size(displayWidth, displayHeight);
   XVelocity = 25;
  YVelocity = -20;
  XPosition = 0;
  YPosition = 480;
  gravity = 1;
    startColor = color(255,255.255);
    startHighlight = color(100,100,100);
}
void draw(){
  background(255);
     mouseUpdate(mouseX, mouseY);
     if (startOver){
      fill(startHighlight); 
     }else{
      fill(startColor); 
     }
     ellipse(startX, startY, startSize, startSize);
     noFill();
        ellipse(XPosition,YPosition,50,50);
   if (run){
   update();
   }
}

void mouseUpdate(int x, int y){
   if(overStart(startX, startY, startSize)){
      startOver = true;
   } else{
      startOver = false; 
   }
}

boolean overStart(int x, int y, int diameter){
   float disX = x - mouseX;
    float disY = y - mouseY;
   if(sqrt(sq(disX) + sq(disY)) < diameter/2){
    return true;
   }else{
    return false;
   } 
}

void update(){
    YVelocity += gravity;
  
    XPosition += XVelocity;
    YPosition += YVelocity;
}

void mousePressed() {
   if (startOver){
     run = true;
   }else{
     run = false;
   }
}
