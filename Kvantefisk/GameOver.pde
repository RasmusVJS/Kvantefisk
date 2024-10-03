//Method used to check, if the win condition has been achieved
void gameOver() {
  //Loop that goes through each Player
  for (int i = 0; i < 4; i++) {
    //Loop that goes through each Category
    for (int j = 0; j < 4; j++) {
      //Loop that goes through each Card in Plauer i's Hand
      for (int n = 0; n < players[i].getHandSize(); n++) {
        //Check each Card Player i has of Category j
        if (players[i].getQuant(n).getCategory().equals(categories[j]) && !categories[j].equals("")) {
          cardCount[j]++;
        }
      }
      //If a Player has 4 cards of a category, they win
      if (cardCount[j] > 3)
        hasWon[i] = true;
      cardCount[j] = 0;
    }
    if (hasWon[i]) {
      println(players[i].getName() + " has won! Congratulations!");
      noLoop();
    }
  }
}
