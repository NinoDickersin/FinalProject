public class Button{
  int XPosition; //xpos of button
  int YPosition; //ypos of button
  int h; //height
  int w; //width
  boolean buttonPressed = false; //if it has been pressed
  boolean buttonOver = false; //if the mouse is over the button
  String t; //text for button
  
    
    Button(String t, int h, int w, int xpos, int ypos){
        XPosition = xpos;
        YPosition = ypos;
        this.h = h;
        this.w = w;
        this.t = t;
	drawButton();
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
  PShape button = createShape(ELLIPSE, 0, 0, h, w);
  shape(button, XPosition, YPosition);
  textSize(20);
  textAlign(CENTER);
  text(t, XPosition, YPosition);
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
