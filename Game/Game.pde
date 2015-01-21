import ddf.minim.*;
AudioPlayer player; //mp3 player
Minim minim; //audio context
int counter; //counter for pixels
PImage backgroundImg; //used for background image
PImage startScreen; //used for start screen
int x; //Used for background
int y; //Used for background
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
  run = new Button("Run", 90, 90, 70, displayHeight - 200, color(255,255,255));
  angle = new Slider("Angle", 400, displayHeight - 200);
  power = new Slider("Power", 400, displayHeight - 270);
  launcher = new Cannon(0, displayHeight - 500);
  a = new Ferret(20, displayHeight - 500, 0, 0);
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
    angle.increment();
    power.increment();
    background(backgroundImg);
    counter += a.getXPos();
    set(-frameCount, 0, backgroundImg);
    x = constrain(x, 0, backgroundImg.width - width);
    y = constrain(y, 0, backgroundImg.height - height);
    stroke(0,0,0);
    fill(0, 153, 76);
    rect(0, displayHeight - 300, displayWidth, 300);
    noFill();
    running = run.getPressed();
    run.drawButton();
    angle.drawSlider();
    power.drawSlider();
    launcher.drawCannon();
    if(a.getXVel() == 0 && a.getYVel() == 0 && angle.getPressed() && power.getPressed()){
      //a.setXVel(cannonPower * cos(radians(cannonAngle)));
     // a.setYVel (-1 * cannonPower * sin(radians(cannonAngle)));  
    }
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
   if (run.getMouseOver() && !run.getPressed()){
     run.setPressed(true);
   }else if(run.getMouseOver() && run.getPressed()){
     run.setPressed(false);
   }
   if(angle.getMouseOver() && !angle.getPressed()){
     angle.setPressed(true);
     if(angle.getPosition() < 100){
       
     }else if(angle.getPosition() < 200){
       
     }else if(angle.getPosition() < 300){
       
     }else if(angle.getPosition() < 350){
       
     }else if(angle.getPosition() < 100){
       
     }
   }
   if(power.getMouseOver() && !power.getPressed()){
     power.setPressed(true);
   }
   }

   

