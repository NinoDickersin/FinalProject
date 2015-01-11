int XVelocity; //Velocity of X
int YVelocity; //Velocity of Y
int XPosition; //X position of ferret
int YPosition; //Y position of ferret
int gravity; //Acceleration towards ground
int controlY = 670;
int startX = 70;
int startY = controlY + 80; //Start button position
int startSize = 90; //Size of start button
color startColor = color(255,255.255); //Color of start button
color startHighlight = color(100,100,100); //color when highlighted
boolean startOver = false; //if mouse is over start button
boolean run = false; //if ferret is in motion
int ferretRad = 40; //radius of ferret




void setup(){
   size(displayWidth, displayHeight);
   XVelocity = 25;
  YVelocity = -20;
  XPosition = 50;
  YPosition = 480;
  gravity = 1;
}
void draw(){
  background(255);
  fill(0,255,0);
  rect(0, controlY, displayWidth, displayHeight - controlY);
  noFill();
     mouseUpdate(mouseX, mouseY);
     if (startOver){
      fill(startHighlight); 
     }else{
      fill(startColor); 
     }
     ellipse(startX, startY, startSize, startSize);
     noFill();
     fill(0,0,255);
        ellipse(XPosition,YPosition,ferretRad,ferretRad);
     noFill();
     fill(0,255,0);
   if (run){
   update();
   endRun();
   rect(startX - 15, startY - 10, 10, 20);
   rect(startX  + 5, startY - 10, 10, 20);
   }else{
   triangle(startX - 10, startY + 10, startX - 10, startY - 10, startX + 15, startY);
   }
}

void mouseUpdate(int x, int y){
   if(mouseOver(startX, startY, startSize)){
      startOver = true;
   } else{
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
      bounce();
    YVelocity += gravity;
    XPosition += XVelocity;
    YPosition += YVelocity;

}

void mousePressed() {
   if (startOver & run == false){
     run = true;
   }else{
     run = false;
   }
}

void bounce(){
   if (YPosition >= controlY - ferretRad) {
    YVelocity = - 1 * 3 * YVelocity / 4;
    XVelocity -= 2;
  } 
}
void endRun(){
   if (XVelocity <= 0 && YPosition >= controlY - ferretRad){
      XVelocity = 0;
      YVelocity = 0;
      run = false; 
   }
}

