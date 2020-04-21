// processing --sketch=./bobsDance --run
// Particle part = positions.get(0);
boolean isCreatingBob = false;
boolean isRecording = false;
boolean isDrawing = false;
boolean isCurved = true;
int backgroundColor = 0;
Bobs bobs;
Bobs bobbies;

void setup() {
  size(1024, 720, P2D);
  colorMode(HSB, 100);
  background(backgroundColor);
  strokeWeight(5);
  // initializeBobs();
  frameRate(10);
  bobs = new Bobs(0, height / 2, 5);
  bobbies = new Bobs(3 * width / 4, height / 2, 10);
}

void draw() {
  refreshCanvas(backgroundColor);

  // press b to create bobs
  if (isCreatingBob & frameCount % 5 == 0) {
    println("new bob");
    bobs.welcomeExclude(mouseX, mouseY);
  }
  bobs.drawBobs();
  bobbies.drawBobs();

  // press r
  record();
}


void moveSkinToMouse(Bob bob){
  bob.switchVerticesToNextPosition(mouseX, mouseY);
}

void moveSkinToRandomSkin(Bob bob, int bobsSize) {
  Bob randomBob = bobs.getBob(int(random(bobsSize)));
  PVector newPosition = randomBob.getRandomeVertice();
  bob.switchVerticesToNextPosition(int(newPosition.x), int(newPosition.y));
  bob.shakeVertices();
}
