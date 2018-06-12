/*
 * プログラミング入門 第 6 回課題 ( 発展版 )
 * 黒い円を操作して、赤い円を避けながらすべてのフラグにタッチするゲーム
 * ( HP が 50 以下になると画面の枠が赤く点滅します )
 */

import java.util.Arrays;

// ゲームの状態を表す列挙型
enum State {
  PLAYING, GAMEOVER, CLEAR
}

final int n = 50,        // 赤い円の個数
          MAX_HP = 200;  // 最大 HP

int hp = MAX_HP,  // 現在の HP
    max = 0;      // 画面の枠を赤く点滅させる際に用いられる、ループ中に周期的に値が変化する変数

boolean up = true;  // 画面の枠を赤く点滅させる際に用いられる、ループ中に値が交互に変化する変数

float x = 0, y = 0;  // 自機の x, y 座標

float[] xs, ys,  // それぞれの赤い円の x, y 座標
        flagC,   // それぞれのフラグの x ( = y) 座標
        vx, vy;  // それぞれの赤い円の速度ベクトルの x, y 成分

boolean[][] flag;  // それぞれのフラグがタッチされたかどうかを記録する 2 次元配列

State state = State.PLAYING;  // 現在の状態

void setup() {
  size(800, 800);
  
  initialize();
  
  for (int i = 0; i < 10; i ++) flagC[i] = (i + 1) * 70;
}

void initialize() {
  xs = new float[n];
  ys = new float[n];
  vx = new float[n];
  vy = new float[n];
  
  flagC = new float[100];
  flag = new boolean[10][10];
  
  for (int i = 0; i < n; i++) {
    xs[i] = random(800);
    ys[i] = random(800);
    vx[i] = random(-2, 2);
    vy[i] = random(-2, 2);
  }
}

void draw() {
  background(255);
  
  // 現在の状態によって、表示する画面を変化させる
  switch (state) {
    case GAMEOVER:
      gameOverScreen();
      return;
    case CLEAR:
      resultScreen();
      return;
    case PLAYING:
      break;
  }
  
  // フラグの描画
  for (int d = 1; d <= 10; d++) {
    for (int r = 1; r <= 10; r++) {
      if (flag[d - 1][r - 1]) fill(100, 255, 100);
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
  
  // それぞれの赤い円の移動と当たり判定
  for (int i = 0; i < n; i++) {
    ellipse(xs[i], ys[i], 20, 20);
    xs[i] += vx[i];
    ys[i] += vy[i];
    
    if (xs[i] < 0) {
      xs[i] = 0;
      vx[i] = -vx[i];
    } else if (xs[i] > width) {
      xs[i] = width;
      vx[i] = -vx[i];
    }
    
    if (ys[i] < 0) {
      ys[i] = 0;
      vy[i] = -vy[i];
    } else if (ys[i] > width) {
      ys[i] = width;
      vy[i] = -vy[i];
    }
    
    if (crash(x, y, xs[i], ys[i])) {
      hp --;
      if (hp == 0) state = State.GAMEOVER;
    }
  }
  
  fill(0);
  ellipse(x, y, 20, 20);
  
  
  // 自機がタッチしているフラグをチェックする
  for (int d = 1; d <= 10; d++)
    for (int r = 1; r <= 10; r++)
      if (crash(x, y, d * 70, r * 70)) flag[d - 1][r - 1] = true;
  
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
    
    for (int d = 0; d < 10; d++)
      for (int r = 0; r < 10; r++)
        if (Arrays.asList(flag[d][r]).contains(false)) clear = false;
    
    if (clear) state = State.CLEAR;
  }
}

// 当たり判定
boolean crash(float x1, float y1, float x2, float y2) {
  return (Math.sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2)) < 20);
}

// フラグの描画
void drawFlag(float x, float y) {
  strokeWeight(1);
  line(x, y, x, y + 40);
  triangle(x, y, x + 13, y + 10, x, y + 20);
}

// ゲームオーバー画面の描画
void gameOverScreen() {
  fill(0);
  textSize(50);
  text("GAME OVER", 260, 400);
  textSize(25);
  text("Press space to restart", 270, 470);
}

// リザルト画面の描画
void resultScreen() {
  fill(0);
  textSize(50);
  text("CLEAR!!", 300, 400);
  textSize(25);
  text("Press space to restart", 270, 470);
}

// リザルト / ゲームオーバー画面で、スペースキーを押すとリスタートする
void keyPressed() {
  if (state != State.PLAYING && key == ' ') {
    state = State.PLAYING;
    hp = MAX_HP;
    
    initialize();
  }
}
