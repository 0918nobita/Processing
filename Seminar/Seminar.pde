int flag = 0,
    r = 0,
    g = 0,
    b = 0,
    depth = 0; // 色の濃度

void setup() {
  size(300, 300);
}

void draw() {
  depth = (int) (mouseY * 1.0 / height * 255);

  switch (flag) {
    case 0:
      r = depth; g = 0; b = 0;
      break;
    case 1:
      r = 0; g = depth; b = 0;
      break;
    default:
      r = 0; g = 0; b = depth;
      break;
  }

  background(r, g, b);
}

void mousePressed() {
  flag++;
  if (flag == 3) flag = 0;
}
