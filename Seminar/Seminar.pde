int x = 0,
    y = 100;

void setup() {
  size(600, 300);  
}

void draw() {
  background(255, 255, 255);
  fill(111, 160, 255);
  rect(x, y, 100, 50);
  rect(x - 50, y + 50, 200, 50);
  fill(71, 72, 75);
  ellipse(x, y + 100, 50, 50);
  ellipse(x + 100, y + 100, 50, 50);
  if (x < width) x++;
}
