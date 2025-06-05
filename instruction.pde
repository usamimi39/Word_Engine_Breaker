String[]instructionword = {"Apple","Orange","Grape"};

  void displayinstruction(){
    String instword = instructionword[int(random(instructionword.length))] ;
    textSize(80);
    textAlign(CENTER,CENTER);
    fill(0);
    text(instword,width/2,625);
  }
