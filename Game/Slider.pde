public class Slider extends Clickable{
   int slidingIncrement = 0; //increment of the sliding box
   int neg = 1; //negation for moving slider box
  
   Slider(String t, int xpos, int ypos){
      super(xpos, ypos, 800, 40, t);
      drawSlider();
   }
  
    void drawSlider(){
      fill(255,255,255);
      rect(XPosition, YPosition, h, w);
      fill(128,255,0);
      rect(XPosition + 100, YPosition, h - 200, w); 
      fill(255,255,0);
      rect(XPosition + 200, YPosition, h - 400, w);
      fill(255,128,0);
      rect(XPosition + 300, YPosition, h - 600, w);
      fill(255,0,0);
      rect(XPosition + 350, YPosition, h - 700, w);
      fill(0,0,0);
      rect(XPosition + slidingIncrement, YPosition, 10, w);
    }
    int getPosition (){
	return slidingIncrement; 
    }
    void increment(){
	if (!pressed && (slidingIncrement >= 790 || slidingIncrement < 0)){
	    neg = neg * -1;
	}
	if (!pressed){
	    slidingIncrement = slidingIncrement + (10 * neg);
	}
    }
}

