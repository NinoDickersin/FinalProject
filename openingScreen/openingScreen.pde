import ddf.minim.*;
AudioPlayer player;
Minim minim;//audio context

boolean rectOver = false;
color currentColor, rectColor;
void setup(){
    rectColor = color(0);
    currentColor = color(-200);
     size(500,500);
     minim = new Minim(this);
  player = minim.loadFile("song.mp3", 2048);
  player.play();
}
void draw(){
     update(mouseX,mouseY);
     background(currentColor);
     if (rectOver){
       fill(color(51));
     }else{
       fill(rectColor);
     }
     stroke(255);
     rect(100, 100, 200, 200);
}
void update(int x, int y){
    if ( overRect(100, 100, 200, 200) ) {
    rectOver = true;
  } else {
    rectOver = false;
  }
}

void mousePressed() {
  if (rectOver) {
    currentColor += 10;
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}
