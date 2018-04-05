void setup() {
  size(300, 300);
}

boolean mode = false;

void draw() {
  if (mode) translate(mouseX, mouseY);
  else rotate(mouseX / 100.0);
  rect(0, 0, 30, 30);
}

void keyPressed() {
  if (key == ' ') mode = !mode; 
}
