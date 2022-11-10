// Reference from DATT 2400.
// https://github.com/atarilover123/DATT-2400-CreativeCoding-I/blob/main/Week_5_AnimatedLoop/Week_5_AnimatedLoop.pde
// https://github.com/atarilover123/DATT-2400-CreativeCoding-I/blob/main/Week_6/4_circularfractalpattern/circularfractalpattern.pde
// Dan Tapper

// Setup the size of the canvas.
void setup () {

  // The size of the window.
  size(1000, 1000);

  // Status of the circle.
  noFill();
  stroke(0, 0, 255);
  strokeWeight(3);
  ellipseMode(CENTER);
}
// Variables.
float rt = 0;
float sv;

void draw () {
  // Setting the background color to black.
  background(0);

  for (int s = 200; s > 0; s = s - 10) {

    float m = map(sin(frameCount*0.005), -1, 1, 0.1, 0.99);

    // Pushes the current transformation matrix onto the matrix stack
    pushMatrix();
    // Moves the whole circle to the center of the canvas
    translate(width / 2, height / 2);
    // Making the edges of the circle colours.
    fill(255, 255 - s, 255 - s);
    // Making the circles a little bit small.
    scale(0.05);
    fractal(width, m);
    // Rotate the circle originally.
    rotate(radians(frameCount*0.09));
    ellipse(0, 0, s, s);
    // Pops the current transformation matrix off the matrix stack.
    popMatrix();
  }
  // Help to stop the code when a full rotation happen.
  if (radians(rt) >= TWO_PI & sv >= 0) {
    noLoop();
  }
  // Save series of images.
  saveFrame("####_out.png");
}

// Focus on the circle to form a spiral.
void fractal(float s, float cutoff) {

  s *= cutoff;
  if (s > 1) {

    // Pushes the current transformation matrix onto the matrix stack
    pushMatrix();
    // Rotates the circles into a spiral.
    rotate(radians(s));
    ellipse(s, s, s*4, s*4);
    // Pops the current transformation matrix off the matrix stack.
    popMatrix();

    fractal(s, cutoff);
  }
}
