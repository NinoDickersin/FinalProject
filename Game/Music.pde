import ddf.minim.*;
public class Music{
  AudioPlayer player; //mp3 player
  Minim minim; //audio context
  
  MusicPlayer(String filename){
    minim = new Minim(this);
    player = minim.loadFile(filename, 2048);
  }
  
  void play(){
    player.play();
  }
      
  void stop(){
    player.close();
    minim.stop();
    super.stop(); 
  }
}
