//使いたい単語はここに入力
String[][]wordSets = {
  {"りんご", "Apple", "Book", "Water"},
  {"犬", "Dog", "Cloud", "Music"},
  {"走る", "Run", "Sleep", "Chair"},
  {"太陽", "Sun", "Moon", "Star"},
  {"猫", "Cat", "Fish", "Tree"},
  {"雪", "Snow", "Spring", "Summer"},
  {"書く", "Write", "Read", "Listen"},
  {"大きい", "Big", "Small", "Happy"}
};

PImage basezunda;
PImage happyzunda;
PImage[]clothes = new PImage[8];

ArrayList<Integer> displayedSetIndices;

ArrayList<Particle> particles;

PImage fanImage;

int fanPosition = 1;

int correctAnswersCount = 0;


String currentQuestion = "スペースキーでスタート！";
ArrayList<String> currentChoices = new ArrayList<String>();
int currentSetIndex = -1;


String currentCorrectAnswer;
int gameState = 0;
boolean lastAnswerWasCorrect;
int answeredPosition = -1;
