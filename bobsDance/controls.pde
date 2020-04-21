void mousePressed() {
  bobs.add(0, new Bob(mouseX, mouseY, bobsVerticesCount));
  int bobsSize = bobs.size() - 1;
  // for (int i = bobsSize; i >= 0; i--) {
  //   Bob bob = bobs.get(i);
  //   bob.switchVerticesToNextPosition(mouseX, mouseY);
  // }
  if (bobsSize >= bobsLimit) {
    println(bobsLimit);
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
