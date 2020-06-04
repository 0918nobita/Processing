import java.util.Arrays;

final int enemyCount = 50, // 赤い円の個数
          MAX_HP = 200,    // 最大 HP
          flagRows = 7;    // フラグの縦の個数 (= 横の個数)

final Enemy[] enemies = new Enemy[enemyCount];

final boolean[][] flags = new boolean[flagRows][flagRows];

int hp = MAX_HP, // 現在の HP
    max = 0;     // 画面の枠を赤く点滅させる際に用いられる、ループ中に周期的に値が変化する変数

boolean up = true; // 画面の枠を赤く点滅させる際に用いられる、ループ中に値が交互に変化する変数

float x = 0, y = 0; // 自機の x, y 座標

ScreenState state = ScreenState.PLAYING; // 現在の状態

void initialize() {
    for (boolean[] row: flags) Arrays.fill(row, false);

    for (int i = 0; i < enemyCount; i++) {
        EnemyBuilder builder = new EnemyBuilder();
        builder.x(random(width));
        builder.y(random(height));
        builder.vx(random(-2, 2));
        builder.vy(random(-2, 2));
        enemies[i] = builder.getResult();
    }
}

void setup() {
    size(600, 600);

    initialize();
}

void draw() {
    background(255);

    switch (state) {
        case PLAYING:
            mainScreen();
            return;
        case CLEAR:
            victoryScreen();
            return;
        case GAME_OVER:
            defeatScreen();
            return;
    }
}

// リザルト / ゲームオーバー画面で、スペースキーを押すとリスタートする
void keyPressed() {
    if (state != ScreenState.PLAYING && key == ' ') {
        state = ScreenState.PLAYING;
        hp = MAX_HP;
    
        initialize();
    }
}
