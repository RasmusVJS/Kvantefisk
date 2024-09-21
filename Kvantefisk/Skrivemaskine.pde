//Function used to write and save a word
void skrivemaskine(){
  //Prints and saves a letter into the word
  if (pressed && key != '+' && key != '?'){
    print(key);
    word += key;
    pressed = false;
    keyPressed = false;
  }
  //Ensures that the last pressed key is used
  else if (keyPressed && key != '+' && key != '?')
    pressed = true;
  //Allows the writing to end
  else if (key == '+' && !word.equals("")){
    println();
    wordFinished = true;
  }
}
