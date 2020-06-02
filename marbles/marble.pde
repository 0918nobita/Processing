final class Marble {
    float x;
    float y;
    float z;
    float vx;
    float vy;

    void advance() {
        x += vx;
        y += vy;
    }
}

final class MarbleBuilder {
    private Marble marble;

    MarbleBuilder() {
        this.marble = new Marble();
    }

    public void x(float x) {
        marble.x = x;
    }

    public void y(float y) {
        marble.y = y;
    }

    public void z(float z) {
        marble.z = z;
    }

    public void vx(float vx) {
        marble.vx = vx;
    }

    public void vy(float vy) {
        marble.vy = vy;
    }

    public Marble getResult() {
        return marble;
    }
}
