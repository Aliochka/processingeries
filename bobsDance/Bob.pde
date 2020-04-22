class Bob {
  PShape s;
  PVector[] vertices;
  float hue, saturation, brightness;
  int entropy = 2;
  int verticesNumber;
  Field field;

  Bob (int x, int y, int verticesNumber, Field field) {
    hue = random(100);
    saturation = (60 ) % 100;
    brightness = 100;
    this.field = field;
    this.verticesNumber = verticesNumber;
    vertices = new PVector[verticesNumber];
    for(int i = 0; i < verticesNumber; i++) {
      vertices[i] = new PVector(x + random(-100,100), y + random(-100,100));
    }
  }

  void buildShape(boolean isCurved) {
    s = createShape();
    s.beginShape();
    s.stroke(hue, saturation, brightness);
    // s.noStroke();
    // s.fill(hue, saturation, brightness);
    s.noFill();
    for(int i = 0; i < verticesNumber; i++) {
      PVector vertice = vertices[i];
      if (isCurved){
        s.curveVertex(vertice.x, vertice.y);
      }
      else {
        s.vertex(vertice.x, vertice.y);
      }
    }
    // s.endShape();
    s.endShape(CLOSE);
  }

  void switchVerticesToNextPosition(int x, int y) {
    int position = 0;
    PVector vertice = new PVector();
    PVector nextVertice = new PVector();
    if (verticesNumber > 2) {
      while(verticesNumber - position > 1) {
        vertice = vertices[position];
        nextVertice = vertices[position + 1];
        vertice.x = nextVertice.x;
        vertice.y = nextVertice.y;
        field.occupyFree(int(vertice.x * vertice.y));
        position++;
      }
      nextVertice.x = x;
      nextVertice.y = y;
    }
    else {
      vertice = vertices[position];
      vertice.x = x;
      vertice.y = y;
      field.occupyFree(int(vertice.x * vertice.y));
    }
  }

  int getVerticesSize() {
    return vertices.length;
  }

  PVector getVertice(int position) {
    return vertices[position];
  }

  PVector getRandomeVertice() {
    return vertices[int(random(verticesNumber - 1))];
  }

  void shakeVertices() {
    for(PVector vertice : vertices) {
      vertice.y += random(-entropy, entropy);
      vertice.x += random(-entropy, entropy);
    }
  }

  void switchToNextBob(Bob nextBob) {
    for(int i = 0 ; i < verticesNumber; i++) {
      PVector nextBobVertice = nextBob.getVertice(i);
      PVector bobVertice = this.getVertice(i);
      bobVertice.x = nextBobVertice.x;
      bobVertice.y = nextBobVertice.y;
    }
  }

  void drawShape(boolean isCurved) {
    buildShape(isCurved);
    shape(s, 0, 0);
  }
}
