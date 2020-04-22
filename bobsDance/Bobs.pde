class Bobs {
  ArrayList<Bob> bobs = new ArrayList<Bob>();
  int bobsLimit = 10;
  int bobsVerticesCount = 5;
  int bobsSize;
  Field field;

  Bobs (int x, int y, int bobsNumber, Field field) {
    this.field = field;
    for(int i = 0 ; i <= bobsNumber; i++) {
      bobs.add(0, new Bob( x,  y, bobsVerticesCount, field));
    }
  }

  void initializeBobsInPavage() {
    int x = 1;
    int y = 1;
    for(int i = 0 ; i <= x; i++) {
      for(int j = 0 ; j <= y; j++) {
        addBob(i * width / x, j * height / y, bobsVerticesCount);
      }
    }
  }

  void welcomeExclude(int x, int y) {
    addBob(x, y, bobsVerticesCount);
    bobsSize = bobs.size() - 1;
    if (bobsSize > bobsLimit) {
      bobs.remove(bobsSize);
    }
  }

  void addBob(int x, int y, int bobsVerticesCount) {
    bobs.add(0, new Bob(mouseX, mouseY, bobsVerticesCount, field));
  }

  Bob getBob(int position) {
    return bobs.get(position);
  }

  int bobsSize() {
    bobsSize = bobs.size();
    return bobsSize;
  }

  void removeBob(int position) {
    bobs.remove(position);
  }

  void switchToNextBob(int bobPosition) {
    Bob bob = getBob(bobPosition);
    Bob nextBob;
    if (bobsSize - bobPosition >= 2) {
      nextBob = getBob(bobPosition + 1);
    }
    else {
      nextBob = getBob(0);
    }
    bob.switchToNextBob(nextBob);
  }

  void moveToNextBob(int bobPosition) {
    Bob bob = getBob(bobPosition);
    Bob nextBob;
    if (bobsSize - bobPosition > 1) {
      nextBob = getBob(bobPosition + 1);
    }
    else {
      nextBob = getBob(0);
    }
    PVector newPosition = nextBob.getVertice(0);
    bob.switchVerticesToNextPosition(int(newPosition.x), int(newPosition.y));
  }

  void moveSkinToRandomSkin(int bobPosition) {
    Bob bob = getBob(bobPosition);
    Bob randomBob = getBob(int(random(bobsSize)));
    PVector newPosition = randomBob.getRandomeVertice();
    bob.switchVerticesToNextPosition(int(newPosition.x), int(newPosition.y));
    bob.shakeVertices();
  }

  void drawBobs() {
    bobsSize = bobsSize() - 1;
    for (int i = bobsSize; i >= 0; i--) {
      Bob bob = getBob(i);
      if (isDrawing) {
        // switchToNextBob(i);
        moveToNextBob(i);
        // moveSkinToRandomSkin(i);
      }
      bob.drawShape(isCurved);
    }
  }
}
