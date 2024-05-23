class EnemyModel {
    int x, y;
    
    //Creates the Goblins
    void display() {
        updateObj();
        //rect(x, y, 25, 25);
        image(goblin, x, y);
    }

    void updateObj() {
    }
}
