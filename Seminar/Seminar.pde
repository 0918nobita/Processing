boolean showSplit = false;

int startTime,
    lastTime = 0;

void setup() {
  size(500, 300);
  textSize(150);
  startTime = getCurrentTime();
}

void draw() {
  background(255, 255, 255);
  if (!showSplit) {
    fill(0, 0, 255);
    text(nf(getCurrentTime() - startTime, 3), 100, 200);
  } else {
    fill(255, 0, 0);
    text(nf(lastTime - startTime, 3), 100, 200);
  }
}

void mousePressed() {
  if (!showSplit) lastTime = getCurrentTime();
  showSplit = !showSplit;
}

int getCurrentTime() {
  return (hour() * 60 + minute()) * 60 + second();
}
