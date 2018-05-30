void setup() {
  size(400, 400);
}

void draw() {
  background(255, 255, 255);
  packman(mouseX, mouseY, 60, 255, 255, 40);
}

void packman(float x, float y, float w, float r, float g, float b) {
  noStroke();
  fill(r, g, b);
  for (int i = -70; i <= 70; i += 70)
    arc(x + i, y, w, w, radians(30), radians(330));
}
