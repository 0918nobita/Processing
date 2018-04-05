void setup() {
  size(800, 600);
  quad(158, 55, 199, 14, 392, 66, 351, 107);
  triangle(347, 54, 392, 9, 392, 66);
  triangle(158, 55, 290, 91, 290, 112);
  rect(180, 60, 220, 40);
  arc(90, 60, 80, 80, 0, HALF_PI);
  arc(190, 60, 80, 80, 0, PI + HALF_PI);
  arc(290, 60, 80, 80, PI, TWO_PI + HALF_PI);
  arc(390, 60, 80, 80, QUARTER_PI, PI + QUARTER_PI);
}

void draw() {
  if (mousePressed) fill(0);
  else fill(255);
  ellipse(mouseX, mouseY, 80, 80);
}
