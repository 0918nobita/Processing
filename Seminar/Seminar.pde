void setup() {
  size(300, 300);
  noStroke();
}

void draw() {
  if (mouseY < 150) {
    if (mouseX < 100) {
      fill(255, 0, 0);
    } else if (mouseX >= 100 && mouseX < 200) {
      fill(0, 255, 0);
    } else {
      fill(0, 0, 255);
    }
  } else {
    fill(255, 255, 255);
  }
  ellipse(mouseX, mouseY, 10, 10);
}
