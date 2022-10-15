// Global Variables.
int cols = 10;
int rows = 10;

// Variables for grid spacing.
int stepx;
int stepy;

// Setup the size of the canvas.
void setup() {
  // The size of the window.
  size(500, 500);

  // Setup the stepsizes.
  stepx = width / cols;
  stepy = height / rows;

  // The speed for the rectangles to change.
  frameRate(0.5);
}

// Creating the grid for the rectangles.
void draw() {
  // Setting the background color to white.
  background(255);

  // Making the grid.
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {

      // Variables for the x, y positions.
      float x = i*stepx;
      float y = j*stepy;

      // Create a number between 0 and 10.
      float randomVariable = random(10);
      // The line sizes between the rectangles.
      strokeWeight(random(4));

      // If the number is greater than 5, then draw a colored rectangle.
      if (randomVariable > 5) {
        fill(random(255), random(255), random(255));
        rect(x, y, stepx, stepy);
      }

      // If the number is less than 5, then draw a colored rectangle with rounded vertices.
      else {
        fill(random(255), random(255), random(255));
        rect(x, y, stepx, stepy, 7);
        // Making the lines between the rectangles.
        line(x, y, x, y + stepy);
      }
      // Drawing and filling the corner circles.
      fill(0);
      ellipse(x, y, 8, 8);
    }
  }
}
