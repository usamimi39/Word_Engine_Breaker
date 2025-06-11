void checkAnswer() {

  if (currentChoices.isEmpty()) {
    return;
  }
  if (gameState != 0) {
    return;
  }
  if (currentSetIndex == -1 || gameState == 1) {
    return;
  }


  // 選択中を判定
  String selectedAnswer = currentChoices.get(fanPosition);

  // 正解の単語を抽出
  String correctAnswer = wordSets[currentSetIndex][1];

  answeredPosition = fanPosition;


  PVector wandEffectPosition = getWandPosition();
  int wandParticles = 100;
  color wandEffectColor = color(150, 200, 255);
  PVector wandAcceleration = new PVector(0.05, 0);
  for (int i = 0; i < wandParticles; i++) {

    particles.add(new Particle(wandEffectPosition, wandEffectColor, wandAcceleration));
  }


  if (selectedAnswer.equals(correctAnswer)) {
    lastAnswerWasCorrect = true;
    gameState = 1;
    correctAnswersCount++;
    println("正解！");


    PVector characterEffectPosition = new PVector(1000, 450);
    int characterParticles = 150;
    color characterEffectColor = color(255, 255, 150);


    PVector characterAcceleration = new PVector(0, 0.05);

    for (int i = 0; i < characterParticles; i++) {

      particles.add(new Particle(characterEffectPosition, characterEffectColor, characterAcceleration));
    }
  } else {
    lastAnswerWasCorrect = false;
    println("不正解...");
  }


  answeredPosition = fanPosition;


  gameState = 1;
}
