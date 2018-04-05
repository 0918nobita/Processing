PImage img;
PFont font;

void setup() {
  size(540, 540);
  img = loadImage(sketchPath() + "/../github.png");
  font = createFont("Arial", 32);
  textFont(font);
}

void draw() {
  background(0);
  image(img, 10, 10);
  textSize(32);
  text("That's one small step for man...", 25, 60);
  textSize(16);
  text("That's one small step for man...", 27, 90);
}
