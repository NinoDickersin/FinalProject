public class Button{
  int XPosition; //xpos of button
  int YPosition; //ypos of button
  int h; //height
  int w; //width
  boolean buttonPressed = false; //if it has been pressed
  boolean buttonOver = false; //if the mouse is over the button
  
    
    Button(String t, int h, int w, int xpos, int ypos){
        XPosition = xpos;
        YPosition = ypos;
        this.h = h;
        this.w = w;
	drawButton();
    }


boolean mouseOver(int x, int y, int d){
   float disX = x - mouseX;
    float disY = y - mouseY;
   if(sqrt(sq(disX) + sq(disY)) < d/2){
    return true;
   }else{
    return false;
   } 
}

void drawButton(){
  PShape button = createShape(CIRCLE, 0, 0, h, w);
  shape(s, XPosition, YPosition);
  textsize(20);
  textAlign(CENTER);
  text(t, XPosition, YPosition);
}

void mousePressed() {
   if(mouseOver(XPosition, YPosition, diameter) && buttonPressed = false){
    buttonPressed = true;
   }else if (mouseOver(XPosition, YPosition, diameter && buttonPressed = true)){
    buttonPressed = false; 
   }
}
   
   boolean getButtonPressed(){
    return buttonPressed; 
   }
}
