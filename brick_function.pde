// showBricks() 関数は変更なし
void showBricks() {
  fill(255);
  stroke(153);
  rect(420, 270, 360, 80, 5);
  rect(420, 370, 360, 80, 5);
  rect(420, 470, 360, 80, 5);
}

// クイズデータを「準備」する関数 (描画はしない)
void prepareNewQuizSet() {
  // 全ての問題が出題済みかチェック
  if (displayedSetIndices.size() >= wordSets.length) {
    currentQuestion = "全ての問題が出題されました！";
    currentChoices.clear(); // 選択肢を空にする
    return;
  }

  // まだ出題されていないランダムなインデックスを選ぶ
  int setIndex;
  do {
    setIndex = int(random(wordSets.length));
  } while (displayedSetIndices.contains(setIndex));
  displayedSetIndices.add(setIndex);

  // 選ばれたセットのデータをグローバル変数に格納する
  currentQuestion = wordSets[setIndex][0];
  String correctAnswer = wordSets[setIndex][1];
  String dummy1 = wordSets[setIndex][2];
  String dummy2 = wordSets[setIndex][3];

  // 選択肢を準備してシャッフルし、グローバル変数に格納する
  ArrayList<String> tempChoices = new ArrayList<String>();
  tempChoices.add(correctAnswer);
  tempChoices.add(dummy1);
  tempChoices.add(dummy2);
  
  // 前回の選択肢をクリア
  currentChoices.clear(); 
  
  // 手動でシャッフルしてcurrentChoicesに追加
  int randomIndex1 = int(random(tempChoices.size()));
  currentChoices.add(tempChoices.remove(randomIndex1));

  int randomIndex2 = int(random(tempChoices.size()));
  currentChoices.add(tempChoices.remove(randomIndex2));

  currentChoices.add(tempChoices.remove(0));
}
