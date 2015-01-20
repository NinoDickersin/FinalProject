public class Item{
  String itemType; //type of item
  int cannonLevel; //level of cannon
  int jetpackLevel; //level of jetpack
  int coins; //number of coins
  int antiGravityLevel; //level of anti-gravity device
  Button jetpackBox; //button to buy jetpack upgrades
  Button cannonBox;  //button to buy canon upgrades
 void setup(){
   jetpackBox = new Button("Jetpack Upgrade", 100, 100, 100, 100, color(255,255,255));
   cannonBox  = new Button("Cannon Upgrade", 100, 100, 300, 300, color(255,255,255));
  }
  
  void drawShop(){
    PShape itemBox = rect(xcor, ycor, 200, 800);
    levelButton = rect(xcor + 400, ycor,200,400);
  }
  Item(int itemName, int xcor, int ycor){
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
  
  boolean canBuy(int itemLevel){
    if (itemLevel <= 9){
      return true;
    }else{
      return false;
    }
  }
  
  void buy(Cannon c, Cannon j, int itemName){
    if(itemName == 0){
      cannonLevel += 1;
      c.setPower(int(c.getPower() + 1));
    }else{
      jetpackLevel += 1;
      j.setPower(int(j.getPower() + 1));
    }
  }
  }
