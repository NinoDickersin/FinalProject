int a = 0;
boolean rectOver = false;
void setup(){
  size(1000, 1000);
}
void draw(){
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
      background(-100);
    }else{
        background(100);
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

      
        
