class Goblins extends EnemyModel {
    int life = 1;
    
    Goblins(int xpos, int ypos) {
        x = xpos;
        y = ypos;
    }
    
    //This determines how  the Goblin army moves
    void updateObj() {
      
            x += direction * (speed / 2);
        
        if (wall == true) {
            y += gridsize / 2;
        }
    }
    
    //Checks the life of the Goblins when they are hit by fireball
    boolean alive() {
        for (int i = 0; i < fireballs.size(); i++) {
            Fireball fireball = (Fireball) fireballs.get(i);
            
            if (fireball.x > x && fireball.x < x + 7 * pixelsize + 5 && fireball.y > y && fireball.y < y + 5 * pixelsize) {
                fireballs.remove(i);
                
                life--;
                
                if (life == 0) {
                    score += 50;
                    return false;
                }
                
                break;
            }
        }

        return true;
    }
    
    int reachCastle(){
      return y;
    }
      
    //Keeps the goblins within the game
    boolean outside() {
        return x + (gridsize) < 30 || x + (gridsize) > width - gridsize;
    }
}
