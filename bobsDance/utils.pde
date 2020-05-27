void record() {
  // saveFrame("covid1_####.png");
  saveFrame("output/covid1_"+year()+month()+day()+"-"+hour()+minute()+second()+"#####.png");
}

void refreshCanvas(int backgroundColor) {
  // background(backgroundColor);
/*  noStroke(); */
  fill(backgroundColor, 10);
  rect(-10, -10, width+10, height+10);
}
