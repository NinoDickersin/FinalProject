public abstract class Item{
  String itemName; //type of item
  int level; //level of item

  Item(int itemType){
  if(itemType == 0){
   itemName = "cannon";
  }else if(itemType == 1){
   itemName = "antiGravity";
  }else{
   itemName = "jetpack";
  }
    level = 0;
  }
  
  boolean canBuy(){
    if (level <= 9){
      return true;
    }else{
      return false;
    }
  }
  
  abstract void buy();
}
