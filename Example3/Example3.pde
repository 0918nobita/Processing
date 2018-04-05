PImage img;

void setup() {
  size(540, 540);
  img = loadImage(sketchPath() + "/../github.png");
}

void draw() {
  image(img, 10, 10);
}
