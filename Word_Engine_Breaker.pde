// ==========================================================
// Word_Engine_Breaker.pde の全コード
// ==========================================================


// --- setup()関数 : プログラム実行時に一度だけ呼ばれる ---
void setup() {
  size(1200, 800);
  smooth(); // 描画を滑らかにする
  PFont font = createFont("Meiryo", 24);
  textFont(font);
  textAlign(CENTER, CENTER);
  imageMode(CENTER); // 画像を中央基準で配置する設定

  // グローバル変数の初期化 (ArrayList)
  displayedSetIndices = new ArrayList<Integer>();
  
  // 画像をdataフォルダから読み込む
  fanImage = loadImage("mode_fan.png");
}


// --- draw()関数 : 毎フレーム呼び出され、画面全体を描画する司令塔 ---
void draw() {
  // 1. 背景と静的な土台を描画
  background(240);
  fill(24, 58, 137);
  noStroke();
  rect(0, 0, 1200, 40);
  fill(255);
  noStroke();
  // 中央の白い背景 (サイズは適宜調整してください)
  rect(400, 250, 400, 600);

  // 2. クイズ画面（お題、レンガ、選択肢）を描画
  drawQuizUI();

  // 3. ファンの描画
  drawFan();

  // 4. もし「結果表示中」なら、判定結果(◯✕)を重ねて描画
  if (gameState == 1) {
    drawFeedback();
  }
}


// --- keyPressed()関数 : キーが押されたときに呼ばれる ---
void keyPressed() {
if (keyCode == UP) {
    fanPosition = max(0, fanPosition - 1);
  } else if (keyCode == DOWN) {
    fanPosition = min(2, fanPosition + 1);
  }

  // --- スペースキーが押されたときの処理を、gameStateに応じて分岐 ---
  if (key == ' ') {
    if (gameState == 0) { // 「解答中」なら...
      checkAnswer(); // 答えを判定する
      
    } else if (gameState == 1) { // 「結果表示中」なら...
      if (lastAnswerWasCorrect) {
        // 正解だったので、次の問題に進む
        prepareNewQuizSet();
        gameState = 0;
      } else {
        // 不正解だったので、解答中に戻るだけ
        gameState = 0;
      }
      
    } else if (gameState == 2) { // 「全問終了」なら...
      // 何もしない (クラッシュを防ぐ)
      // もしゲームをリセットしたくなったら、ここにその処理を書きます
      println("クイズは終了しました。");
    }
  }

  // 最初の問題を開始する処理 (変更なし)
  if (key == ' ' && currentSetIndex == -1 && gameState == 0) {
    prepareNewQuizSet();
  }
}


// ==========================================================
// 以下は、draw()関数を補助するヘルパー関数です
// ==========================================================

// --- クイズのUI（お題、レンガ、選択肢）を描画する関数 ---
void drawQuizUI() {
  showBricks(); 

  // お題を表示
  fill(0);
  textSize(38);
  textAlign(CENTER, CENTER);
  text(currentQuestion, 600, 120);

  // 選択肢を表示
  if (currentChoices.size() == 3) {
    textSize(30);
    text(currentChoices.get(0), 600, 310);
    text(currentChoices.get(1), 600, 410);
    text(currentChoices.get(2), 600, 510);
  }
}

// --- ファンを描画する関数 ---
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

// --- 正解・不正解のフィードバック(◯✕)を描画する関数 ---
void drawFeedback() {
  // ... (◯や✕を描画する部分は変更なし) ...
  float feedbackY;
  if (answeredPosition == 0) { feedbackY = 310; } 
  else if (answeredPosition == 2) { feedbackY = 510; } 
  else { feedbackY = 410; }
  float feedbackX = 780 - 40; 
  if (lastAnswerWasCorrect) {
    strokeWeight(5); stroke(0, 200, 100); noFill();
    circle(feedbackX, feedbackY, 40); 
  } else {
    strokeWeight(5); stroke(220, 50, 50);
    line(feedbackX - 15, feedbackY - 15, feedbackX + 15, feedbackY + 15);
    line(feedbackX + 15, feedbackY - 15, feedbackX - 15, feedbackY + 15);
  }
  
  // ★★★ 次に進むためのメッセージ表示を、状況に応じて変更 ★★★
  String message;
  if (lastAnswerWasCorrect) {
    message = "正解！ スペースキーを押して次の問題へ";
  } else {
    message = "不正解！ なにかキーを押して再挑戦";
  }
  
  fill(0);
  noStroke();
  textSize(28);
  textAlign(CENTER, CENTER);
  text(message, 600, height - 80);
}
  
