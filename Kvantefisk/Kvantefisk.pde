//pressed and word are used in Skrivemaskine
boolean pressed = false;
String word = "";
boolean wordFinished = false;
boolean allWordsFinished = false;
//turnCounter checks whose turn it is
int turnCounter;

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
    }}
  //Randomizes turn order
  turnCounter = int(random(1,5));
  
}

void draw(){ //<>//
  if (!allWordsFinished)
    username();
}
