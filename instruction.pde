String[]instructionword = {"Apple", "Orange", "Grape", "Banana"};
ArrayList<Integer> displayedIndices;

void displayinstruction() {
  fill(255);
  noStroke();
  rect(270, 585, 360, 80, 8);

  int randomIndex;
  boolean alreadyShown;
  
  do{
    randomIndex = int(random(instructionword.length));
    alreadyShown = false;
    
    for(int shownIndex : displayedIndices){
      if(shownIndex == randomIndex){
        alreadyShown = true;
        break;
      }
    }
  }while(alreadyShown);
  
  displayedIndices.add(randomIndex);
  
  String instword = instructionword[randomIndex];
  textSize(40);
  textAlign(CENTER, CENTER);
  fill(0);
  text(instword, width / 2, 625);
}
