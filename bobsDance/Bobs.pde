class Bobs {
  ArrayList<Bob> bobs = new ArrayList<Bob>();
  int bobsLimit = 10;
  int bobsVerticesCount = 5;

  Bobs (int x, int y, int bobsNumber) {
    for(int i = 0 ; i <= bobsNumber; i++) {
      bobs.add(0, new Bob( x,  y, bobsVerticesCount));
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
    int bobsSize = bobs.size() - 1;
    if (bobsSize >= bobsLimit) {
      bobs.remove(bobsSize);
    }
  }

  void addBob(int x, int y, int bobsVerticesCount) {
    bobs.add(0, new Bob(mouseX, mouseY, bobsVerticesCount));
  }

  Bob getBob(int position) {
    return bobs.get(position);
  }

  int bobsSize() {
    return bobs.size();
  }

  void removeBob(int position) {
    bobs.remove(position);
  }

  void drawBobs() {
    int bobsSize = bobsSize() - 1;
    for (int i = bobsSize; i >= 0; i--) {
      Bob bob = getBob(i);
      if (isDrawing) {
        moveApproximativelyToNextBob(i, bobsSize);
        // moveSkinToRandomSkin(bob, bobsSize);
      }
      bob.drawShape(isCurved);
    }
  }

  void moveApproximativelyToNextBob(int bobPosition, int bobsSize) {
    Bob bob = getBob(bobPosition);
    if (bobsSize - bobPosition >= 2)
    {
      Bob nextBob = getBob(bobPosition + 1);
      PVector newPosition = nextBob.getVertice();
      bob.switchVerticesToNextPosition(int(newPosition.x), int(newPosition.y));
    }
    Bob nextBob = getBob(0);
    PVector newPosition = nextBob.getVertice();
    bob.switchVerticesToNextPosition(int(newPosition.x), int(newPosition.y));
  }
}
