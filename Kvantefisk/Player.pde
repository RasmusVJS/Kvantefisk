//The 4 different Player's who hold 4 Quantum Cards
class Player{
  //A username written by the player
  String name = "";
  //The Player's hand of Quantum Cards, each player starts at 4
  Quant quant1 = new Quant();
  Quant quant2 = new Quant();
  Quant quant3 = new Quant();
  Quant quant4 = new Quant();
  Quant quant5 = new Quant("Missing");
  Quant quant6 = new Quant("Missing");
  Quant quant7 = new Quant("Missing");
  Quant quant8 = new Quant("Missing");
  Quant quant9 = new Quant("Missing");
  Quant quant10 = new Quant("Missing");
  Quant quant11 = new Quant("Missing");
  Quant quant12 = new Quant("Missing");
  //Categories the Player has said "No" to
  String noneCategory1;
  String noneCategory2;
  String noneCategory3;
  
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
    if (numeral == 1)
      return quant1;
    if (numeral == 2)
      return quant2;
    if (numeral == 3)
      return quant3;
    if (numeral == 4)
      return quant4;
    if (numeral == 5)
      return quant5;
    if (numeral == 6)
      return quant6;
    if (numeral == 7)
      return quant7;
    if (numeral == 8)
      return quant8;
    if (numeral == 9)
      return quant9;
    if (numeral == 10)
      return quant10;
    if (numeral == 11)
      return quant11;
    if (numeral == 12)
      return quant12;
    else{
      println("Quantum Error");
      return quant12;
    }
  }
  
  //Method used to access which categories a Player has said "No" to
  String getNone(int numeral){
    if (numeral == 1)
      return noneCategory1;
    else if (numeral == 2)
      return noneCategory2;
    else if (numeral == 3)
      return noneCategory3;
    else{
      println("Quantum Error");
      return noneCategory3;
    }
  }
  
  //Method used to set a none category
  void setNone(int numeral, String category){
    if (numeral == 1)
      noneCategory1 = category;
    else if (numeral == 2)
      noneCategory2 = category;
    else if (numeral == 3)
      noneCategory3 = category;
    else
      println("Quantum Error");
  }
}
