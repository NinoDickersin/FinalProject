public abstract class Clickable{
   int XPosition; //xpos of clickable
   int YPosition; //ypos of clickable
   boolean mouseOver = false; //if mouse is over clickable
   String t; //text for clickable
   boolean pressed = false; //if clickable has been pressed
   int h; //height of clickable
   int w; //width of clickable
   
   Clickable(int x, int y, int h, int w, String t){
     XPosition = x;
     YPosition = y;
     this.t = t;
     this.h = h;
     this.w = w;
   }
   
   void mouseUpdate(float x, float y){
   if(x > XPosition && x < XPosition + w && y > YPosition && y < YPosition + h){//checks if mouse is over clickable
     mouseOver = true;
   }else{
     mouseOver = false; 
   }
   }
   
   boolean getMouseOver(){
     return mouseOver;
   }
   
   boolean getPressed(){
     return pressed;
   }
   
   void setPressed(boolean a){
    pressed = a;  
   }
}
