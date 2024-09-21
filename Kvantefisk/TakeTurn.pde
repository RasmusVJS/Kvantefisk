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
  else if (player1.getName().equals(word) && stage == 1 && !turnTaker.getName().equals(word)){
    chosenPlayer = player1;
    wordFinished = false;
    word = "";
    stage++;
  }
  else if (player2.getName().equals(word) && stage == 1 && !turnTaker.getName().equals(word)){
    chosenPlayer = player2;
    wordFinished = false;
    word = "";
    stage++;
  }
  else if (player3.getName().equals(word) && stage == 1 && !turnTaker.getName().equals(word)){
    chosenPlayer = player3;
    wordFinished = false;
    word = "";
    stage++;
  }
  else if (player4.getName().equals(word) && stage == 1 && !turnTaker.getName().equals(word)){
    chosenPlayer = player4;
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
    if (word.equals("None") || word.equals("Missing")){
      println("Nice try");
      word = "";
      wordFinished = false;
    }
    //If not, we check if the category already exists
    else if (word.equals(category1) || word.equals(category2) || word.equals(category3) || word.equals(category4)){
      //If it does, we go on to check if the chosen player has one
      for (int i = 1; i <= 12; i++){
        if (chosenPlayer.getQuant(i).getCategory().equals("Missing"))
          break;
        else if (chosenPlayer.getQuant(i).getCategory().equals(word)){
          //If they do, we go on to "give" that card to the asking Player
          playerHasCard = true;
          println(chosenPlayer.getName() + " does have one of those, here you go!");
          chosenPlayer.getQuant(i).setCategory("None");
          for (int j = 1; j <= 12; j++){
            if (turnTaker.getQuant(j).getCategory().equals("None")){
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
        for (int i = 1; i <= 3; i++){
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
    else if (category1.equals("")){
      category1 = word;
      question(turnTaker, chosenPlayer);
    }
    else if (category2.equals("")){
      category2 = word;
      question(turnTaker, chosenPlayer);
    }
    else if (category3.equals("")){
      category3 = word;
      question(turnTaker, chosenPlayer);
    }
    else if (category4.equals("")){
      category4 = word;
      question(turnTaker, chosenPlayer);
    }
    else{
      println("There's no category with that name, try again.");
      word = "";
      wordFinished = false;
    }
    if (stage > 2){
      turnCounter++;
      stage = 0;
    }
  }
}
