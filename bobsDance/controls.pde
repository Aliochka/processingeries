public void mousePressed() {
  // bobs.welcomeExclude(mouseX, mouseY);
  for(int i = 0; i < bobsNumber; i++) {
    Bobs[i].welcomeExclude(mouseX, mouseY);
  }
  // PVector position = new PVector(mouseX, mouseY);
  field.occupyFree(mouseX, mouseY);


}

void keyPressed() {
  // add help message here
  if (key == 'h'|| key == 'H') {
    println("for isCreatingBob press : b");
    println("for isCurved press : c");
    println("for isRecording press : r");
    println("for showBobs press : e");
    println("for isDrawing press : space");
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
  else if (key == ' ') {
    isDrawing =! isDrawing;
    println("isDrawing : " + isDrawing);
  }
}
