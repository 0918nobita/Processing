int x = 0,
    y = 0;

void setup() {
  size(400, 400);
  fill(255, 0, 0);
}

void draw() {
  background(255, 255, 255);

  if (mouseX > x) {
    x++;
  } else if (mouseX < x) {
    x--;
  }

  if (mouseY > y) {
    y++;
  } else if (mouseY < y) {
    y--;
  }
  
  ellipse(x, y, 10, 10);
}
