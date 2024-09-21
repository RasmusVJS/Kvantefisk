void question(Player turnTaker, Player chosenPlayer){
  if (!askedChosenPlayer){
    println(chosenPlayer.getName() + ", do you have any " + word + "?");
    askedChosenPlayer = true;
    oldWord = word;
    word = "";
    wordFinished = false;
  }
  if (!wordFinished){
    skrivemaskine();
  }
  //If they answer "Yes", the turn taker takes one of them
  else if (word.equals("yes") || word.equals("Yes")){
    println(chosenPlayer.getName() + " gives their " + oldWord + " to " + turnTaker.getName());
    for (int i = 1; i <= 12; i++){
      if (turnTaker.getQuant(i).getCategory().equals("Missing")){
        turnTaker.getQuant(i).setCategory(word);
        break;
      }
    }
    for (int i = 12; i >= 1; i--){
      if (chosenPlayer.getQuant(i).getCategory().equals(oldWord)){
        chosenPlayer.getQuant(i).setCategory("Missing");
        break;
      }
    }
    word = "";
    wordFinished = false;
    oldWord = "";
    stage++;
  }
  //If they say "No", they can't have any in the future
  else if (word.equals("no") || word.equals("No")){
    for (int i = 1; 1 <= 3; i++){
      if (!chosenPlayer.getNone(i).equals(oldWord)){
        chosenPlayer.setNone(i, oldWord);
        break;
      }
    }
    word = "";
    wordFinished = false;
    oldWord = "";
    stage++;
  }
  else{
    println("That is not an acceptable answer, try again.");
    word = "";
    wordFinished = false;
  }
}
