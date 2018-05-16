int flag = 0;

void setup() {
  size(300, 300);
  background(255, 0, 0);
}

void draw() {
  switch (flag) {
    case 0:
      background(255, 0, 0);
      break;
    case 1:
      background(0, 255, 0);
      break;
    default:
      background(0, 0, 255);
      break;
  }
  println("flag: " + flag);
}

void mousePressed() {
  flag++;
  if (flag == 3) flag = 0;
}
