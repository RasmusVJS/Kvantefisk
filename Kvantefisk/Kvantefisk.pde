  char letter = 65;
  boolean used;
  String word = "";
  boolean start;

void setup(){
  size(600,400);
  frameRate(30);
  Player player1 = new Player();
  Player player2 = new Player();
  Player player3 = new Player();
  Player player4 = new Player();
  noStroke();
  fill(0,255,0);
  rect(0,0,200,400);
  fill(255,0,0);
  rect(200,0,200,400);
  fill(0,0,255);
  rect(400,0,200,400);
}

void draw(){ //<>//
  if ((frameCount - 2) % 60 == 59)
    letter++;
    used = false;
  if (letter == 91)
    letter = 65;
  println(letter + " " + (((frameCount - 1) % 60) + 1));
  if (mouseX > 200)
    start = true;
  if ((mouseX < 200) && (!used) && (start == true)){
    word += letter;
    used = true;
  }
  if (mouseX > 400){
    println();
    println(word);
    noLoop();
  }
}
