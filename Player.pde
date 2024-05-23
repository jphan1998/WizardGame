class Player extends Model {
    boolean canShoot = true;
    int shootdelay = 0;
    
    //Creates the player class and where the model spawns
    Player() {
        x = width/gridsize/2;
        y = height - (10 * pixelsize);
    }
    
    //Controls for the player
    void updateObj() {
        if (keyPressed && keyCode == LEFT) {
            x -= 5;
        }
        
        if (keyPressed && keyCode == RIGHT) {
            x += 5;
        }
        
        if (keyPressed && key == ' ' && canShoot) {
            fireballs.add(new Fireball(x, y));
            canShoot = false;
            shootdelay = 0;
        }

        shootdelay++;
        
        if (shootdelay >= 20) {
            canShoot = true;
        }
    }
}
