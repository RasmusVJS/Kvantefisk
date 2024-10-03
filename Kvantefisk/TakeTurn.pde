void takeTurn(Player turnTaker) {
  //Ask the player which player they want to ask for a Quantum Card
  if (!askedWho) {
    for (Player i : players) {
      ArrayList<String> currentHand = new ArrayList<String>();
      for (Quant card : i.hand){
        currentHand.add(card.getCategory());
      }
      println(i.getName() + ": " + currentHand + ", " + i.none);
    }
    println(turnTaker.getName() + ", who would you like to ask?");
    askedWho = true;
  }
  //Ask the player which type of Quantum Card they want
  if (!askedWhat && stage == 2) {
    println(turnTaker.getName() + ", what would you like to ask " + chosenPlayer.getName() + " for?");
    askedWhat = true;
  }
  if (!wordFinished || usingSkrivemaskine) {
    skrivemaskine();
  }
  //Once they've provided a name, that player is chosen
  else if (players[0].getName().equals(word) && stage == 1 && !turnTaker.getName().equals(word)) {
    chosenPlayer = players[0];
    wordFinished = false;
    word = "";
    stage++;
  } else if (players[1].getName().equals(word) && stage == 1 && !turnTaker.getName().equals(word)) {
    chosenPlayer = players[1];
    wordFinished = false;
    word = "";
    stage++;
  } else if (players[2].getName().equals(word) && stage == 1 && !turnTaker.getName().equals(word)) {
    chosenPlayer = players[2];
    wordFinished = false;
    word = "";
    stage++;
  } else if (players[3].getName().equals(word) && stage == 1 && !turnTaker.getName().equals(word)) {
    chosenPlayer = players[3];
    wordFinished = false;
    word = "";
    stage++;
  } else {
    println("There's no other player with that name, try again.");
    wordFinished = false;
    word = "";
  }
  //This body of code processes the word given by the turn taker
  if (wordFinished && stage == 2) {
    if (questioning)
      question(turnTaker, chosenPlayer);
    //First we check if the word is tricking the program
    else if (!askedChosenPlayer && (word.equals("TBD") || word.equals("yes") || word.equals("Yes")|| word.equals("no") || word.equals("No"))) {
      println("Nice try");
      word = "";
      wordFinished = false;
    }
    //If not, we check if the category already exists
    else if (word.equals(categories[0]) || word.equals(categories[1]) || word.equals(categories[2]) || word.equals(categories[3])) {
      //If it does, we go on to check if the chosen player has one
      for (Quant i : turnTaker.hand) {
        if (i.getCategory().equals(word)) {
          hasCategory = true;
          break;
        }
      }
      if (!hasCategory) {
        int index = 0;
        for (Quant i : turnTaker.hand) {
          if (i.getCategory().equals("TBD")) {
            turnTaker.getQuant(index).setCategory(word);
            break;
          }
          index++;
        }
      }
      for (int i = 0; i < chosenPlayer.getHandSize(); i++) {
        if (chosenPlayer.getQuant(i).getCategory().equals(word)) {
          //If they do, we go on to "give" that card to the asking Player
          playerHasCard = true;
          println(chosenPlayer.getName() + " does have one of those, here you go!");
          turnTaker.giveQuant(word);
          for (int j = chosenPlayer.getHandSize() - 1; j >= 0; j--) {
            if (chosenPlayer.getQuant(j).getCategory().equals(word)) {
              chosenPlayer.takeQuant(j);
              break;
            }
          }
          word = "";
          wordFinished = false;
          stage++;
          break;
        }
      }
      //If they don't, we need to ensure whether or not they even can have it
      if (!playerHasCard) {
        for (int i = 0; i < chosenPlayer.getNoneSize(); i++) {
          if (chosenPlayer.getNone(i).equals(word)) {
            playerCantHaveCard = true;
            println(chosenPlayer.getName() + " doesn't have any " + word + ". Bad luck.");
            word = "";
            wordFinished = false;
            stage++;
            break;
          }
        }
      }
      //If the category exists, and they may have it, we ask them
      if (!playerHasCard && !playerCantHaveCard) {
        question(turnTaker, chosenPlayer);
      }
    }
    //If the category doesn't already exist, we check if all categories have already been initialized
    else if (categories[3].equals("")) {
      int index = 0;
      for (String i : categories) {
        if (i.equals("")) {
          categories[index] = word;
          break;
        }
        index++;
      }
      for (Quant i : turnTaker.hand) {
        if (i.getCategory().equals(word)) {
          hasCategory = true;
          break;
        }
      }
      if (!hasCategory) {
        index = 0;
        for (Quant i : turnTaker.hand) {
          if (i.getCategory().equals("TBD")) {
            turnTaker.getQuant(index).setCategory(word);
            break;
          }
          index++;
        }
      }
      question(turnTaker, chosenPlayer);
    } else {
      println("There's no category with that name, try again.");
      word = "";
      wordFinished = false;
    }
  }
  //Variables are reset, so the next Player's turn can happen
  if (stage > 2) {
    turnCounter++;
    stage = 1;
    askedWho = false;
    askedWhat = false;
    askedChosenPlayer = false;
    chosenPlayer = null;
    playerHasCard = false;
    playerCantHaveCard = false;
    hasCategory = false;
    gameOver();
  }
}
