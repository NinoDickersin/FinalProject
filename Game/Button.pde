public class Button{
  int XPosition; //xpos of button
  int YPosition; //ypos of button
  int h; //height
  int w; //width
  boolean buttonPressed = false; //if it has been pressed
  boolean buttonOver; //if the mouse is over the button
  String t; //text for button
  color c; //color of button
  
    
    Button(String t, int h, int w, int xpos, int ypos, color c){
        XPosition = xpos;
        YPosition = ypos;
        this.h = h;
        this.w = w;
        this.t = t;
	drawButton();
        this.c = c;
    }


void mouseUpdate(int x, int y){
   float disX = x - mouseX;
   float disY = y - mouseY;
   if(sqrt(sq(disX) + sq(disY)) < w/2){ //h and w are the same so this should be ok
    buttonOver = true;
   }else{
    buttonOver = false;
   } 
}

void drawButton(){
  fill(c);
  ellipse(XPosition, YPosition, h, w);
  textSize(20);
  textAlign(CENTER);
  text(t, XPosition, YPosition);
  noFill();
}

void mousePressed() {
   if(buttonOver && buttonPressed == false){
    buttonPressed = true;
   }else if (buttonOver && buttonPressed == true){
    buttonPressed = false; 
   }
}
   
   boolean getButtonPressed(){
    return buttonPressed; 
   }
}
