//Function used to write and save a word
void skrivemaskine(){
  //Prints and saves a letter into the word
  if (pressed){
    print(key);
    word += key;
    pressed = false;
    keyPressed = false;
  }
  //Ensures that the last pressed key is used
  if (keyPressed)
    pressed = true;
  //Allows the writing to end
  if (key == '+'){
    //Needs to be removed later
    wordFinished = true;
  }
}
