//These variables are used in or for Skrivemaskine
boolean pressed = false; //<>//
String word = "";
boolean wordFinished = false;
boolean usingSkrivemaskine = false;
//These variables are used in Username
boolean greetedAlready = false;
boolean stopUserName = false;
boolean allWordsFinished = false;
//These variables are used in TakeTurn
boolean askedWho = false;
boolean askedWhat = false;
boolean askedChosenPlayer = false;
Player chosenPlayer;
int stage = 1;
boolean playerHasCard = false;
boolean playerCantHaveCard = false;
String oldWord = "";
boolean hasCategory = false;
boolean questioning = false;
//turnCounter checks whose turn it is
int turnCounter;
String currentPlayer = "Player 1";
//Used in GameOver
int[] cardCount = {0, 0, 0, 0};
boolean[] hasWon = {false, false, false, false};
//List of existing Quantum Card categories
String[] categories = {"", "", "", ""};

//The game's 4 players are created
Player[] players = {new Player(), new Player(), new Player(), new Player()};

void setup(){
  //Creates a board and the 4 Players
  size(600,600);
  //Randomizes turn order
  turnCounter = int(random(0,4));
}

void draw(){
  if (!stopUserName){
    if (!allWordsFinished)
      username();
    else
      stopUserName = true;
  }
  else{
    takeTurn(players[(turnCounter % 4)]);
  }
}
