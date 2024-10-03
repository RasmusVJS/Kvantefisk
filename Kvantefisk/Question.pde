void question(Player turnTaker, Player chosenPlayer) {
  questioning = true;
  if (!askedChosenPlayer) {
    println(chosenPlayer.getName() + ", do you have any " + word + "?");
    askedChosenPlayer = true;
    oldWord = word;
    word = "";
    wordFinished = false;
  }
  if (!wordFinished || usingSkrivemaskine) {
    skrivemaskine();
  }
  //If they answer "Yes", the turn taker takes one of them
  else if (word.equals("yes") || word.equals("Yes")) {
    for (Quant i : chosenPlayer.hand) {
      if (i.getCategory().equals(oldWord)) {
        hasCategory = true;
        break;
      }
    }
    if (!hasCategory) {
      for (Quant i : chosenPlayer.hand) {
        if (i.getCategory().equals("TBD")) {
          i.setCategory(oldWord);
          break;
        }
      }
    }
    println(chosenPlayer.getName() + " gives their " + oldWord + " to " + turnTaker.getName());
    turnTaker.giveQuant(oldWord);
    for (int i = chosenPlayer.getHandSize() - 1; i >= 0; i--) {
      if (chosenPlayer.getQuant(i).getCategory().equals(oldWord)) {
        chosenPlayer.takeQuant(i);
        break;
      }
    }
    word = "";
    wordFinished = false;
    oldWord = "";
    questioning = false;
  }
  //If they say "No", they can't have any in the future
  else if (word.equals("no") || word.equals("No")) {
    chosenPlayer.setNone(oldWord);
    word = "";
    wordFinished = false;
    oldWord = "";
    questioning = false;
  } else {
    println("That is not an acceptable answer, try again.");
    word = "";
    wordFinished = false;
  }
  if (!questioning) {
      stage++;
    }
}
