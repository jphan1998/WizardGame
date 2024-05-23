class Fireball {
    int x, y;

    Fireball(int xpos, int ypos) {
        x = xpos + gridsize/2 - 4;
        y = ypos;
    }

    void display() {
        fill(255);
        //rect(x, y, pixelsize, pixelsize);
        image(fireball, x, y);
        y -= pixelsize * 2;
    }
}
