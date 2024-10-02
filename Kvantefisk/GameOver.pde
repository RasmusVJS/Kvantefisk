void gameOver() {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      for (int n = 0; n < players[i].getHandSize(); n++) {
        if (players[i].getQuant(n).getCategory().equals(categories[j]) && !categories[j].equals("")) {
          cardCount[j]++;
        }
      }
      if (cardCount[j] > 3)
        hasWon[i] = true;
      cardCount[j] = 0;
    }
    if (hasWon[i]) {
      println(players[i] + " has won! Congratulations!");
      noLoop();
    }
  }
}
