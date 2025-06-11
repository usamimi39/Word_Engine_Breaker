//単語ブロック表示
void showBricks() {
  fill(255);
  stroke(153);
  strokeWeight(2);
  rect(420, 270, 360, 80, 5);
  rect(420, 370, 360, 80, 5);
  rect(420, 470, 360, 80, 5);
}


void prepareNewQuizSet() {
  answeredPosition = -1;

  // 1. 全ての問題が出題済みかどうかをチェック
  if (displayedSetIndices.size() >= wordSets.length) {
    currentQuestion = "全ての問題が出題されました！";
    currentChoices.clear();
    gameState = 2; // ★変更: 状態を「全問終了」にする
    return;
  }

  int setIndex;
  do {
    setIndex = int(random(wordSets.length));
  } while (displayedSetIndices.contains(setIndex));

  displayedSetIndices.add(setIndex);
  currentSetIndex = setIndex;

  // 選択済みデータ
  currentQuestion = wordSets[setIndex][0];
  String correctAnswer = wordSets[setIndex][1];
  String dummy1 = wordSets[setIndex][2];
  String dummy2 = wordSets[setIndex][3];


  currentCorrectAnswer = correctAnswer;

  // 選択肢を格納
  ArrayList<String> tempChoices = new ArrayList<String>();
  tempChoices.add(correctAnswer);
  tempChoices.add(dummy1);
  tempChoices.add(dummy2);

  currentChoices.clear();

  int randomIndex1 = int(random(tempChoices.size()));
  currentChoices.add(tempChoices.remove(randomIndex1));

  int randomIndex2 = int(random(tempChoices.size()));
  currentChoices.add(tempChoices.remove(randomIndex2));

  currentChoices.add(tempChoices.remove(0));
}
