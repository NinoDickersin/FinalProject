public class Slider{

   boolean mouseOver = false; //if mouse is over the slider
   boolean sliderStopped = false; //checks if the moving piece has stopped
   int slidingIncrement = 0; //increment of the sliding box
   int neg = 1; //negation for moving slider box
   String type; //type of slider
   int XPosition; //xpos of slider
   int YPosition; //ypos of slider
   boolean sliderOver; //if mouse is over slider
  
   Slider(String t, int xpos, int ypos){
      type = t;
      XPosition = xpos;
      YPosition = ypos;
      drawSlider();       
   }
  
    void drawSlider(){
      fill(255,255,255);
      rect(XPosition, YPosition, 800, 40);
      fill(128,255,0);
      rect(XPosition + 100, YPosition, 600, 40); 
      fill(255,255,0);
      rect(XPosition + 200, YPosition, 400, 40);
      fill(255,128,0);
      rect(XPosition + 300, YPosition, 200, 40);
      fill(255,0,0);
      rect(XPosition + 350, YPosition, 100, 40);
      fill(0,0,0);
      rect(XPosition + slidingIncrement, YPosition, 10, 40);
    }
    int getPosition (){
	return slidingIncrement; 
    }
    boolean getMouseOver(){
	return mouseOver;
    }
    boolean getSliderStopped(){
	return sliderStopped;
    }
    void increment(){
	if (!sliderStopped && (slidingIncrement >= 790 || slidingIncrement < 0)){
	    neg = neg * -1;
	}
	if (!sliderStopped){
	    slidingIncrement = slidingIncrement + (10 * neg);
	}
    }
    
   void mouseUpdate(int x, int y){
   if(mouseX > XPosition && mouseX < XPosition + 800 && mouseY > YPosition && mouseY < YPosition + 40){//checks for slider
     sliderOver = true;
   }else{
     sliderOver = false; 
   }
   }

void mousePressed() {
   if(sliderOver && sliderStopped == false){
    sliderStopped = true;
   }
}
}

