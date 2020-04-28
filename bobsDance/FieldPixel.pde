public class FieldPixel {
  private boolean isOccupied = true;

  FieldPixel() {
    this.isOccupied = false;
    // this.isOccupied = true;

  }

  public Boolean isOccupied() {
    return isOccupied;
  }

  public void occupyFree() {
    this.isOccupied = !this.isOccupied;
  }

  public void occupy() {
    this.isOccupied = false;
  }
}
