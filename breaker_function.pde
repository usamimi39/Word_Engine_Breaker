void showBricks() {
  fill(255);
  stroke(153);
  rect(5, 150, 290, 80, 8);
  rect(305, 150, 290, 80, 8);
  rect(605, 150, 290, 80, 8);
}

void displayNewQuizSet() {
    fill(255);
  rect(270, 10, 360, 80, 8);
  noStroke();
  
  showBricks();

  int setIndex;
  do {
    setIndex = int(random(wordSets.length));
  } while (displayedSetIndices.contains(setIndex));

  displayedSetIndices.add(setIndex);

  String question = wordSets[setIndex][0];
  String correctAnswer = wordSets[setIndex][1];
  String dummy1 = wordSets[setIndex][2];
  String dummy2 = wordSets[setIndex][3];

  ArrayList<String> choicesToDisplay = new ArrayList<String>();
  choicesToDisplay.add(correctAnswer);
  choicesToDisplay.add(dummy1);
  choicesToDisplay.add(dummy2);

  fill(0);
  textSize(38);
  textAlign(CENTER, CENTER);
  text(question, width / 2, 50);

  textSize(30);
  fill(0);
  textAlign(CENTER, CENTER);

  int randomIndex1 = int(random(choicesToDisplay.size()));
  String wordForBrick1 = choicesToDisplay.remove(randomIndex1);
  text(wordForBrick1, 5+ 290/2, 150 + 80/2);

  int randomIndex2 = int(random(choicesToDisplay.size()));
  String wordForBrick2 = choicesToDisplay.remove(randomIndex2);
  text(wordForBrick2, 305+ 290/2, 150 + 80/2);

  String wordForBrick3 = choicesToDisplay.remove(0);
  text(wordForBrick3, 605+ 290/2, 150 + 80/2);
}
