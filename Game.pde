int pixelsize = 4;
int gridsize  = pixelsize * 7 + 5;
Player player;
ArrayList Goblins = new ArrayList();
ArrayList fireballs = new ArrayList();
int direction = 1;
int speed = 2;
boolean wall = false;
int score = 0;
PFont f;
PImage field, wizard, goblin, fireball;
int stage = 0;

void setup() {
  //loads all the images for the game
    field = loadImage("field.png");
    field.resize(800,550);
    wizard = loadImage("wizard.png");
    wizard.resize(40,40);
    goblin = loadImage("goblin.png");
    goblin.resize(50,50);
    fireball = loadImage("fireball.png");
    fireball.resize(25,25);
    noStroke();
    size(800, 550);
    player = new Player();
    createEnemies();

    f = createFont("Arial", 36, true);
}

//Draws the stages
void draw(){
  if(stage == 0)
  loadingScreen();
  if(stage == 1)
  game();
  if(stage == 2)
  lose();
  if(stage == 3)
  win();
}

void game() {
    background(field);
    
    drawScore();
    
    // creates player model
    player.display();
    
    //creates fireballs
    for (int i = 0; i < fireballs.size(); i++) {
        Fireball fireball = (Fireball) fireballs.get(i);
        fireball.display();
    }
    
    //Makes sure the Goblins are staying within the screen
    for (int i = 0; i < Goblins.size(); i++) {
        Goblins goblins = (Goblins) Goblins.get(i);
        if (goblins.outside() == true) {
          speed += 1;
            direction *= (-1);
            wall = true;
            break;
        }
    }
    
    //Keeps track of the goblin army and if they are alive
    for (int i = 0; i < Goblins.size(); i++) {
        Goblins goblins = (Goblins) Goblins.get(i);
        if (!goblins.alive()) {
            Goblins.remove(i);
        }
       if(Goblins.size() == 0){
          stage = 3;
        }
        else {
            goblins.display();
        }
    }
    
    //Checks for the lose condition
        for (int i = 0; i < Goblins.size(); i++) {
        Goblins goblins = (Goblins) Goblins.get(i);
        if (goblins.reachCastle() > 500) {
          stage = 2;
        }
    }

    wall = false;
}

void drawScore() {
    textFont(f);
    text("Score: " + String.valueOf(score), 300, 50);
}

//creates the enemies that will spawn
void createEnemies() {
    for (int i = 0; i < width/gridsize/2; i++) {
        for (int j = 0; j <= 5; j++) {
            Goblins.add(new Goblins(i*gridsize, j*gridsize + 70));
        }
    }
}

//Loading Screen
  void loadingScreen(){
    background(0);
    stroke(0,255,0);
    noFill();
    textSize(36);
    text("Welcome to Wizard Defense!", 170, 100);
    textSize(12);
    text("Left Arrow Key = Move Left", 60, 300);
    text("Right Arrow Key = Move Right", 60, 320);
    text("Spacebar = Fire Fireball", 60, 340);
    textSize(36);
    text("Click on the Screen to Start!", 170, 500);
  }
  
  //Lose Screen
    void lose(){
    background(0);
    stroke(0,255,0);
    noFill();
    textSize(36);
    text("You lose! Your final score was: " + String.valueOf(score), 170, 100);
    textSize(12);
    text("Left Arrow Key = Move Left", 60, 300);
    text("Right Arrow Key = Move Right", 60, 320);
    text("Spacebar = Fire Fireball", 60, 340);
    textSize(36);
    text("Please Close the Game to Restart", 170, 500);
  }
  
    void win(){
    background(0,255,0);
    stroke(0,255,0);
    noFill();
    textSize(36);
    text("You Win! Your final score was: " + String.valueOf(score), 170, 100);
    textSize(12);
    text("Left Arrow Key = Move Left", 60, 300);
    text("Right Arrow Key = Move Right", 60, 320);
    text("Spacebar = Fire Fireball", 60, 340);
    textSize(36);
    text("Please Close the Game to Restart", 170, 500);
  }
  
  void mousePressed(){
   if(stage == 0){
     stage = 1;
   }
   else if(stage == 2){
     stage = 1;
   }
  }
  
  
