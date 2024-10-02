//Used at first to let the players choose their name
void username(){
  //Greets each player, prompting them to provide their name
  if (!greetedAlready){
    println(currentPlayer + ", please provide your name:");
    greetedAlready = true;
  }
  if (!wordFinished || usingSkrivemaskine)
    skrivemaskine();
    
  else if (players[0].getName().equals("")){
    players[0].provideName(word);//Changes Player 1 to their name
    println("Thank you, " + word + "!");//Thanks them using their name
    wordFinished = false;
    word = "";
    greetedAlready = false;
    currentPlayer = "Player 2";//Prepares for the next player
  }
  else if (players[1].getName().equals("")){
    players[1].provideName(word);
    println("Thank you, " + word + "!");
    wordFinished = false;
    word = "";
    greetedAlready = false;
    currentPlayer = "Player 3";
  }
  else if (players[2].getName().equals("")){
    players[2].provideName(word);
    println("Thank you, " + word + "!");
    wordFinished = false;
    word = "";
    greetedAlready = false;
    currentPlayer = "Player 4";
  }
  else if (players[3].getName().equals("")){
    players[3].provideName(word);
    println("Thank you, " + word + "!");
    allWordsFinished = true;//Ensures the naming loop ends
    word = "";
    wordFinished = false;
  }
}
