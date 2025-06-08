// ==========================================================
// wordSets.pde の全コード
// ==========================================================

// --- グローバル変数 ---

// クイズデータ
String[][]wordSets = {
  {"りんご", "Apple", "Book", "Water"},
  {"犬", "Dog", "Cloud", "Music"},
  {"走る", "Run", "Sleep", "Chair"},
  {"太陽", "Sun", "Moon", "Star"},
  {"猫", "Cat", "Fish", "Tree"},
  {"雪", "Snow", "Spring", "Summer"},
};

// 出題済みの問題セットのインデックスを記録するリスト
ArrayList<Integer> displayedSetIndices;

// ファンの画像を保持する変数
PImage fanImage; 

// ファンの位置 (0=上, 1=中央, 2=下)
int fanPosition = 1; 

// 現在表示中のクイズ内容を保持する変数
String currentQuestion = "スペースキーを押してクイズを開始！";
ArrayList<String> currentChoices = new ArrayList<String>();
int currentSetIndex = -1; // 現在の問題セットのインデックス

// 正解判定用の変数
String currentCorrectAnswer; // 現在の問題の正解
int gameState = 0; // 0:解答中, 1:結果表示中
boolean lastAnswerWasCorrect;
int answeredPosition = -1; // どの位置で解答したか記憶
