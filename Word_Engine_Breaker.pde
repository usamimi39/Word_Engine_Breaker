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

  //basezundaを読み込む
  basezunda = loadImage("basezunda.png");
  if (basezunda != null) {
    basezunda.resize(300, 0);
  }

  //happyzunda読み込む
  happyzunda = loadImage("happyzunda.png");

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
  // 背景と静的な土台を描画
  background(240);
  //上部バナー
  fill(24, 58, 137);
  noStroke();
  rect(0, 0, 1200, 40);

  textSize(30);
  fill(255);
  text("着せ替えWord Engine", 600, 18);

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

    p.update();

    p.display();

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
  //ステッキがfanなのはもともとファンの風邪で吹き飛ばすという設計だった名残
  if (keyCode == UP) {
    fanPosition = max(0, fanPosition - 1);
  } else if (keyCode == DOWN) {
    fanPosition = min(2, fanPosition + 1);
  }


  if (key == ' ') {
    // 最初の問題を開始する
    if (currentSetIndex == -1) {
      prepareNewQuizSet();
      return;
    }

    if (gameState == 0) { // 「解答中」
      checkAnswer();
    } else if (gameState == 1) { // 「結果表示中」
      if (lastAnswerWasCorrect) {


        prepareNewQuizSet();


        if (gameState != 2) {
          gameState = 0;
        }
      } else {

        gameState = 0;
      }
    } else if (gameState == 2) {
      println("クイズ終了");
    }
  }
}


void drawCharacterAndItems() {
  float charX = 1000;
  float charY = 450;

  // ベースキャラ描写
  if (gameState == 2) {
    if (happyzunda!= null) {
      image(happyzunda, charX, charY);
    }
  } else {
    if (basezunda != null) {
      image(basezunda, charX, charY);
    }
  }


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
  //座標取得
  PVector wandPos = getWandPosition();

  float fanWidth = 140;
  float fanHeight =140;

  if (fanImage != null) {
    image(fanImage, wandPos.x, wandPos.y, fanWidth, fanHeight);
  }
}

PVector getWandPosition() {
  float wandX = 200;
  float wandY;

  if (fanPosition == 0) { // 上
    wandY = 310;
  } else if (fanPosition == 2) { // 下
    wandY = 510;
  } else { // 中央
    wandY = 410;
  }


  return new PVector(wandX, wandY);
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
