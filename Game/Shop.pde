public class Item{
  String itemType; //type of item
  int cannonLevel; //level of cannon
  int jetpackLevel; //level of jetpack
  int coins; //number of coins
  int antiGravityLevel; //level of anti-gravity device
  Button jetpackBox; //button to buy jetpack upgrades
  Button cannonBox;  //button to buy canon upgrades
 void setup(){
   jetpackBox = new Button("Jetpack Upgrade", 100, 100, 100, 100);
   cannonBox  = new Button("Cannon Upgrade", 100, 100, 300, 300);
  }
  /* 
  void draw(){
    itemBox = rect(xcor, ycor, 200, 800);
    levelButton = rect(xcor + 400, ycor,200,400);
  void Item(int itemName, int xcor, int ycor){
  if(itemName == 0){
   itemType = cannon;
  }else if(itemName == 1){
   itemType = jetpack;
  }else{
    itemType = antiGravity;
}
  itemBox = rect(xcor, ycor, 200, 800);
  levelButton = rect(xcor + 400, ycor,200,400);
}
*/
  
  boolean canBuy(int itemLevel){
    if (itemLevel <= 9){
      return true;
    }else{
      return false;
    }
  }
  
  void buy(int itemName){
    if(itemName == 0){
      cannonLevel += 1;
      Cannon.setPower(Cannon.getPower + 1);
    }else{
      jetpackLevel += 1;
      Jetpack.setDuration(Jetpack.getDuration + 1);
      Jetpack.setVelocityIncrease(Jetpack.getVelocityIncrease + 1);
    }
  }
  }
