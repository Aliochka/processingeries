// processing --sketch=./bobsDance --run
// Particle part = positions.get(0);
ArrayList<Bob> bobs = new ArrayList<Bob>();
boolean isCreatingBob = false;
boolean isRecording = false;
boolean isDrawing = false;
boolean isCurved = true;
int bobsLimit = 10;
int backgroundColor = 0;
int bobsVerticesCount = 5;

void setup() {
  size(1024, 720, P2D);
  colorMode(HSB, 100);
  background(backgroundColor);
  strokeWeight(5);
  // initializeBobs();
  frameRate(15);
}

void draw() {
  refreshCanvas(backgroundColor);
  // press b to create bobs
  if (isCreatingBob & frameCount % 5 == 0) {
    println("new bob");
    bobs.add(0, new Bob(mouseX, mouseY, bobsVerticesCount));
  }

  int bobsSize = bobs.size() - 1;
  for (int i = bobsSize; i >= 0; i--) {
    Bob bob = bobs.get(i);
    // press space to draw
    if (isDrawing) {
      moveToNextBob(i, bobsSize);
      // moveSkinToRandomSkin(bob, bobsSize);
    }
    bob.drawShape(isCurved);
  }
  if (bobsSize >= bobsLimit) {
    bobs.remove(bobsSize);
  }
  // press r
  record();
}

void initializeBobs(){
  int x = 1;
  int y = 1;
  for(int i = 0 ; i <= x; i++) {
    for(int j = 0 ; j <= y; j++) {
      bobs.add(0, new Bob(i * width / x, j * height / y, bobsVerticesCount));
    }
  }
}

void moveToNextBob(int bobPosition, int bobsSize) {
  Bob bob = bobs.get(bobPosition);
  if (bobsSize - bobPosition > 2)
  {
    Bob nextBob = bobs.get(bobPosition + 1);
    // PVector currentPosition = bob.getVertice();
    PVector newPosition = nextBob.getVertice();
    bob.switchVerticesToNextPosition(int(newPosition.x), int(newPosition.y));
  }
  Bob nextBob = bobs.get(0);
  PVector newPosition = nextBob.getVertice();
  bob.switchVerticesToNextPosition(int(newPosition.x), int(newPosition.y));
}


void moveSkinToMouse(Bob bob){
  bob.switchVerticesToNextPosition(mouseX, mouseY);
}

void moveSkinToRandomSkin(Bob bob, int bobsSize) {
  Bob randomBob = bobs.get(int(random(bobsSize)));
  PVector newPosition = randomBob.getRandomeVertice();
  bob.switchVerticesToNextPosition(int(newPosition.x), int(newPosition.y));
  bob.shakeVertices();
}
