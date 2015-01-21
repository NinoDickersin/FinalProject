public class Button extends Clickable{
  int h; //height
  int w; //width
  color c; //color of button
  
    
    Button(String t, int h, int w, int xpos, int ypos){
        super(xpos, ypos, h, w, t);
        c = color(255,255,255);
        this.h = h;
        this.w = w;
	drawButton();
    }

void drawButton(){
  fill(c);
  rect(XPosition, YPosition, h, w);
  fill(0,0,0);
  textSize(20);
  textAlign(CENTER);
  text(t, XPosition + w / 2, YPosition + h / 2);
  noFill();
}
}
