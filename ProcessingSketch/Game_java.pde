
int XVelocity;
int YVelocity;
int XPosition;
int YPosition;
int gravity;

void setup(){
   size(960,960);
   XVelocity = 25;
  YVelocity = -20;
  XPosition = 0;
  YPosition = 480;
  gravity = 1;
}
void draw(){
  background(255);
  stroke(0);
  fill(175);
   ellipseMode(CENTER);
   ellipse(XPosition,YPosition,50,50);
   update();
}

void update(){
    YVelocity += gravity;
  
    XPosition += XVelocity;
    YPosition += YVelocity;
}

