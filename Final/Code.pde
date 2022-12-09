// The set of numbers for the obstacles.
Obstacle[] ob;

int num = 20;
// The size of the circle.
int bsize = 20;


void setup () {

  // The size of the display window.
  size(1000, 700);

  ob = new Obstacle[num];

  for (int i = 0; i < num; i++) {

    ob[i] = new Obstacle();
  }
}

// The location of the circle.
int xpos;
int ypos;

void draw () {
  // The background colour of the display window.
  background(#030E81);

  for (int i = 0; i < num; i++) {
    ob[i].display();
    ob[i].collision(xpos, ypos);
  }

  // The ball colour.
  fill(#FA7E0A);
  // The ball location and the size.
  ellipse(xpos, ypos, 30, 30);
}

// The speed of the ball.
int speed = 30;

// The controls of the ball by the user.
void keyPressed () {

  if (keyPressed) {
    // If the user press 'a', then the ball turn left.
    if (key == 'a') {
      xpos -= speed;
      // If the user press 's', then the ball turn right.
    } else if (key == 'd') {
      xpos += speed;
      // If the user press 'w', then the ball goes up.
    } else if (key == 'w') {
      ypos -= speed;
      // If the user press 's', then the ball goes down.
    } else if (key == 's') {
      ypos += speed;
    }
  }
}

// Creation of the obstacles and the collisions.
class Obstacle {

  // Random locations for the obstacles.
  float x = random(200, width);
  float y = random(height);
  // Random widths for the rectangles.
  float w = random(20, 100);
  // The colour of the obstacles.
  int fval = 0;

  // Random speed for the obstacles.
  int speed = int(random(1, 5));


  Obstacle() {
  }


  void display () {

    fill(fval);

    // Moves the whole background.
    x -= speed;
    if (x < 0) {
      x = width;
    }
    // Location and dimenstions of the obstacles.
    rect(x, y, w, w);
  }

  // Checks if the ball collide with the obstacles.
  void collision(float xp, float yp) {

    // Checks if the ball will hit the obstacles.
    if (dist(xp, yp, x, y) < (w/bsize)) {

      fval = 0;
      // Display the output screen.
      background(0);
      textSize(72);
      fill(255);
      text("GAME OVER", width/2-170, height/2);
      noLoop();
    }
  }
}
