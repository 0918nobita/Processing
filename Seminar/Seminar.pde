float theta = PI / 3;
int x = 0,
    y = 0;

void setup() {
  size(600, 300); 
}

void draw() {
  background(255, 255, 255);
  fill(255, 0, 0);
  ellipse(x, y, 20, 20);
  
  // 移動
  if (x < width) {
    x += 3 * cos(theta);
    y += 3 * sin(theta);
  }
  
  // 跳ね返り
  if (y < 0|| y > height) theta = 2 * PI - theta;
}
