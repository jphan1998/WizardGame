class Model {
    int x, y;
    
    //Creates the image of the Wizard
    void display() {
        updateObj();
        //rect(x,y, 25, 25);
        image(wizard, x, y);
    }

    void updateObj() {
    }
}
