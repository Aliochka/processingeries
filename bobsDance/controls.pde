public void mousePressed() {
  // bobs.welcomeExclude(mouseX, mouseY);
  for(int i = 0; i < bobsNumber; i++) {
    Bobs[i].welcomeExclude(mouseX, mouseY);
  }
  // PVector position = new PVector(mouseX, mouseY);
  // field.occupyFree(mouseX, mouseY);
  println(field.isOccupied(new PVector(mouseX, mouseY)));
  println(field.isOccupied(mouseX, mouseY));
}

void keyPressed() {
  // add help message here
  if (key == 'h'|| key == 'H') {
    printHelp();
  }
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
  else if (key == 'e' || key == 'E') {
    showBobs = !showBobs;
    println("showBobs : " + showBobs);
  }
  else if (key == 'n' || key == 'N') {
    field = new Field(4);
    // frameRate(20);
    for(int i = 0; i < bobsNumber; i++) {
      Bobs[i] = new Bobs(int(random(width / 4, 3 * width / 4)), int(random(width / 4, 3 * width / 4)), 1);
    }
    println("newCanvas ! ");
  }
  else if (key == ' ') {
    isDrawing =! isDrawing;
    println("isDrawing : " + isDrawing);
  }
}

void printHelp(){
  println("    ***    ");
  println("for help press : h");
  println("for isCreatingBob press : b");
  println("for isCurved press : c");
  println("for isRecording press : r");
  println("for showBobs press : e");
  println("for isDrawing press : space");
  println("for newCanvas press : n ");
  println("    ***    ");
}
