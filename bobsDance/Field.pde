class Field {
  int screenSize;
  int minimizer;
  int pixelWidthNumber;
  int pixelHeightNumber;
  int pixelRatio;
  int pixelNumber;
  private FieldPixel[][] fieldPixels;

  Field(int minimizer) {
    this.minimizer = minimizer;
    this.pixelWidthNumber = width / minimizer + 1;
    this.pixelHeightNumber = height / minimizer + 1;
    this.pixelRatio = width / height;
    this.pixelNumber = int(pixelWidthNumber * pixelHeightNumber);
    this.fieldPixels = new FieldPixel[pixelWidthNumber][pixelHeightNumber];
    for (int x = 0 ; x < this.pixelWidthNumber ; x++) {
      for (int y = 0 ; y <this.pixelHeightNumber ; y++) {
        fieldPixels[x][y] = new FieldPixel();
      }
    }
    println("hello happy Field : " + pixelNumber + " pixels.");
  }

  public Boolean isOccupied(PVector position) {
    int[] mappedPosition = mapCoordToPixel(int(position.x), int(position.y));
    return this.fieldPixels[mappedPosition[0]][mappedPosition[1]].isOccupied();
  }

  public Boolean isOccupied(int x, int y) {
    int[] mappedPosition = mapCoordToPixel(x, y);
    return this.fieldPixels[mappedPosition[0]][mappedPosition[1]].isOccupied();
  }

  public Boolean _isOccupied(int x, int y) {
    return this.fieldPixels[x][y].isOccupied();
  }

  public void occupyFree(PVector position) {
    int[] mappedPosition = mapCoordToPixel(int(position.x), int(position.y));
    this.fieldPixels[mappedPosition[0]][mappedPosition[1]].occupyFree();
  }

  public void occupyFree(int x, int y) {
    int[] mappedPosition = mapCoordToPixel(x, y);
    this.fieldPixels[mappedPosition[0]][mappedPosition[1]].occupyFree();
  }

  public void occupy(int x, int y) {
    int[] mappedPosition = mapCoordToPixel(x, y);
    this.fieldPixels[mappedPosition[0]][mappedPosition[1]].occupy();
  }

  int[] mapCoordToPixel(int x, int y){
    int[] mappedPosition = new int[2];
    mappedPosition[0] = int(x / minimizer);
    mappedPosition[1] = int(y / minimizer);
    mappedPosition[0] = mappedPosition[0] <= 0 ?
      0 : mappedPosition[0] >= pixelWidthNumber - 1 ?
        pixelWidthNumber - 1 : mappedPosition[0];
    mappedPosition[1] = mappedPosition[1] <= 0 ?
      0 : mappedPosition[1] >= pixelHeightNumber - 1 ?
        pixelHeightNumber - 1 : mappedPosition[1];
    return mappedPosition;
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
        boolean isOccupied = this._isOccupied(x, y);
        if (isOccupied) {
          fill(0,10);
        }
        else {
          fill(100,10);
        }
        noStroke();
        rect(x  * minimizer, y * minimizer, minimizer * pixelRatio, minimizer * pixelRatio);
      }
    }
  }
}
