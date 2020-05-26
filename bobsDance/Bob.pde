class Bob {
  PShape s;
  Agent[] vertices;
  float hue, saturation, brightness;
  int verticesNumber;

  Bob () {
    hue = random(100);
    saturation = (60 ) % 100;
    brightness = 100;
    verticesNumber = int(random(3, 100));
  }

  Bob (int a, int b) {
    this();
    this.verticesNumber = verticesNumber;
    vertices = new Agent[verticesNumber];
    int rayon = 2;
    for(int i = 0; i < verticesNumber; i++) {
      // start circle
      float x = a + rayon * cos(i);
      float y = b + rayon * sin(i);
      vertices[i] = new Agent(new PVector(x, y));

      // random start position
      // vertices[i] = new Agent(new PVector(x + random(-100,100), y + random(-100,100)));
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
      Agent vertice = vertices[i];
      if (isCurved){
        s.curveVertex(vertice.position.x, vertice.position.y);
      }
      else {
        s.vertex(vertice.position.x, vertice.position.y);
      }
    }
    // s.endShape();
    s.endShape(CLOSE);
  }

  void moveApproximativelyToNextPosition(float x, float y) {
    int position = 0;
    Agent vertice = new Agent();
    Agent nextVertice = new Agent();
    if (verticesNumber > 2) {
      while(verticesNumber - position > 1) {
        vertice = vertices[position];
        nextVertice = vertices[position + 1];
        vertice.position.x = nextVertice.position.x;
        vertice.position.y = nextVertice.position.y;
        position++;
      }
      nextVertice.position.x = x;
      nextVertice.position.y = y;
    }
    else {
      vertice = vertices[position];
      vertice.position.x = x;
      vertice.position.y = y;
    }
  }

  int getVerticesSize() {
    return vertices.length;
  }

  Agent getVertice(int verticeNumber) {
    return vertices[verticeNumber];
  }

  Agent getVerticeFromOtherBob(int verticeNumber) {
    if (verticesNumber >= vertices.length) {
        return vertices[int(random(vertices.length))];
    }
    return vertices[verticeNumber];
  }

  Agent getRandomVertice() {
    return vertices[int(random(verticesNumber - 1))];
  }

  void switchToNextBob(Bob nextBob) {
    for(int i = 0 ; i < verticesNumber - 1; i++) {
      Agent nextBobVertice = nextBob.getVerticeFromOtherBob(i);
      Agent bobVertice = this.getVertice(i);
      bobVertice.position.x = nextBobVertice.position.x;
      bobVertice.position.y = nextBobVertice.position.y;
    }
  }

  void moveVertices(){
    for(Agent vertice : vertices) {
      vertice.updatePosition();
      // vertice.x += 1;
      // vertice.y += 1;
      // if(vertice.x > width) {
      //   vertice.x = 0;
      // }
      // if(vertice.y > height) {
      //   vertice.y = 0;
      // }
    }
  }

  void drawShape(boolean isCurved) {
    if (isDrawing) {
      moveVertices();
    }
    if (showBobs) {
      buildShape(isCurved);
      shape(s, 0, 0);
    }
  }
}
