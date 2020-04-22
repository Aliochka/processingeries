// processing --sketch=./bobsDance --run
// Particle part = positions.get(0);
boolean isCreatingBob = false;
boolean isRecording = false;
boolean isDrawing = false;
boolean isCurved = true;
int backgroundColor = 0;
Bobs bobs;
Field field;

void setup() {
  size(1024, 720, P2D);
  colorMode(HSB, 100);
  background(backgroundColor);
  strokeWeight(5);
  // initializeBobs();
  frameRate(10);
  field = new Field();
  bobs = new Bobs(width / 2, height / 2, 5, field);
}

void draw() {
  refreshCanvas(backgroundColor);
  field.drawField();

  // press b to create bobs
  if (isCreatingBob & frameCount % 5 == 0) {
    println("new bob");
    bobs.welcomeExclude(mouseX, mouseY);
  }
  bobs.drawBobs();


  // press r
  record();
}
