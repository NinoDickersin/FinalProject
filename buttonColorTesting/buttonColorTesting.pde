import ddf.minim.*;
AudioPlayer player;
Minim minim;
int a = 0;
boolean rectOver = false;
void setup(){
  size(1920, 1080);
}
void draw(){
  PImage img;
img = loadImage("background.jpg");
background(img);
  update(mouseX,mouseY);
  if (rectOver){
       fill(color(51));
     }else{
       fill(color(0));
     }
     stroke(255);
  rectMode(CENTER);
  rect(500,500,100,100,7);
}
void update(int x, int y){
  if (overRect(450,450,100,100)){
    rectOver = true;
  }else{
    rectOver = false;
  }
}
void mousePressed(){
  if (rectOver){
    if(a % 2 == 0){
      startM();
    }else{
       stopM();
    }
    a = a + 1;
  }
}
boolean overRect(int x, int y, int width, int height){
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
void startM(){
  minim = new Minim(this);
  player = minim.loadFile("song.mp3", 2048);
  player.play(); 
}

void stopM(){
   player.close();
     minim.stop();
     super.stop();
}
        
