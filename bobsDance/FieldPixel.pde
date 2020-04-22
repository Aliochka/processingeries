class FieldPixel {
  boolean isOccupied;

  FieldPixel() {
    isOccupied = false;
  }

  Boolean isOccupied() {
    return isOccupied;
  }

  void occupyFree() {
    isOccupied = !isOccupied;
  }
}
