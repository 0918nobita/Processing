final class Enemy {
    float x;
    float y;
    float vx;
    float vy;

    void advance() {
        x += vx;
        y += vy;
    }
}

final class EnemyBuilder {
    private Enemy enemy;

    EnemyBuilder() {
        enemy = new Enemy();
    }

    public void x(float x) {
        enemy.x = x;
    }

    public void y(float y) {
        enemy.y = y;
    }

    public void vx(float vx) {
        enemy.vx = vx;
    }

    public void vy(float vy) {
        enemy.vy = vy;
    }

    public Enemy getResult() {
        return enemy;
    }
}
