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
    turnTaker.hand.add(new Quant(word));
    for (int i = chosenPlayer.hand.size() - 1; i >= 0; i--){
      if (chosenPlayer.getQuant(i).getCategory().equals(oldWord)){
        chosenPlayer.hand.remove(i);
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
    chosenPlayer.setNone(oldWord);
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
