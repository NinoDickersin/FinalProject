
public class Item{
  String itemType; //type of item
  int cannonLevel; //level of cannon
  int jetpackLevel; //level of jetpack
  int coins; //number of coins
  int antiGravityLevel; //level of anti-gravity device
  PShape itemBox; //box 4 item
  PShape levelButton; //button that levels up the item
  
  void Item(int itemName, int xcor, int ycor){
  if(itemName = 0){
    itemType = cannon;
  }else if(itemName = 1){
    itemType = jetpack;
  }else{
    itemType = antiGravity;
}
  itemBox = rect(xcor, ycor, 200, 800);
  levelButton = rect(xcor + 400, ycor,200,400);
}
}
