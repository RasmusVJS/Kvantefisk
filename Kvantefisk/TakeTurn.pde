void takeTurn(Player turnTaker){
  //Ask the player which player they want to ask for a Quantum Card
  if (!askedWho){
    println(turnTaker.getName() + ", who would you like to ask?");
    askedWho = true;
  }
  //Ask the player which type of Quantum Card they want
  if (!askedWhat && stage == 2){
    println(turnTaker.getName() + ", what would you like to ask " + chosenPlayer.getName() + " for?");
    askedWhat = true;
  }
  if (!wordFinished){
    skrivemaskine();
  }
  //Once they've provided a name, that player is chosen
  else if (players[0].getName().equals(word) && stage == 1 && !turnTaker.getName().equals(word)){
    chosenPlayer = players[0];
    wordFinished = false;
    word = "";
    stage++;
  }
  else if (players[1].getName().equals(word) && stage == 1 && !turnTaker.getName().equals(word)){
    chosenPlayer = players[1];
    wordFinished = false;
    word = "";
    stage++;
  }
  else if (players[2].getName().equals(word) && stage == 1 && !turnTaker.getName().equals(word)){
    chosenPlayer = players[2];
    wordFinished = false;
    word = "";
    stage++;
  }
  else if (players[3].getName().equals(word) && stage == 1 && !turnTaker.getName().equals(word)){
    chosenPlayer = players[3];
    wordFinished = false;
    word = "";
    stage++;
  }
  else{
    println("There's no other player with that name, try again.");
    wordFinished = false;
    word = "";
  }
  //This body of code processes the word given by the turn taker
  if (wordFinished && stage == 2){
    //First we check if the word is tricking the program
    if (!askedChosenPlayer && (word.equals("") || word.equals("yes") || word.equals("Yes")|| word.equals("no") || word.equals("No"))){
      println("Nice try");
      word = "";
      wordFinished = false;
    }
    //If not, we check if the category already exists
    else if (word.equals(categories[0]) || word.equals(categories[1]) || word.equals(categories[2]) || word.equals(categories[3])){
      //If it does, we go on to check if the chosen player has one
      for (int i = 0; i < chosenPlayer.hand.size(); i++){
        if (chosenPlayer.getQuant(i).getCategory().equals(word)){
          //If they do, we go on to "give" that card to the asking Player
          playerHasCard = true;
          println(chosenPlayer.getName() + " does have one of those, here you go!");
          chosenPlayer.getQuant(i).setCategory("");
          for (int j = 0; j < turnTaker.hand.size(); j++){
            if (turnTaker.getQuant(j).getCategory().equals("")){
              turnTaker.getQuant(j).setCategory(word);
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
      if (!playerHasCard){
        for (int i = 0; i < chosenPlayer.none.size(); i++){
          if (chosenPlayer.getNone(i).equals(word)){
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
      if (!playerHasCard && !playerCantHaveCard){
        question(turnTaker, chosenPlayer);
      }
    }
    //If the category doesn't already exist, we check if all categories have already been initialized
    else if (categories[3].equals("")){
      for (int i = 0; i < 4; i++){
        if (categories[i].equals(""))
          categories[i] = word;
          break;
      }
      question(turnTaker, chosenPlayer);
    }
    else{
      println("There's no category with that name, try again.");
      word = "";
      wordFinished = false;
    }
    if (stage > 2){
      turnCounter++;
      stage = 1;
      askedWho = false;
      askedWhat = false;
      askedChosenPlayer = false;
      chosenPlayer = null;
      playerHasCard = false;
      playerCantHaveCard = false;
    }
  }
}
