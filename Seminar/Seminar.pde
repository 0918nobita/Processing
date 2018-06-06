final int X = 0, Y = 1;

float [][] coord = new float[30][2],  // それぞれの円の x, y 座標
             vec = new float[30][2];  // それぞれの円の x, y 方向の移動速度

void setup() {
  size(800, 500);
  
  for (int i = 0; i < 30; i++) {
    coord[i][X] = random(800);
    coord[i][Y] = random(500);

    vec[i][X] = random(-3, 3);
    vec[i][Y] = random(-3, 3);
  }
}

void draw() {
  background(255);

  fill(255, 0, 0);

  for (int i = 0; i < 30; i++) {
    ellipse(coord[i][X], coord[i][Y], 30, 30);
    
    coord[i][X] += vec[i][X];
    coord[i][Y] += vec[i][Y];
    
    if (coord[i][X] < 0) coord[i][X] = width;
    if (coord[i][X] > width) coord[i][X] = 0;

    if (coord[i][Y] < 0) coord[i][Y] = height;
    if (coord[i][Y] > height) coord[i][Y] = 0;
  }
}
