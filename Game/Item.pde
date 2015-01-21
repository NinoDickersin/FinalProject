public abstract class Item{
  int level = 0;

  boolean canBuy(int cost){
    if (a.getCoins() >= cost){
      return true;
    }else{
      return false;
    }
  }
  void buy(int cost){
    a.setCoins(a.getCoins() - cost);
  }
}
    
