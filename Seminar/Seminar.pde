int [] xs = new int[30];
int x = 400, y = 250;

void setup() {
  size(800, 500);
  for (int i = 0; i < 30; i++) xs[i] = (int) random(800);
}

void draw() {
  background(255);
  fill(255, 0, 0);
  for (int i = 0; i < 30; i++) {
    ellipse(xs[i], 300, 30, 30);
    xs[i] += 2;
  }
  if (x > mouseX) x--;
  if (x < mouseX) x++;
  if (y > mouseY) y--;
  if (y < mouseY) y++;
  fill(0);
  ellipse(x, y, 20, 20);
}
