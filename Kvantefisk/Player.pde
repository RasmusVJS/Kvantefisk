//The 4 different Player's who hold 4 Quantum Cards
class Player{
  //A username written by the player
  String name = "";
  //The Player's hand of Quantum Cards, each player starts at 4
  ArrayList<Quant> hand = new ArrayList<Quant>();
  //Categories the Player has said "No" to
  ArrayList<String> none = new ArrayList<String>();
  
  Player(){
    hand.add(new Quant());
    hand.add(new Quant());
    hand.add(new Quant());
    hand.add(new Quant());
  }
  
  //Method used to access the Player's Username
  String getName(){
    return name;
  }
  
  //Method used to access a Player's 4 Quantum Cards, by using the card's number
  void provideName(String newName){
    name = newName;
  }
  
  //Method used to access one of a Player's Quantum Cards
  Quant getQuant(int numeral){
    return hand.get(numeral);
  }
  
  //Method used to check how many cards a player has
  int getHandSize(){
    return hand.size();
  }
  
  //Method used to give a player a card
  void giveQuant(String newCategory){
    hand.add(new Quant(newCategory));
  }
  
  //Method used to take a given card from a player
  void takeQuant(int numeral){
    hand.remove(numeral);
  }
  
  //Method used to access which categories a Player has said "No" to
  String getNone(int numeral){
    return none.get(numeral);
  }
  
  //Method used to check how many categories a player doesn't have
  int getNoneSize(){
    return none.size();
  }
  
  //Method used to set a none category
  void setNone(String category){
    none.add(category);
  }
}
