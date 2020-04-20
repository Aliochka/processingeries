// processing --sketch=./bobsDance --run
// Particle part = positions.get(0);
ArrayList<Bob> bobs = new ArrayList<Bob>();
boolean isCreatingBob = false;
boolean isRecording = false;
boolean isDrawing = false;
boolean isCurved = true;
int bobsLimit = 20;
int backgroundColor = 0;
int bobsVerticesCount = 100;

void setup() {
  size(1024, 720, P2D);
  colorMode(HSB, 100);
  background(backgroundColor);
  initializeBobs();
  // frameRate(30);
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
      Bob randomBob = bobs.get(int(random(bobsSize)));
      PVector newPosition = randomBob.getRandomeVertice();
      bob.switchVerticesToNextPosition(int(newPosition.x), int(newPosition.y));
      bob.shakeVertices();
    }
    bob.drawShape(isCurved);
  }
  if (bobsSize > bobsLimit) {
    bobs.remove(bobsSize);
  }
  // press r
  record();
}

void initializeBobs(){
  int x = 2;
  int y = 2;
  for(int i = 0 ; i <= x; i++) {
    for(int j = 0 ; j <= y; j++) {
      bobs.add(0, new Bob(i * width / x, j * height / y, bobsVerticesCount));
    }
  }
}



/////////// CONTROLS
void mousePressed() {
  bobs.add(0, new Bob(mouseX, mouseY, bobsVerticesCount));
  int bobsSize = bobs.size() - 1;
  for (int i = bobsSize; i >= 0; i--) {
    Bob bob = bobs.get(i);
    bob.switchVerticesToNextPosition(mouseX, mouseY);
  }
  if (bobsSize > bobsLimit) {
    bobs.remove(bobsSize);
  }
}

void keyPressed() {
  if (key == 'b'|| key == 'B') {
    isCreatingBob = !isCreatingBob;
    println("isCreatingBob : " + isCreatingBob);
  }
  else if (key == 'c' || key == 'C') {
    isCurved = !isCurved;
    println("isCurved : " + isCurved);
  }
  else if (key == 'r' || key == 'R') {
    isRecording = !isRecording;
    println("isRecording : " + isRecording);
  }
  else if (key == ' ') {
    isDrawing =! isDrawing;
    println("isDrawing : " + isDrawing);
  }
}


///////// UTILS

void record() {
  if (isRecording) {
    // saveFrame("covid1_####.png");
    saveFrame("output/covid1_####"+year()+month()+day()+"-"+hour()+minute()+".png");
  }
}

void refreshCanvas(int backgroundColor) {
  background(backgroundColor);
/*  noStroke();
  fill(backgroundColor, 10);
  rect(-10, 10, width+10, height+10);*/
}



// // These are code fragments that show how to use an ArrayList.
// // They won't compile because they assume the existence of a Particle class.

// // Declaring the ArrayList, note the use of the syntax "<Particle>" to indicate
// // our intention to fill this ArrayList with Particle objects
// ArrayList<Particle> particles = new ArrayList<Particle>();

// // Objects can be added to an ArrayList with add()
// particles.add(new Particle());

// // Particles can be pulled out of an ArrayList with get()
// Particle part = particles.get(0);
// part.display();

// // The size() method returns the current number of items in the list
// int total = particles.size();
// println("The total number of particles is: " + total);

// // You can iterate over an ArrayList in two ways.
// // The first is by counting through the elements:
// for (int i = 0; i < particles.size(); i++) {
//   Particle part = particles.get(i);
//   part.display();
// }

// // The second is using an enhanced loop:
// for (Particle part : particles) {
//   part.display();
// }

// // You can delete particles from an ArrayList with remove()
// particles.remove(0);
// println(particles.size()); // Now one less!

// // If you are modifying an ArrayList during the loop,
// // then you cannot use the enhanced loop syntax.
// // In addition, when deleting in order to hit all elements,
// // you should loop through it backwards, as shown here:
// for (int i = particles.size() - 1; i >= 0; i--) {
//   Particle part = particles.get(i);
//   if (part.finished()) {
//     particles.remove(i);
//   }
// }
