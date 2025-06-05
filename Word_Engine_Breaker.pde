void setup() {
  size(900, 675);
  background(240);

  fill(25, 74, 114);
  rect(0, 575, 900, 100);
  noStroke();

  fill(255);
  rect(270, 585, 360, 80, 8);
  noStroke();

  displayedIndices = new ArrayList<Integer>();
}

void draw() {
}

void keyPressed() { // この関数を追加します
  if (key == ' ') {
    displayinstruction();
  }
}
