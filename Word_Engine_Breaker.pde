void setup() {
  size(900, 675);
  PFont font = createFont("Meiryo", 24);
  textFont(font);
  textAlign(CENTER, CENTER);

  
  displayedSetIndices = new ArrayList<Integer>();

  wordSets = new String[][] {
    {"りんご", "Apple", "Book", "Water"},
    {"犬", "Dog", "Cloud", "Music"},
    {"走る", "Run", "Sleep", "Chair"},
    {"太陽", "Sun", "Moon", "Star"},
    {"猫", "Cat", "Fish", "Tree"},
    {"雪","Snow","Spring","Summer"},
  };

  background(240);

  fill(25, 74, 114);
  rect(0, 0, 900, 100);
  noStroke();

  fill(255);
  rect(270, 10, 360, 80, 8);
  noStroke();
}

void draw() {
}

void keyPressed() {
  if (key == ' ') {
    displayNewQuizSet();
  }
}
