/*
 * 第 4 回課題 ( 発展版 )
 * 複数の船が、並んで川を上ったり下ったりするアニメーション(3D)
 */

import java.util.Iterator;

float x = -400;
boolean moveToTheRight = true;

// 水流を表す白線オブジェクトを保持する
ArrayList<WaterCurrent> waterCurrentList = new ArrayList<WaterCurrent>();

void setup() {
  size(1000, 600, P3D);
  frameRate(60);
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  rotateX(-PI * 0.8);
  stroke(200, 100, 100);
  for (int x = -900; x < 900; x += 50) line(x, -900, 1, x, 900, 1);
  for (int y = -900; y < 900; y += 50) line(-900, y, 1, 900, y, 1);
  fill(115, 205, 244);
  noStroke();
  rectMode(CENTER);
  rect(0, 0, 1250, 400);
  
  if (frameCount % 45 == 0)
    waterCurrentList.add(new WaterCurrent()); // 45フレーム毎に白線オブジェクトを追加
  
  // 各白線オブジェクトの座標を更新して描画し、画面右端からはみ出たものは削除
  for (Iterator itr = waterCurrentList.iterator(); itr.hasNext();) {
    WaterCurrent waterCurrent = (WaterCurrent) itr.next();
    waterCurrent.update();
    if (waterCurrent.getX() > 625) itr.remove();
  }
  
  rectMode(CORNER);
  stroke(0);
  strokeWeight(1);
  translate(x, 0, -12);
  
  // 複数の船の描画
  for (int r = -1; r <= 1; r++) {
    for (int d = -1; d <= 1; d++) {
      translate(r * 120, d * 120, 0);
      rotateX(PI * 0.8);
      if (!moveToTheRight) scale(-1, 1);
      fill(33, 87, 157);
      rect(-50, 0, 52, 20);
      fill(240, 240, 240);
      rect(-35, -20, 35, 20);
      line(-50, 0, 35, 0);
      fill(33, 87, 157);
      arc(0, 0, 70, 40, 0, HALF_PI);
      if (!moveToTheRight) scale(-1, 1);
      rotateX(-PI * 0.8);
      translate(-r * 120, -d * 120, 0);
    }
  }
  
  // 移動
  if (moveToTheRight) x += 2;
  else x --;
  
  // 方向転換
  if (moveToTheRight && x >= 790) {
    moveToTheRight = false;
  } else if (!moveToTheRight && x <= -800) {
    moveToTheRight = true;
  }
}

// 水流を表す白線のクラス
class WaterCurrent {
  int x, y;

  WaterCurrent() {
    this.x = -725;
    this.y = ((int) random(290)) + 30 - 175;
  }

  // 座標を更新し、描画する
  void update() {
    strokeWeight(2);
    stroke(255, 255, 255);
    line(x, y, x + 100, y);
    x += 5;
  }

  int getX() { return x; }
}
