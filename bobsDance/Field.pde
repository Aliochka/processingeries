class Field {
  FieldPixel[] fieldPixels;
  int screenSize;

  Field() {
    screenSize = width * height;
    fieldPixels = new FieldPixel[screenSize];
    for (int position = 0 ; position < screenSize ; position++) {
      fieldPixels[position] = new FieldPixel();
    }
  }

  Boolean isOccupied(int position) {
    return fieldPixels[position].isOccupied();
  }

  void occupyFree(int position) {
    fieldPixels[position].occupyFree();
  }

  void drawField(){
    for(int position = 0; position < screenSize; position++) {
      boolean isOccupied = isOccupied(position);
      if (isOccupied) {
        stroke(100);
      }
      else {
        stroke(0);
      }
      point(position % (width + 1), position / (height + 1));
    }
  }
}
