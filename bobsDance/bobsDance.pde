// processing --sketch=./bobsDance --run
import com.hamoid.*;

boolean isCreatingBob = false;
boolean isRecording = false;
boolean isTakingPicture = false;
boolean isDrawing = true;
boolean isCurved = true;
boolean showBobs = true;

int bobsNumber = 10;
// Bobs bobs;
Bobs[] Bobs = new Bobs[bobsNumber];
Field field;
VideoExport videoExport;


void setup() {
  size(1200, 750, P3D);
  colorMode(HSB, 100);
  background(100);
  strokeWeight(2);
  field = new Field(4);
  frameRate(10);
  for(int i = 0; i < bobsNumber; i++) {
    Bobs[i] = new Bobs(int(random(width / 4, 3 * width / 4)), int(random(width / 4, 3 * width / 4)), 10);
  }
  videoExport = new VideoExport(this);
  videoExport.startMovie();
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
  if (isRecording) {
    videoExport.saveFrame();
  }
  // press p
  if (isTakingPicture){
    record();
  }
}
