//The 4 different Player's who hold 4 Quantum Cards
class Player{
  //Each Player's 4 Quantum Cards
  Quant quant1 = new Quant();
  Quant quant2 = new Quant();
  Quant quant3 = new Quant();
  Quant quant4 = new Quant();
  
  //Method used to access a Player's 4 Quantum Cards, by using the card's number
  Quant getQuant(int numeral){
    if (numeral == 1)
      return quant1;
    if (numeral == 2)
      return quant2;
    if (numeral == 3)
      return quant3;
    if (numeral == 4)
      return quant4;
    else{
      println("Quantum Error");
      return quant1;}}
  
  /*Method used to give a Quantum Card a category
  Warning: Overlaps with setCategory
  
  void setQuant(Quant newQuant, int numeral){
    if (numeral == 1)
      quant1 = newQuant;
    if (numeral == 2)
      quant2 = newQuant;
    if (numeral == 3)
      quant3 = newQuant;
    if (numeral == 4)
      quant4 = newQuant;
    else
      println("Quantum Error");}
  */
}
