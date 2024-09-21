//Used at first to let the players choose their name
void username(){
  //Greets each player, prompting them to provide their name
  if (!greetedAlready){
    println(currentPlayer + ", please provide your name:");
    greetedAlready = true;
  }
  if (!wordFinished)
    skrivemaskine();
  else if (player1.getName().equals("")){
    player1.provideName(word);//Changes Player 1 to their name
    println("Thank you, " + word + "!");//Thanks them using their name
    wordFinished = false;
    word = "";
    greetedAlready = false;
    currentPlayer = "Player 2";//Prepares for the next player
  }
  else if (player2.getName().equals("")){
    player2.provideName(word);
    println("Thank you, " + word + "!");
    wordFinished = false;
    word = "";
    greetedAlready = false;
    currentPlayer = "Player 3";
  }
  else if (player3.getName().equals("")){
    player3.provideName(word);
    println("Thank you, " + word + "!");
    wordFinished = false;
    word = "";
    greetedAlready = false;
    currentPlayer = "Player 4";
  }
  else if (player4.getName().equals("")){
    player4.provideName(word);
    println("Thank you, " + word + "!");
    allWordsFinished = true;//Ensures the naming loop ends
    word = "";
    wordFinished = false;
  }
}
