public class Slider extends Clickable{
   int slidingIncrement = 0; //increment of the sliding box
   int neg = 1; //negation for moving slider box
  
   Slider(String t, int xpos, int ypos){
      super(xpos, ypos, 40, 800, t);
      drawSlider();
   }
  
    void drawSlider(){
      textAlign(CENTER);
      text (t, XPosition + w / 2, YPosition - 10);
      fill(255,255,255);
      rect(XPosition, YPosition, w, h);
      fill(128,255,0);
      rect(XPosition + 100, YPosition, w - 200, h); 
      fill(255,255,0);
      rect(XPosition + 200, YPosition, w - 400, h);
      fill(255,128,0);
      rect(XPosition + 300, YPosition, w - 600, h);
      fill(255,0,0);
      rect(XPosition + 350, YPosition, w - 700, h);
      fill(0,0,0);
      rect(XPosition + slidingIncrement, YPosition, 10, h);
    }
    int getPosition (){
	return slidingIncrement; 
    }
    void increment(){
	if (!pressed && (slidingIncrement >= 790 || slidingIncrement < 0)){
	    neg = neg * -1;
	}
	if (!pressed){
	    slidingIncrement = slidingIncrement + (20 * neg);
	}
    }
}

