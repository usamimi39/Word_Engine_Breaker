void setup() {
  size(1200,800 );
  PFont font = createFont("Meiryo", 24);
  textFont(font);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);

  displayedSetIndices = new ArrayList<Integer>();
  
  fanImage = loadImage("mode_fan.png");

}

void draw() {
  //画面の静的要素
  background(240);
  fill(24, 58, 137);
  noStroke();
  rect(0, 0, 1200, 40); 
  fill(255);
  noStroke();
  rect(400, 250, 400, 600); 
  
  showBricks();
  
  fill(0);
  textSize(38);
  text(currentQuestion, 600, 120); 
  
  if (currentChoices.size() == 3) {
    textSize(30);
    text(currentChoices.get(0), 600, 310); // レンガ1の上
    text(currentChoices.get(1), 600, 410); // レンガ2の上
    text(currentChoices.get(2), 600, 510); // レンガ3の上
  }
  
 // --- 3. ファンの位置を決定して描画 ---
  float fanX = 200; // 左側に配置 (X座標は固定)
  float fanY; // Y座標は fanPosition に応じて変わる

  if (fanPosition == 0) { // 上
    fanY = 310; // レンガ1のY座標
  } else if (fanPosition == 2) { // 下
    fanY = 510; // レンガ3のY座標
  } else { // 中央 (デフォルト)
    fanY = 410; // レンガ2のY座標
  }
  

    image(fanImage, fanX, fanY);
  
  

  
}

void keyPressed() {
  if (key == ' ') {
    prepareNewQuizSet(); // クイズの「準備」をする関数を呼び出す
  } else if (keyCode == UP) {
    fanPosition = max(0, fanPosition - 1); // 0より下にはいかない
  } else if (keyCode == DOWN) {
    fanPosition = min(2, fanPosition + 1); // 2より上にはいかない
  }
}
