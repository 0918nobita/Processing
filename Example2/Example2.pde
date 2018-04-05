void setup() {
  size(300, 300);
}

float angle = 0.0;

void draw() {
  translate(mouseX, mouseY);
  rotate(angle);
  rect(-15, -15, 30, 30);
  angle += 0.1;
}
