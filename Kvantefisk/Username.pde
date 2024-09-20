void username(){
  if (!wordFinished)
    skrivemaskine();
  else if (player1.getName() == ""){
    player1.provideName(word);
    wordFinished = false;
  }
  else if (player2.getName() == ""){
    player2.provideName(word);
    wordFinished = false;
  }
  else if (player3.getName() == ""){
    player3.provideName(word);
    wordFinished = false;
  }
  else if (player4.getName() == ""){
    player4.provideName(word);
    allWordsFinished = true;
  }
}
