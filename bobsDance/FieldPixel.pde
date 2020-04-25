public class FieldPixel {
  private boolean isOccupied = true;

  FieldPixel() {
    // this.isOccupied = random(0,5) > 2 ? false : true;
    this.isOccupied = true;

  }

  public Boolean isOccupied() {
    return isOccupied;
  }

  public void occupyFree() {
    this.isOccupied = !this.isOccupied;
  }
}
