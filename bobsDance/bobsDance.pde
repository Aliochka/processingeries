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
  size(1000, 1000, P3D);
  colorMode(HSB, 100);
  background(backgroundColor);
  strokeWeight(2);
  field = new Field(4);
  // frameRate(20);
  for(int i = 0; i < bobsNumber; i++) {
    Bobs[i] = new Bobs(int(random(width / 4, 3 * width / 4)), int(random(width / 4, 3 * width / 4)), 1);
  }
  println("init finito");
  printHelp();
}

void draw() {
  field.drawField();
  // bobs.drawBobs();
  for(int i = 0; i < bobsNumber; i++) {
    Bobs[i].drawBobs();
  }

  if (isCreatingBob) {
    for(int i = 0; i < bobsNumber; i++) {
      Bobs[i].welcomeExclude(mouseX, mouseY);
    }
  }

  // press r
  record();
}
