boolean isPressed = false;

int r = 0, g = 0, b = 0;

void setup() {
  size(400, 400);
}

void draw() {
  background(255, 255, 255);
  if (isPressed) packman(mouseX, mouseY, 60, r, g, b);
}

void packman(float x, float y, float w, float r, float g, float b) {
  noStroke();
  fill(r, g, b);
  arc(x, y, w, w, radians(30), radians(330));
}

void mousePressed() {
  isPressed = true;
  r = (int) random(255);
  g = (int) random(255);
  b = (int) random(255);
}

void mouseReleased() {
  isPressed = false;
}
