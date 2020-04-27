public void mousePressed() {
  // bobs.welcomeExclude(mouseX, mouseY);
  // PVector position = new PVector(mouseX, mouseY);
  field.occupyFree(mouseX, mouseY);


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
