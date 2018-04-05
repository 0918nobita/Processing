void setup() {
  size(800, 600);
  quad(158, 55, 199, 14, 392, 66, 351, 107);
  triangle(347, 54, 392, 9, 392, 66);
  triangle(158, 55, 290, 91, 290, 112);
}

void draw() {
  if (mousePressed) fill(0);
  else fill(255);
  ellipse(mouseX, mouseY, 80, 80);
}
