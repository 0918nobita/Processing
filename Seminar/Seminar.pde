int x = 0;

void setup() {
  size(400, 300);  
}

void draw() {
  background(255, 255, 255);
  if (x < width) x++;
  fill(255, 0, 0);
  ellipse(x, 150, 40, 40);
}
