ArrayList<Integer> displayedSetIndices;
String[][]wordSets = {
  {"りんご", "Apple", "Book", "Water"},
  {"犬", "Dog", "Cloud", "Music"},
  {"走る", "Run", "Sleep", "Chair"},
  {"太陽", "Sun", "Moon", "Star"},
  {"猫", "Cat", "Fish", "Tree"},
  {"雪", "Snow", "Spring", "Summer"},
};

PImage fanImage; // ファンの画像を保持する変数
int fanPosition = 1; 

// 現在表示中のクイズ内容を保持する変数
String currentQuestion = "スペースキーを押してクイズを開始！"; // 初期メッセージ
ArrayList<String> currentChoices = new ArrayList<String>();
