int counter; //counter for pixels
PImage backgroundImg; //used for background image
PImage startScreen; //used for start screen
int x; //Used for background
int y; //Used for background
int controlY = 670; //ycoor for the control panel
color runColor = color(255,255.255); //Color of run button
color runHighlight = color(100,100,100); //color when highlighted
boolean run = false; //if ferret is in motion

void setup(){
  size(displayWidth, displayHeight);
  backgroundImg = loadImage("background.jpg");
  backgroundImg.resize(displayWidth, displayHeight);
  startScreen = loadImage("startScreen.jpg");
  startScreen.resize(displayWidth, displayHeight);
  background(startScreen);
  Button start = new Button("Start", 100, 400, displayWidth / 2, displayHeight - 200);
  Button run = new Button("Run", 90, 90, 70, 750);
  Slider angle = new Slider("Angle", 400, 700);
  Slider power = new Slider("Power", 400, 800);
  Ferret a = new Ferret(10, controlY - 60, 0, 0);
  Cannon launcher = new Cannon(0, controlY - 60);
}

void draw(){
  mouseUpdateAll(mouseX, mouseY);
  if (!(start.getButtonPressed())){
    image(startScreen, 0,0);
    start.drawButton();
  }else{
    background(backgroundImg);
    counter += a.getXPosition();
    set(-frameCount, 0, backgroundImg);
    x = constrain(x, 0, backgroundImg.width - width);
    y = constrain(y, 0, backgroundImg.height - height);
    stroke(0,0,0);
    rect(0, controlY, displayWidth, displayHeight - controlY);
    run.drawButton();
    angle.drawSlider();
    power.drawSlider();
    launcher.drawCannon();
    if (run.mouseOver){
      fill(runHighlight); 
    }else{
      fill(runColor); 
    }
    fill(0,0,0);
    if (run.getButtonPressed()){
       a.movement();
       //set color of button to signify playing
    }else{
       //set color of button to signify paused
    }
     noFill();
  }
}

void mouseUpdateAll(int x, int y){
 start.mouseUpdate(x, y);
 run.mouseUpdate(x,y); 
 angle.mouseUpdate(x,y);
 power.mouseUpdate(x,y);
}



