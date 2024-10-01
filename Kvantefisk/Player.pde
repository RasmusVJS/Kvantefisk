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
  
  //Method used to access which categories a Player has said "No" to
  String getNone(int numeral){
    return none.get(numeral);
  }
  
  //Method used to set a none category
  void setNone(String category){
    none.add(category);
  }
}
