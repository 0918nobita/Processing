void mainScreen() {
    // フラグの描画
    for (int d = 1; d <= flagRows; d++) {
        for (int r = 1; r <= flagRows; r++) {
            if (flags[d - 1][r - 1]) fill(100, 255, 100);
            else fill(0);
            drawFlag(d * 70, r * 70);
        }
    }

    noFill();
    strokeWeight(1);

    // HP が 50 以下の場合に、画面の枠を赤く点滅させる
    int green = 0;
    int blue = 0;
    for (int i = 0; i <= max; i++) {
        stroke(255, green, blue);
        if (hp <= 50) rect(i, i, width - i * 2, height - i * 2);
        green += 255 / 10;
        blue += 255 / 10;
    }

    // HP を画面左上にテキストで表示する
    fill(0);
    textSize(25);
    text("HP: " + hp, 20, 40);

    x = mouseX;
    y = mouseY;

    fill(255, 0, 0);
    stroke(0);

    // 赤い円それぞれの移動と当たり判定
    for (Enemy enemy: enemies) {
        ellipse(enemy.x, enemy.y, 20, 20);
        enemy.advance();

        if (enemy.x < 0) {
            enemy.x = 0;
            enemy.vx *= (-1);
        } else if (enemy.x > width) {
            enemy.x = width;
            enemy.vx *= (-1);
        }

        if (enemy.y < 0) {
            enemy.y = 0;
            enemy.vy *= (-1);
        } else if (enemy.y > height) {
            enemy.y = height;
            enemy.vy *= (-1);
        }

        if (crash(x, y, enemy.x, enemy.y)) {
            hp --;
            if (hp == 0) state = ScreenState.GAME_OVER;
        }
    }

    fill(0);
    ellipse(x, y, 20, 20);

    // 自機がタッチしているフラグをチェックする
    for (int d = 1; d <= flagRows; d++)
        for (int r = 1; r <= flagRows; r++)
            if (crash(x, y, d * 70, r * 70)) flags[d - 1][r - 1] = true;

    // 画面の枠を赤く点滅させるための変数の値を、周期的に変化させる
    if (up) max++;
    else max--;

    if (up && max > 10) {
        up = false;
        max = 10;
    }

    if (!up && max < 0) {
        up = true;
        max = 0;
    }

    {
        // すべてのフラグがタッチされていれば状態を CLEAR に更新する
        boolean clear = true;

        for (int d = 0; d < flagRows; d++)
            for (int r = 0; r < flagRows; r++)
                if (Arrays.asList(flags[d][r]).contains(false)) clear = false;

        if (clear) state = ScreenState.CLEAR;
    }
}

void drawFlag(float x, float y) {
    strokeWeight(1);
    line(x, y, x, y + 40);
    triangle(x, y, x + 13, y + 10, x, y + 20);
}
