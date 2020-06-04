// 当たり判定
boolean crash(float x1, float y1, float x2, float y2) {
    return (Math.sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2)) < 20);
}
