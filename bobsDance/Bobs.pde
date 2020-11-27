class Bobs {
  ArrayList<Bob> bobs;
  int bobsLimit;
  int bobsSize;
  float politicalColor;

  Bobs(){
    bobsLimit = 20;
    bobs = new ArrayList<Bob>();
    politicalColor = random(10, 90);
  }

  Bobs (int x, int y, int bobsNumber) {
    this();
    for(int i = 0 ; i < bobsNumber; i++) {
      bobs.add(0, new Bob(x, y, politicalColor));
    }
  }

  void initializeBobsInPavage() {
    int x = 1;
    int y = 1;
    for(int i = 0 ; i <= x; i++) {
      for(int j = 0 ; j <= y; j++) {
        addBob(i * width / x, j * height / y);
      }
    }
  }

  void welcomeExclude(int x, int y) {
    addBob(x, y);
    bobsSize = bobs.size() - 1;
    if (bobsSize > bobsLimit) {
      bobs.remove(bobsSize);
    }
  }

  void addBob(int x, int y) {
    bobs.add(0, new Bob(x, y, politicalColor));
  }

  Bob getBob(int position) {
    return bobs.get(position);
  }

  void removeBob(int position) {
    bobs.remove(position);
  }

  void switchToNextBob(int bobPosition) {
    // rename me !
    bobsSize = bobs.size() - 1;
    Bob bob = getBob(bobPosition);
    Bob nextBob;
    if (bobsSize - bobPosition > 0) {
      nextBob = getBob(bobPosition + 1);
    }
    else {
      nextBob = getBob(0);
    }
    bob.switchToNextBob(nextBob);
  }

  void moveApproximativelyToNextBob(int bobPosition) {
    // rename me !
    Bob bob = getBob(bobPosition);
    Bob nextBob;
    if (bobsSize - bobPosition > 1) {
      nextBob = getBob(bobPosition + 1);
    }
    else {
      nextBob = getBob(0);
    }
    Agent newPosition = nextBob.getVertice(0);
    bob.moveApproximativelyToNextPosition(newPosition.position.x, newPosition.position.y);
  }

  void moveSkinToRandomSkin(int bobPosition) {
    // use random function
    Bob bob = getBob(bobPosition);
    Bob randomBob = getBob(int(random(bobsSize)));
    Agent newPosition = randomBob.getRandomVertice();
    bob.moveApproximativelyToNextPosition(newPosition.position.x, newPosition.position.y);
    }

  void drawBobs() {
    bobsSize = bobs.size() - 1;
    for (int i = bobsSize; i >= 0; i--) {
      Bob bob = getBob(i);
      if (isDrawing) {
        switchToNextBob(i);
        // moveApproximativelyToNextBob(i);
        // moveSkinToRandomSkin(i);
      }
      bob.drawShape(isCurved);
    }
  }
}
