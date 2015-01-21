public abstract class Item{

  boolean canBuy(int cost){
    if (a.getCoins >= cost){
      return true;
    }else{
      return false;
    }
  }
  void buy(int cost){
    a.setCoins(a.getCoins - cost);
  }
}
    
