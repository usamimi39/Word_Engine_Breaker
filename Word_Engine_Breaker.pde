void setup() {
  size(1200, 800);
  smooth();
  PFont font = createFont("Meiryo", 24);
  textFont(font);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);

  displayedSetIndices = new ArrayList<Integer>();

  particles = new ArrayList<Particle>();

  fanImage = loadImage("mode_fan.png");

  basezunda = loadImage("basezunda.png");
  if (basezunda != null) {
    basezunda.resize(300, 0);
  }

  // 明るい表情のキャラクター画像を読み込む
  happyzunda = loadImage("happyzunda.png");

  // ★★★ このデバッグ用の行を追加・確認してください ★★★
  println("happyzunda変数の状態: " + happyzunda);

  if (happyzunda != null) {
    happyzunda.resize(300, 0);
  }

  for (int i = 0; i < clothes.length; i++) {
    String filename = "item_0" + (i + 1) + ".png";
    clothes[i] = loadImage(filename);
    if (clothes[i] != null) {
      clothes[i].resize(300, 0);
    }
  }
}



void draw() {
  // 1. 背景と静的な土台を描画
  background(240);
  fill(24, 58, 137);
  noStroke();
  rect(0, 0, 1200, 40);
  fill(255);
  noStroke();
  // 中央白い枠
  rect(400, 250, 400, 600);

  drawCharacterAndItems();

  drawQuizUI();

  drawFan();

  for (int i = particles.size() - 1; i >= 0; i--) {
    // リストからi番目のパーティクルを取り出す
    Particle p = particles.get(i);
    // 状態を更新する (位置を動かす、寿命を減らすなど)
    p.update();
    // 画面に描画する
    p.display();
    // もし寿命が尽きていたら、リストから削除する
    if (p.isDead()) {
      particles.remove(i);
    }
  }

  // 表示内容の判定
  if (gameState == 1) {
    drawFeedback();
  }
}

void keyPressed() {
  // --- 上下キーによるファン操作 ---
  if (keyCode == UP) {
    fanPosition = max(0, fanPosition - 1);
  } else if (keyCode == DOWN) {
    fanPosition = min(2, fanPosition + 1);
  }

  // --- スペースキーが押されたときの処理を整理 ---
  if (key == ' ') {
    // 最初の問題を開始する
    if (currentSetIndex == -1) {
      prepareNewQuizSet();
      return;
    }

    // ゲームの状態に応じて処理を分岐
    if (gameState == 0) { // 「解答中」なら...
      checkAnswer();
    } else if (gameState == 1) { // 「結果表示中」なら...
      if (lastAnswerWasCorrect) {
        // 正解だったので、正解数を1増やす
        correctAnswersCount++;

        // 次の問題を準備する (この中でgameStateが2になる可能性がある)
        prepareNewQuizSet();

        // ★★★ ここを修正 ★★★
        // もし、ゲームが終了状態(2)になっていなければ、gameStateを0に戻す
        if (gameState != 2) {
          gameState = 0;
        }
      } else {
        // 不正解だったので、解答中に戻るだけ
        gameState = 0;
      }
    } else if (gameState == 2) { // 「全問終了」なら...
      println("クイズは終了しました。");
    }
  }
}


void drawCharacterAndItems() {
  float charX = 1000;
  float charY = 450;

  if (gameState == 2) { // 「全問終了」状態の場合
    // 明るい表情のキャラクターを描画
    if (happyzunda != null) {
      image(happyzunda, charX, charY);
    }
  } else { // まだクイズが続いている場合
    // 通常の表情のキャラクターを描画
    if (basezunda != null) {
      image(basezunda, charX, charY);
    }
  }



  // 1. 正解数に応じて、アイテムを重ねて描画 (この部分は変更なし)
  int correctCount = correctAnswersCount;
  for (int i = 0; i < correctCount; i++) {
    if (clothes[i] != null) {
      image(clothes[i], charX, charY);
    }
  }
}






//クイズUI
void drawQuizUI() {
  showBricks();

  // 問題
  fill(0);
  textSize(38);
  textAlign(CENTER, CENTER);
  text(currentQuestion, 600, 120);

  // 選択肢
  if (currentChoices.size() == 3) {
    textSize(30);
    text(currentChoices.get(0), 600, 310);
    text(currentChoices.get(1), 600, 410);
    text(currentChoices.get(2), 600, 510);
  }
}

void drawFan() {
  float fanX = 200;
  float fanY;
  float fanWidth = 60;
  float fanHeight = 60;

  if (fanPosition == 0) { // 上
    fanY = 310;
  } else if (fanPosition == 2) { // 下
    fanY = 510;
  } else { // 中央
    fanY = 410;
  }

  if (fanImage != null) {
    image(fanImage, fanX, fanY, fanWidth, fanHeight);
  }
}

//OX判定
void drawFeedback() {

  float feedbackY;
  if (answeredPosition == 0) {
    feedbackY = 310;
  } else if (answeredPosition == 2) {
    feedbackY = 510;
  } else {
    feedbackY = 410;
  }
  float feedbackX = 780 - 40;
  if (lastAnswerWasCorrect) {
    strokeWeight(5);
    stroke(0, 200, 100);
    noFill();
    circle(feedbackX, feedbackY, 40);
  } else {
    strokeWeight(5);
    stroke(220, 50, 50);
    line(feedbackX - 15, feedbackY - 15, feedbackX + 15, feedbackY + 15);
    line(feedbackX + 15, feedbackY - 15, feedbackX - 15, feedbackY + 15);
  }
}
