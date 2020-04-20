class Bob {
  PShape s;
  ArrayList<PVector> vertices = new ArrayList<PVector>();
  float hue, saturation, brightness;
  int entropy = 2;
  Boolean isSelfDeleting = true;

  Bob (int x, int y, int verticesNumber) {
    hue = random(100);
    saturation = (60 ) % 100;
    brightness = 100;
    for(int i = 0; i < verticesNumber; i++) {
      vertices.add(new PVector(x + random(-50,50), y + random(-50,50)));
    }
  }

  void buildShape(boolean isCurved) {
    int verticesSize = vertices.size();
    s = createShape();
    s.beginShape();
    s.stroke(hue, saturation, brightness);
    // s.noStroke();
    // s.fill(hue, saturation, brightness);
    s.noFill();
    for(int i = verticesSize  - 1; i >= 0; i--) {
      PVector vertice = vertices.get(i);
      if (isCurved){
        s.curveVertex(vertice.x, vertice.y);
      }
      else {
        s.vertex(vertice.x, vertice.y);
      }
    }
    s.endShape();
    // s.endShape(CLOSE);
  }

  void switchVerticesToNextPosition(int x, int y) {
    int verticesSize = vertices.size();
    int increment = 0;
    PVector vertice = new PVector();
    PVector nextVertice = new PVector();
    if (verticesSize > 2) {
      while(increment < verticesSize - 1) {
        vertice = vertices.get(increment);
        nextVertice = vertices.get(increment + 1);
        vertice.x = nextVertice.x + random(-entropy, entropy);
        vertice.y = nextVertice.y + random(-entropy, entropy);
        increment++;
      }
      nextVertice.x = x;
      nextVertice.y = y;
    }
    else {
      vertice = vertices.get(increment);
      vertice.x = x;
      vertice.y = y;
    }
  }

  int getVerticesSize(){
    return vertices.size();
  }

  PVector getVertice(){
    return vertices.get(0);
  }

  PVector getRandomeVertice() {
    int verticesSize = vertices.size();
    return vertices.get(int(random(verticesSize - 1)));
  }

  void addVertice(int x, int y) {
    vertices.add(new PVector(x, y));
    if (isSelfDeleting){
      int verticesSize = vertices.size() - 1;
      if (verticesSize > 100) {
        vertices.remove(0);
      }
    }
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
