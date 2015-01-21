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
Button start;
Button run;
Slider angle;
Slider power;
Ferret a;
Cannon launcher;
Button cannonLevel;
Button jetpackLevel;

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
  start = new Button("Start", 200, 200, displayWidth / 2 - 100, displayHeight - 300, color(255,255,255));
  run = new Button("Run", 90, 90, 70, 750, color(255,255,255));
  angle = new Slider("Angle", 400, 700);
  power = new Slider("Power", 400, 800);
  a = new Ferret(10, controlY - 60, 0, 0);
  launcher = new Cannon(0, controlY - 60);
  cannonLevel = new Button("Cannon Upgrade", 100, 100, 300, 300, color(255,255,255));
  jetpackLevel = new Button("Jetpack Upgrade", 100, 100, 100, 100, color(255,255,255));
}

void draw(){
  if (!start.getPressed()){
    start.mouseUpdate(mouseX, mouseY);
    image(startScreen, 0,0);
    start.drawButton();
  }else{
    run.mouseUpdate(mouseX, mouseY); 
    angle.mouseUpdate(mouseX, mouseY);
    power.mouseUpdate(mouseX, mouseY);
    background(backgroundImg);
    counter += a.getXPos();
    set(-frameCount, 0, backgroundImg);
    x = constrain(x, 0, backgroundImg.width - width);
    y = constrain(y, 0, backgroundImg.height - height);
    stroke(0,0,0);
    rect(0, controlY, displayWidth, displayHeight - controlY);
    running = run.getPressed();
    run.drawButton();
    angle.drawSlider();
    power.drawSlider();
    launcher.drawCannon();
    a.drawFerret(running);
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
  
   void mousePressed(){
   if(start.getMouseOver() && !start.getPressed()){
    start.setPressed(true);
   }
   }



