/*
 * 初期座標 (x, y, z) 、速度ベクトル、色の異なる円が、
 * 個々に上下左右で反射しながら移動するアニメーション
 */

final int count = 50;
RGBColor[] cols;
float[] xs, ys, zs, vx, vy;

void setup() {
    size(1000, 600, P3D);
    frameRate(60);

    cols = new RGBColor[count];
    xs = new float[count];
    ys = new float[count];
    zs = new float[count];
    vx = new float[count];
    vy = new float[count];

    for (int i = 0; i < count; i++) {
        cols[i] = new RGBColor((int) random(255), (int) random(255), (int) random(255));
        xs[i] = random(-350, 350);
        ys[i] = random(-200, 200);
        zs[i] = random(-50, 0);
        vx[i] = random(-2, 2);
        vy[i] = random(-2, 2);
    }
}

void draw() {
    background(0);
    translate(width / 2, height / 2);
    rotateX(-PI * 0.8);
    stroke(200, 100, 100);

    // 罫線を描画する
    for (int x = -900; x < 900; x += 50) line(x, -900, 1, x, 900, 1);
    for (int y = -900; y < 900; y += 50) line(-900, y, 1, 900, y, 1);

    // 灰色の床を描画する
    fill(80, 80, 80);
    noStroke();
    rectMode(CENTER);
    rect(0, 0, 700, 400);

    translate(0, 0, -5);
    rectMode(CORNER);
    stroke(0);
    strokeWeight(1);
    fill(255, 0, 0);

    for (int i = 0; i < count; i++) {
        RGBColor col = cols[i];
        fill(col.getR(), col.getG(), col.getB());

        translate(0, 0, zs[i]);

        ellipse(xs[i], ys[i], 30, 30);

        xs[i] += vx[i];
        ys[i] += vy[i];

        if (xs[i] < -340) {
            xs[i] = -340;
            vx[i] = -vx[i];
        } else if (xs[i] > 340) {
            xs[i] = 340;
            vx[i] = -vx[i];
        }

        if (ys[i] < -190) {
            ys[i] = -190;
            vy[i] = -vy[i];
        } else if (ys[i] > 190) {
            ys[i] = 190;
            vy[i] = -vy[i];
        }

        translate(0, 0, -zs[i]);
    }
}

// 色を表すクラス
class RGBColor {
    int r, g, b;

    RGBColor(int r, int g, int b) {
        this.r = r;
        this.g = g;
        this.b = b;
    }

    int getR() { return r; }
    int getG() { return g; }
    int getB() { return b; }
}
