/**
 * 船が川の両岸で跳ね返りながら、画面左端から右端に移動するアニメーション
 */

import java.util.Iterator;

float theta = PI / 3; // 船の傾き

// 船の座標
int x = 0,
    y = 60;

// 水流を表す白線オブジェクトを保持する
ArrayList<WaterCurrent> waterCurrentList = new ArrayList<WaterCurrent>();

void setup() {
  size(1000, 600); 
}

void draw() {
  background(115, 205, 244); // 川の水
  
  // 岸を描画
  fill(150, 150, 150);
  rect(0, 0, width, 20);
  rect(0, height - 20, width, 20);
  
  if (frameCount % 45 == 0)
    waterCurrentList.add(new WaterCurrent()); // 白線オブジェクトを追加
  
  // 各白線オブジェクトの座標を更新し、画面右端からはみ出たものは削除
  for (Iterator itr = waterCurrentList.iterator(); itr.hasNext();) {
    WaterCurrent waterCurrent = (WaterCurrent) itr.next();
    waterCurrent.update();
    if (waterCurrent.getX() > width) itr.remove();
  }
  
  // 船の座標を移動
  if (x < width + 45) {
    x += 3 * cos(theta);
    y += 3 * sin(theta);
  }
  
  // 跳ね返り
  if (y < 50) {
    y = 70;
    theta = 2 * PI - theta;
  } else if(y > height - 50) {
    y = height - 70;
    theta = 2 * PI - theta;
  }
  
  // 座標系の平行移動・回転 (フレーム毎にリセット)
  translate(x, y);
  rotate(theta);
  
  // 船を描画
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(33, 87, 157);
  rect(-50, 0, 52, 20);
  fill(240, 240, 240);
  rect(-35, -20, 35, 20);
  line(-50, 0, 35, 0);
  fill(33, 87, 157);
  arc(0, 0, 70, 40, 0, HALF_PI);
}

// 水流を表す白線のクラス
class WaterCurrent {
  int x, y;
  
  WaterCurrent() {
    this.x = -130;
    this.y = ((int) random(height - 60)) + 30;
  }
  
  // 座標を更新する
  void update() {
    strokeWeight(2);
    stroke(255, 255, 255);
    line(x, y, x + 120, y);
    x += 5;
  }
  
  int getX() { return x; }
}
