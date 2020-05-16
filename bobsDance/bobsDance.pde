// processing --sketch=./bobsDance --run
// Particle part = positions.get(0);
boolean isCreatingBob = false;
boolean isRecording = false;
boolean isDrawing = false;
boolean isCurved = true;
boolean showBobs = true;
int backgroundColor = 0;
int bobsNumber = 1;
// Bobs bobs;
Bobs[] Bobs = new Bobs[bobsNumber];
Field field;

void setup() {
  size(1000, 1000, P2D);
  colorMode(HSB, 100);
  background(backgroundColor);
  strokeWeight(5);
  field = new Field();
  // frameRate(20);
  // bobs = new Bobs(width / 2, height / 2, 5);
  for(int i = 0; i < bobsNumber; i++) {
    Bobs[i] = new Bobs(int(random(width)), int(random(height)), 12);
  }
  println("init finito");
}

void draw() {
  refreshCanvas(backgroundColor);
  field.drawField();
  // bobs.drawBobs();
  for(int i = 0; i < bobsNumber; i++) {
    Bobs[i].drawBobs();
  }
  // press b to create bobs
  if (isCreatingBob & frameCount % 5 == 0) {
    println("new bob");
    // bobs.welcomeExclude(mouseX, mouseY);
    for(int i = 0; i < bobsNumber; i++) {
      Bobs[i].welcomeExclude(mouseX, mouseY);
    }
  }


  // press r
  record();
}
