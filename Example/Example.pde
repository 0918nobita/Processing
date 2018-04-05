void setup() {
  size(800, 600);
  background(0);
  fill(204);
  quad(158, 55, 199, 14, 392, 66, 351, 107);
  triangle(347, 54, 392, 9, 392, 66);
  triangle(158, 55, 290, 91, 290, 112);
  fill(153);
  rect(330, 70, 370, 40);
  fill(102);
  arc(90, 200, 80, 80, 0, HALF_PI);
  arc(190, 200, 80, 80, 0, PI + HALF_PI);
  arc(290, 200, 80, 80, PI, TWO_PI + HALF_PI);
  arc(390, 200, 80, 80, QUARTER_PI, PI + QUARTER_PI);
  ellipseMode(CORNER);
  ellipse(100, 60, 80, 80);
}

int red = 0, green = 0, blue = 0;

void draw() {
  if (mousePressed) {
    fill(0);
    for (int i = 0; i <= 3; i++) switch ((int)random(3)) {
      case 0:
        red++;
        if (red > 255) red = 0;
        break;
      case 1:
        green++;
        if (green > 255) green = 0;
        break;
      case 2:
        blue++;
        if (blue > 255) blue = 0;
        break;
    }
    fill(red, green, blue);
  } else fill(255);
  ellipse(mouseX, mouseY, 80, 80);
}
