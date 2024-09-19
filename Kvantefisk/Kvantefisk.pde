//pressed and word are used in Skrivemaskine
boolean pressed = false;
String word = "";
//turnCounter checks whose turn it is
int turnCounter = 1;

void setup(){
  //Creates a board and the 4 Players
  size(600,400);
  Player player1 = new Player();
  Player player2 = new Player();
  Player player3 = new Player();
  Player player4 = new Player();
}

void draw(){ //<>//
  skrivemaskine();
}
