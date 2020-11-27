// processing --sketch=./polynomialFamily --run

int scale = 50;
int revertYAxis = -1;

void setup(){
  size(500, 500);
  background(255);
  noFill();
  translate(width/2, height/2);
  line(0,-height/2 ,0, height/2);
  line(-width/2,0 ,width/2, 0);
  ellipse(0,0,scale * 2 ,scale * 2);

  strokeWeight(5);

  // le point rouge  1 + 0i
  stroke(255,0,0);
  float[] redPointCoordinates = polarToCartesian(1, 0);
  point(redPointCoordinates[0], redPointCoordinates[1]);

  // le point vert 1 + 1i
  stroke(0,255,0);
  float[] greenPointCoordinates = polarToCartesian(1, PI / 2);
  point(greenPointCoordinates[0], greenPointCoordinates[1]);


  // le point bleu 1 + 1i
  stroke(0,0,255);
  float[] bluePointCoordinates = polarToCartesian(1, PI);
  point(bluePointCoordinates[0], bluePointCoordinates[1]);

  // le point jaune 1 + 1i
  stroke(255,255,0);
  // float[] yellowPointCoordinates = polarToCartesian(1, PI + PI / 2);
  float[] yellowPointCoordinates = polarToCartesian(1, 3 * PI / 2  );
  point(yellowPointCoordinates[0], yellowPointCoordinates[1]);
}


void draw() {

}



// for i = 1:maxIterations
//   y = f(x0)
//   yprime = fprime(x0)
//
//   if abs(yprime) < epsilon  # Stop if the denominator is too small
//     break
//   end
//
//   global x1 = x0 - y/yprime  # Do Newton's computation
//
//   if abs(x1 - x0) <= tolerance  # Stop when the result is within the desired tolerance
//     global solutionFound = true
//     break
//   end
//
//   global x0 = x1  # Update x0 to start the process again
// end
//
// if solutionFound
//   println("Solution: ", x1)  # x1 is a solution within tolerance and maximum number of iterations
// else
//   println("Did not converge")  # Newton's method did not converge
// end

// f(x) = x^2 - 2  # The function whose root we are trying to find
// fprime(x) = 2 * x  # The derivative of the function
float computePolynom(float x){
  x = pow(x,2) - 2;
  return x;
}

float computeDerivatePolynom(float x){
  x = 2*x;
  return x;
}

float computeNewton(computePolynom, computeDerivatePolynom){
    float x0 = 1;
    float polynom = computePolynom(x0);
    float derivatedPolynom = computeDerivatePolynom(x0);
    float newtonComputed;
    int maxIterations = 20;
    float tolerance = pow(10, 7);
    float epsilon = 1/pow(10,14);
    boolean IsSolutionFound = false;
    float y = 0.;

  for (int i = 0; i < maxIterations; i++){
    y = computePolynom()
    if (abs(derivatedPolynom) < epsilon){
      return
    }

    if(abs())
  }
  return newtonComputed;
}



void mousePressed(){
  int positionX =  mouseX - width/2;
  int positionY = revertYAxis * (mouseY - height / 2);
  println("x : " + positionX + " y : " + positionY);
}

float[] polarToCartesian(float r, float angle) {
  float[] cartesianCoordinates = new float[2];
  cartesianCoordinates[0] = scale * r * cos(angle);
  cartesianCoordinates[1] = scale * revertYAxis * r * sin(angle);
  return cartesianCoordinates;
}

float[] cartesianToPolar(float x, float y) {
  float[] polarCoordinates = new float[2];
  polarCoordinates[0] = x;
  polarCoordinates[1] = y;
  return polarCoordinates;
}
