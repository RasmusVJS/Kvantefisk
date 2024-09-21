//The actual game elements that posses 1 of 4 categories
class Quant{
  //The specific Quantum Card's category, all start at "None"
  String category = "None";
  
  Quant(){
  }
  
  Quant(String category){
    this.category = category;
  }
  
  //Method used to access a Quantum Card's category
  String getCategory(){
    return category;
  }
  
  //Method used to give a Quantum Card its category
  void setCategory(String newCategory){
    category = newCategory;
  }
}
