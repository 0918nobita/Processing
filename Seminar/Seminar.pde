int []  xs = new int[30],
       vec = new int[30];

int x = 400,
    y = 250;

boolean isCrashing = false;

void setup() {
  size(800, 500);
  
  for (int i = 0; i < 30; i++) {
    xs[i] = (int) random(800);
    vec[i] = (int) random(-3, 3);
  }
}

void draw() {
  if (isCrashing) background(255, 255, 33);
  else background(255);
  
  isCrashing = false;

  fill(255, 0, 0);

  for (int i = 0; i < 30; i++) {
    ellipse(xs[i], 300, 30, 30);
    xs[i] += vec[i];
    
    if (xs[i] < 0) xs[i] = width;
    
    if (xs[i] > width) xs[i] = 0;

    if (!isCrashing && crash(x, y, xs[i], 300)) isCrashing = true;
  }
  
  if (x > mouseX) x--;
  if (x < mouseX) x++;
  if (y > mouseY) y--;
  if (y < mouseY) y++;
  
  fill(0);
  ellipse(x, y, 20, 20);
}

boolean crash(int x1, int y1, int x2, int y2) {
  return (sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2)) < 20);
}
