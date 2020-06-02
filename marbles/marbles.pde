/*
 * 初期座標 (x, y, z) 、速度ベクトル、色の異なる円が、
 * 個々に上下左右で反射しながら移動するアニメーション
 */

final int count = 50;
Color[] colors;
Marble[] marbles;

void setup() {
    size(1000, 600, P3D);
    frameRate(60);

    colors = new Color[count];
    marbles = new Marble[count];

    for (int i = 0; i < count; i++) {
        colors[i] = new Color((int) random(255), (int) random(255), (int) random(255));
        MarbleBuilder builder = new MarbleBuilder();
        builder.x(random(-350, 350));
        builder.y(random(-200, 200));
        builder.z(random(-50, 0));
        builder.vx(random(-2, 2));
        builder.vy(random(-2, 2));
        marbles[i] = builder.getResult();
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
        Color clr = colors[i];
        fill(clr.r(), clr.g(), clr.b());

        translate(0, 0, marbles[i].z);

        ellipse(marbles[i].x, marbles[i].y, 30, 30);

        marbles[i].advance();

        // 跳ね返りの計算
        if (marbles[i].x < -340) {
            marbles[i].x = -340;
            marbles[i].vx = marbles[i].vx * (-1);
        } else if (marbles[i].x > 340) {
            marbles[i].x = 340;
            marbles[i].vx = marbles[i].vx * (-1);
        }

        if (marbles[i].y < -190) {
            marbles[i].y = -190;
            marbles[i].vy = marbles[i].vy * (-1);
        } else if (marbles[i].y > 190) {
            marbles[i].y = 190;
            marbles[i].vy = marbles[i].vy * (-1);
        }

        translate(0, 0, marbles[i].z * (-1));
    }
}
