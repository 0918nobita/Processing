int w = 3000;
int h = 2000;
int cols, rows;
int scale = 20;

float[][] terrain;

float baseX = 0;
float baseY = 0;

boolean up, down, left, right, shift;

void setup() {
    size(800, 600, P3D);
    cols = w / scale;
    rows = h / scale;
    terrain = new float[cols][rows];
}

void draw() {
    float delta = shift ? 0.10 : 0.03;

    if (up) baseY -= delta;
    if (down) baseY += delta;
    if (left) baseX -= delta;
    if (right) baseX += delta;

    int y;
    float yoff;
    for (y = 0, yoff = baseY; y < rows; y++, yoff += 0.1) {
        int x;
        float xoff;
        for (x = 0, xoff = baseX; x < cols; x++, xoff += 0.1) {
            terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
        }
    }

    background(0);
    stroke(255);
    noFill();

    translate(width/2, height/2);
    rotateX(PI/3);
    translate(-w/2, -h/2);

    for (int vy = 0; vy < rows - 1; vy++) {
        beginShape(TRIANGLE_STRIP);
        for (int vx = 0; vx < cols; vx++) {
            vertex(vx * scale, vy * scale, terrain[vx][vy]);
            vertex(vx * scale, (vy+1) * scale, terrain[vx][vy+1]);
        }
        endShape();
    }
}

void keyPressed() {
    if (keyCode == UP)    up    = true;
    if (keyCode == DOWN)  down  = true;
    if (keyCode == LEFT)  left  = true;
    if (keyCode == RIGHT) right = true;
    if (keyCode == SHIFT) shift = true;
}

void keyReleased() {
    if (keyCode == UP)    up    = false;
    if (keyCode == DOWN)  down  = false;
    if (keyCode == LEFT)  left  = false;
    if (keyCode == RIGHT) right = false;
    if (keyCode == SHIFT) shift = false;
}
