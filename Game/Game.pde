import ddf.minim.*;
AudioPlayer player; //mp3 player
Minim minim; //audio context
int makeSureOnlyOnce; // used so coins compute once per draw
PImage backgroundImg; //used for background image
PImage startScreen; //used for start screen
int x; //Used for background
int y; //Used for background
int numberOfLoops = 0; //Used for background
boolean running = false; //if ferret is in motion
Button start;
Button run;
Button restart;
Slider angle;
Slider power;
Ferret a;
Cannon launcher;
Cannon jetpack;
Button cannonLevel;
Button jetpackLevel;
//Button mute;
boolean oneTime = true;
PImage jetpackSprite;

void setup(){
  size(displayWidth, displayHeight);
  backgroundImg = loadImage("background.jpg");
  backgroundImg.resize(displayWidth * 2, displayHeight);
  startScreen = loadImage("startScreen.jpg");
  startScreen.resize(displayWidth, displayHeight);
  background(startScreen);
  minim = new Minim(this);
  player = minim.loadFile("cheetahmen.mp3", 2048);
  player.play();
  start = new Button("Start", 200, 200, displayWidth / 2 - 100, displayHeight - 300);
  run = new Button("Run", 90, 90, 70, displayHeight - 250);
  //mute = new Button ("Mute", 90, 90, displayWidth - 400, displayHeight - 250);
  restart = new Button("Restart", 200, 200, displayWidth / 2, displayHeight / 2 - 300);
  angle = new Slider("Angle", 400, displayHeight - 200);
  power = new Slider("Power", 400, displayHeight - 270);
  a = new Ferret(20, displayHeight - 400, 0, 0);
  launcher = new Cannon(0, displayHeight - 500);
  jetpack = new Cannon();
  jetpackSprite = loadImage("jetpack0.png");
  cannonLevel = new Button("Cannon Upgrade", 100, 100, displayWidth / 2 - 450, 400);
  jetpackLevel = new Button("Jetpack Upgrade", 100, 100, displayWidth / 2 - 450, 250);
  makeSureOnlyOnce = 0;
}

