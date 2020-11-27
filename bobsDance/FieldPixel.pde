public class FieldPixel {
  private boolean isOccupied = true;
  int percentage = 6;

  FieldPixel() {

    // this.isOccupied = random(0, 100) < percentage ? true : false;
    this.isOccupied = false;
    // this.isOccupied = true;

  }

  public Boolean isOccupied() {
    return isOccupied;
  }

  public void occupyFree() {
    this.isOccupied = !this.isOccupied;
  }

  public void free() {
    this.isOccupied = false;
  }

  public void occupy() {
    this.isOccupied = true;
  }

  public void randomlyOccupy() {
    this.isOccupied = random(0, 100) < percentage ? true : false;
  }
}
