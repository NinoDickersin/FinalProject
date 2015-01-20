import ddf.minim.*;
AudioPlayer player; //mp3 player
Minim minim; //audio context
int counter; //counter for pixels
PImage backgroundImg; //used for background image
PImage startScreen; //used for start screen
int x; //Used for background
int y; //Used for background
int controlY = 670; //ycoor for the control panel
//color runColor = color(255,255.255); //Color of run button
//color runHighlight = color(100,100,100); //color when highlighted
boolean running = false; //if ferret is in motion
  Button start = new Button("Start", 100, 100, displayWidth / 2, displayHeight - 200, color(255,255,255));
  Button run = new Button("Run", 90, 90, 70, 750, color(255,255,255));
  Slider angle = new Slider("Angle", 400, 700);
  Slider power = new Slider("Power", 400, 800);
  Ferret a = new Ferret(10, controlY - 60, 0, 0);
  Cannon launcher = new Cannon(0, controlY - 60);

void setup(){
  size(displayWidth, displayHeight);
  backgroundImg = loadImage("background.jpg");
  backgroundImg.resize(displayWidth, displayHeight);
  startScreen = loadImage("startScreen.jpg");
  startScreen.resize(displayWidth, displayHeight);
  background(startScreen);
  minim = new Minim(this);
  player = minim.loadFile("cheetahmen.mp3", 2048);
  player.play();
}

void draw(){
  start.mouseUpdate(mouseX, mouseY);
  run.mouseUpdate(mouseX, mouseY); 
  angle.mouseUpdate(mouseX, mouseY);
  power.mouseUpdate(mouseX, mouseY);
  if (!(start.getButtonPressed())){
    image(startScreen, 0,0);
    start.drawButton();
  }else{
    background(backgroundImg);
    counter += a.getXPos();
    set(-frameCount, 0, backgroundImg);
    x = constrain(x, 0, backgroundImg.width - width);
    y = constrain(y, 0, backgroundImg.height - height);
    stroke(0,0,0);
    rect(0, controlY, displayWidth, displayHeight - controlY);
    running = run.getButtonPressed();
    run.drawButton();
    angle.drawSlider();
    power.drawSlider();
    launcher.drawCannon();
    a.drawFerret(running);
    //if (run.mouseOver(mouseX, mouseY, )){
     // fill(runHighlight); 
    //}else{
    //  fill(runColor); 
   // }
    fill(0,0,0);
    if (running){
       a.movement();
       //set color of button to signify playing
    }else{
       //set color of button to signify paused
    }
     noFill();
  }
  
}

  void stop(){
    player.close();
    minim.stop();
    super.stop();
  }