void draw(){
  if(a.endRun()){
  restart.setPressed(true);
  }
  if (!start.getPressed()){
    start.mouseUpdate(mouseX, mouseY);
    image(startScreen, 0,0);
    start.drawButton();
  }else{
    run.mouseUpdate(mouseX, mouseY); 
    angle.mouseUpdate(mouseX, mouseY);
    power.mouseUpdate(mouseX, mouseY);
    restart.mouseUpdate(mouseX, mouseY);
    angle.increment();
    power.increment();
    x = constrain(x, 0, backgroundImg.width - width);
    if (x == backgroundImg.width - width){
      numberOfLoops += 1;
      x = 0;
    }
    set(-x, 0, backgroundImg);
    stroke(0,0,0);
    x = frameCount - ((backgroundImg.width - width) * numberOfLoops);
    fill(0, 153, 76);
    rect(0, displayHeight - 300, displayWidth, 300);
    noFill();
    run.drawButton();
    angle.drawSlider();
    power.drawSlider();
    //mute.drawButton();
    if(a.getXVel() == 0 && a.getYVel() == 0 && angle.getPressed() && power.getPressed() && running){
      a.setXVel(launcher.getPower() * cos(radians(launcher.getAngle())));
      a.setYVel(launcher.getPower() * sin(radians(launcher.getAngle())));  
    }
    jetpack.setPower(1);
    text("Press SPACE to activate jetpack", displayWidth / 2, displayHeight - 120);
    a.drawFerret(running);
    launcher.drawCannon();
    fill(0,0,0);
    if (running && angle.getPressed() && power.getPressed()){
       a.movement();
    }
    if(!a.endRun()){
       running = false; 
    }
     noFill();
  }
    if (!a.endRun()){
      fill(50,150,200);
      rect(displayWidth / 2 - 500, displayHeight / 2 - 500, 800, 600);
      a.setScore(int(a.getXPos()));
      fill(0,0,0);
      textSize(32);
      text("Your score for this flight is " + int(a.getScore()), displayWidth / 2 - 100, displayHeight / 2 - 400);
      if (makeSureOnlyOnce == 0){
      a.setCoins(a.getScore());
      makeSureOnlyOnce += 1;
      }
      text("You have " + a.getCoins() + " coins!", displayWidth / 2 - 100, displayHeight / 2 - 350);
      noFill();
      cannonLevel.drawButton();
      jetpackLevel.drawButton();
      restart.drawButton();
      restart.setPressed(false);
    }
}
  void stop(){
    player.close();
    minim.stop();
    super.stop();
  }
  
   void mousePressed(){
   //I hate minim and everything about it. setVolume() did not work. mute() did not work. pause() did not work.
   /*
     if (mute.getMouseOver() && !mute.getPressed()){
     player.pause();
     mute.setPressed(true);
   }else if(mute.getMouseOver() && mute.getPressed()){
     player.play();
     mute.setPressed(false);
   }
   */
   if(start.getMouseOver() && !start.getPressed()){
    start.setPressed(true);
   }
   if (run.getMouseOver() && !run.getPressed()){
     run.setPressed(true);
     running = true;
   }else if(run.getMouseOver() && run.getPressed()){
     run.setPressed(false);
     running = false;
   }
   if (restart.getMouseOver() && !restart.getPressed()){
     restart.setPressed(true);
    fill(0, 153, 76);
    rect(0, displayHeight - 300, displayWidth, 300);
    noFill();
     running = false;
     a.setXPos(20);
     a.setYPos(displayHeight - 400);
     angle.setPressed(false);
     power.setPressed(false);
     makeSureOnlyOnce = 0;
     run.setPressed(false);
     oneTime = true;
     launcher.setAngle(1);
     a.drawFerret(running);
     launcher.drawCannon();
     angle.drawSlider();
     power.drawSlider();
   }
   if(angle.getMouseOver() && !angle.getPressed()){
     angle.setPressed(true);
     if(angle.getPosition() < 100){
       launcher.setAngle(1);
     }else if(angle.getPosition() < 200){
        launcher.setAngle(20);      
     }else if(angle.getPosition() < 300){
         launcher.setAngle(30);     
     }else if(angle.getPosition() < 350){
        launcher.setAngle(40);      
     }else if(angle.getPosition() < 450){
       launcher.setAngle(50);       
     }else if(angle.getPosition() < 500){
       launcher.setAngle(60);       
     }else if(angle.getPosition() < 600){
       launcher.setAngle(70);       
     }else if(angle.getPosition() < 700){
       launcher.setAngle(80);       
     }else{
       launcher.setAngle(90);       
     }
     launcher.drawCannon();
     a.setXPos(100 + cos(radians(launcher.getAngle())) * 200);
     a.setYPos(displayHeight - 250 - 200 * (sin(radians(launcher.getAngle())))); //I never thought trig would have real world applications
     a.drawFerret(false);
   }
   if(power.getMouseOver() && !power.getPressed()){
     power.setPressed(true);
      if(power.getPosition() < 100){
       launcher.setPower(1);
     }else if(power.getPosition() < 200){
        launcher.setPower(2);      
     }else if(power.getPosition() < 300){
         launcher.setPower(3);     
     }else if(power.getPosition() < 350){
        launcher.setPower(4);      
     }else if(power.getPosition() < 450){
       launcher.setPower(5);       
     }else if(power.getPosition() < 500){
       launcher.setPower(4);       
     }else if(power.getPosition() < 600){
       launcher.setPower(3);       
     }else if(power.getPosition() < 700){
       launcher.setPower(2);       
     }else{
       launcher.setPower(1);       
     }
   }
   }
   
   void keyPressed(){
     if (key == ' ' && running && oneTime){
        a.setXVel(a.getXVel() + jetpack.getPower() * cos(radians(45)));
        a.setYVel(a.getYVel() + jetpack.getPower() * cos(radians(45))); 
        oneTime = false;
        image(jetpackSprite, a.getXPos() - 300, a.getYPos() - 100);
     }
   }

   

