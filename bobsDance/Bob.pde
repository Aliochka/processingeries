class Bob {
  PShape s;
  PVector[] vertices;
  float hue, saturation, brightness;
  int entropy = 2;

  Bob (int x, int y, int verticesNumber) {
    hue = random(100);
    saturation = (60 ) % 100;
    brightness = 100;
    vertices = new PVector[verticesNumber];
    for(int i = 0; i < verticesNumber; i++) {
      vertices[i] = new PVector(x + random(-100,100), y + random(-100,100));
    }
  }

  void buildShape(boolean isCurved) {
    int verticesSize = vertices.length;
    s = createShape();
    s.beginShape();
    s.stroke(hue, saturation, brightness);
    // s.noStroke();
    // s.fill(hue, saturation, brightness);
    s.noFill();
    for(int i = verticesSize  - 1; i >= 0; i--) {
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
    int verticesSize = vertices.length;
    int increment = 0;
    PVector vertice = new PVector();
    PVector nextVertice = new PVector();
    if (verticesSize > 2) {
      while(increment < verticesSize - 1) {
        vertice = vertices[increment];
        nextVertice = vertices[increment + 1];
        vertice.x = nextVertice.x;
        vertice.y = nextVertice.y;
        increment++;
      }
      nextVertice.x = x;
      nextVertice.y = y;
    }
    else {
      vertice = vertices[increment];
      vertice.x = x;
      vertice.y = y;
    }
  }

  int getVerticesSize(){
    return vertices.length;
  }

  PVector getVertice(){
    return vertices[0];
  }

  PVector getRandomeVertice() {
    int verticesSize = vertices.length;
    return vertices[int(random(verticesSize - 1))];
  }

  void shakeVertices() {
    for(PVector vertice : vertices) {
      vertice.y += random(-entropy, entropy);
      vertice.x += random(-entropy, entropy);
    }
  }

  void drawShape(boolean isCurved) {
    buildShape(isCurved);
    shape(s, 0, 0);
  }
}
