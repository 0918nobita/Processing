float afterX = 0,
      afterY = 0; // 残像の X, Y 座標

void setup() {
  size(400, 400);
}

void draw() {
  background(255, 255, 255);
  packman(afterX, afterY, 60, 0, 0, 0);
  packman(mouseX, mouseY, 60, 255, 255, 40);
}

void packman(float x, float y, float w, float r, float g, float b) {
  noStroke();
  fill(r, g, b);
  arc(x, y, w, w, radians(30), radians(330));
  afterX = x;
  afterY = y;
}
