class Field {
  int screenSize;
  int minimizer = 4;
  int pixelWidthNumber = width / minimizer + 1;
  int pixelHeightNumber = height / minimizer + 1;
  int pixelRatio = width / height;
  int pixelNumber = int(pixelWidthNumber * pixelHeightNumber);
  private FieldPixel[][] fieldPixels = new FieldPixel[pixelWidthNumber][pixelHeightNumber];

  Field() {
    for (int x = 0 ; x < pixelWidthNumber ; x++) {
      for (int y = 0 ; y < pixelHeightNumber ; y++) {
        fieldPixels[x][y] = new FieldPixel();
      }
    }

    println("hello happy Field : " + pixelNumber + " pixels.");
  }

  public Boolean isOccupied(PVector position) {
    position = mapCoordToPixel(position);
    return this.fieldPixels[int(position.x)][int(position.y)].isOccupied();
  }

  public Boolean _isOccupied(int x, int y) {
    return this.fieldPixels[x][y].isOccupied();
  }

  public void occupyFree(PVector position) {
    position = mapCoordToPixel(position);
    this.fieldPixels[int(position.x)][int(position.y)].occupyFree();
  }

  public void occupyFree(int x, int y) {
    int[] position = mapCoordToPixel(x, y);
    this.fieldPixels[position[0]][position[1]].occupyFree();
  }

  PVector mapCoordToPixel(PVector position){
    println("1 -x : " + position.x + " | y : " + position.y);
    position.x = map(position.x, 0, width, 0, pixelWidthNumber);
    position.y = map(position.y, 0, height, 0, pixelHeightNumber);
    println("2 -x : " + position.x + " | y : " + position.y);
    return position;
  }

  int[] mapCoordToPixel(int x, int y){
    int[] position = new int[2];
    position[0] = int(x / minimizer);
    position[1] = int(y/ minimizer);
    position[0] = position[0] <= 0 ?
      0 : position[0] >= pixelWidthNumber - 1 ?
        pixelWidthNumber - 1 : position[0];
    position[1] = position[1] <= 0 ?
      0 : position[1] >= pixelHeightNumber - 1 ?
        pixelHeightNumber - 1 : position[1];
    return position;
  }

  int convertPositionToResolution(int x, int y) {
    int currentPosition = int((x / minimizer) * (y / minimizer));
    int position = currentPosition <= 0 ?
      0 : currentPosition >= pixelNumber - 1?
        pixelNumber - 1 : currentPosition;
    return position;
  }

  void drawFieldPixel(int x, int y) {
    fill(25,65,10);
    ellipse(x, y, 50, 50);
  }

  int countOccupyNeighbour(int x, int y) {
    int aliveNeighbourCount = 0;
    if (y > 0) {
      if (x > 0){
        // en haut à gauche
        if(this.fieldPixels[x - 1][y - 1].isOccupied()){
          aliveNeighbourCount++;
        }
      }
      // en haut
      if(this.fieldPixels[x][y - 1].isOccupied()){
        aliveNeighbourCount++;
      }
      if (x < pixelWidthNumber - 1) {
        // en haut à droite
        if(this.fieldPixels[x + 1][y - 1].isOccupied()){
          aliveNeighbourCount++;
        }
      }
    }
    if (x > 0) {
      // gauche
      if(this.fieldPixels[x - 1][y].isOccupied()){
        aliveNeighbourCount++;
      }
    }
    // lui-même
    // if(this.fieldPixels[x][y].isOccupied()){
    //   aliveNeighbourCount++;
    // }
    if (x < pixelWidthNumber - 1) {
      // droite
      if(this.fieldPixels[x + 1][y].isOccupied()){
        aliveNeighbourCount++;
      }
    }
    if (y < pixelHeightNumber -1) {
      if (x > 0){
        // en bas à gauche
        if(this.fieldPixels[x - 1][y + 1].isOccupied()){
          aliveNeighbourCount++;
        }
      }
      // en bas
      if(this.fieldPixels[x][y + 1].isOccupied()){
        aliveNeighbourCount++;
      }
      if (x < pixelWidthNumber - 1){
        // en bas à droite
        if(this.fieldPixels[x + 1][y + 1].isOccupied()){
          aliveNeighbourCount++;
        }
      }
    }
    return aliveNeighbourCount;
  }

  void gameOfLife(int x, int y){
    if (this.fieldPixels[x][y].isOccupied()) {
      if (this.countOccupyNeighbour(x, y) < 2 | this.countOccupyNeighbour(x, y) > 3) {
        // any alive cell < 2 alive neighbour die
        // neighbour > 3 friend, die
        this.fieldPixels[x][y].occupyFree();
      }
      // 2 or 3 neighbour, live
    }
    else {
      if(this.countOccupyNeighbour(x, y) == 3){
        // dead with 3 alive, live
        this.fieldPixels[x][y].occupyFree();
      }
    }
  }

  public void drawField(){
    for(int x = 0; x < pixelWidthNumber; x++) {
      for(int y = 0; y < pixelHeightNumber; y++) {
        this.gameOfLife(x, y);
        boolean isOccupied = this._isOccupied(x, y);
        if (isDrawing) {
          this.fieldPixels[x][y].randomlyOccupy();
        }
        else {
          if (isOccupied) {
            fill(0);
          }
          else {
            fill(100);
          }
          noStroke();
          rect(x  * minimizer, y * minimizer, minimizer * pixelRatio, minimizer * pixelRatio);
        }

      }
    }
  }
}
