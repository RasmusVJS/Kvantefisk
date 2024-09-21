//These variables are used in or for Skrivemaskine
boolean pressed = false; //<>//
String word = "";
boolean wordFinished = false;
boolean allWordsFinished = false;
//These variables are used in Username
boolean greetedAlready = false;
boolean stopUserName = false;
//These variables are used in TakeTurn
boolean askedWho = false;
boolean askedWhat = false;
boolean askedChosenPlayer = false;
Player chosenPlayer;
int stage = 1;
boolean playerHasCard = false;
boolean playerCantHaveCard = false;
String oldWord = "";
//turnCounter checks whose turn it is
int turnCounter;
String currentPlayer = "Player 1";
//List of existing Quantum Card categories
String category1 = "";
String category2 = "";
String category3 = "";
String category4 = "";

//The game's 4 players are created
Player player1 = new Player();
Player player2 = new Player();
Player player3 = new Player();
Player player4 = new Player();

void setup(){
  //Creates a board and the 4 Players
  size(600,600);
  for(int i = 0; i <= 3; i++){
    for(int j = 0; j <= 3; j++){
      rect(i*150,j*150,150,150);
    }
  }
  //Randomizes turn order
  turnCounter = int(random(1,5));
}

void draw(){
  if (!stopUserName){
    if (!allWordsFinished)
      username();
    else
      stopUserName = true;
  }
  else{
    if (turnCounter % 4 == 1)
      takeTurn(player1);
    else if (turnCounter % 4 == 2)
      takeTurn(player2);
    else if (turnCounter % 4 == 3)
      takeTurn(player3);
    else
      takeTurn(player4);
  }
}
