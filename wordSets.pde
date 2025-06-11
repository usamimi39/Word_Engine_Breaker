//使いたい単語はここに入力
String[][]wordSets = {
  {"りんご", "Apple", "Book", "Water"},
  {"犬", "Dog", "Cloud", "Music"},
  {"走る", "Run", "Sleep", "Chair"},
};

PImage basezunda;
PImage happyzunda;
PImage[]clothes = new PImage[3];

ArrayList<Integer> displayedSetIndices;

ArrayList<Particle> particles;

PImage fanImage;

int fanPosition = 1;

int correctAnswersCount = 0;


String currentQuestion = "スペースキーを押してクイズを開始！";
ArrayList<String> currentChoices = new ArrayList<String>();
int currentSetIndex = -1; // 現在の問題セットのインデックス


String currentCorrectAnswer;
int gameState = 0;
boolean lastAnswerWasCorrect;
int answeredPosition = -1;
