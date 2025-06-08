// ==========================================================
// answer_logic.pde の全コード
// ==========================================================

void checkAnswer() {
  // 問題が表示されていない、または解答済みの場合は何もしない
  if (currentChoices.isEmpty()) {
    return;
  }
  if (gameState != 0) {
    return; 
  }
  if (currentSetIndex == -1 || gameState == 1) {
    return; 
  }

  
  // 1. ユーザーがファンで選んでいる単語を取得
  String selectedAnswer = currentChoices.get(fanPosition);
  
  // 2. 本当の正解の単語を取得
  String correctAnswer = wordSets[currentSetIndex][1];
  
  // 3. ユーザーの選択と、記憶しておいた正解を比較
  if (selectedAnswer.equals(correctAnswer)) {
    lastAnswerWasCorrect = true;
    println("正解！"); 
  } else {
    lastAnswerWasCorrect = false;
    println("不正解...");
  }
  
  // どの位置で答えたか記憶する
  answeredPosition = fanPosition;
  
  // ゲームの状態を「結果表示中」に変更する
  gameState = 1; 
}
