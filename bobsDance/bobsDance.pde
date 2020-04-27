// processing --sketch=./bobsDance --run
// Particle part = positions.get(0);
boolean isCreatingBob = false;
boolean isRecording = false;
boolean isDrawing = false;
boolean isCurved = true;
int backgroundColor = 36;
Bobs bobs;
Field field;

void setup() {
  size(1024, 720, P2D);
  colorMode(HSB, 100);
  background(backgroundColor);
  strokeWeight(5);
  field = new Field();
  // initializeBobs();
  // frameRate(10);
  bobs = new Bobs(width / 2, height / 2, 5);
  println("init finito");
}

void draw() {
  // refreshCanvas(backgroundColor);
  field.drawField();
  // bobs.drawBobs();

  // press b to create bobs
  if (isCreatingBob & frameCount % 5 == 0) {
    println("new bob");
    bobs.welcomeExclude(mouseX, mouseY);
  }


  // press r
  record();
}
