class Level2{
// level 2 properties
private float roadWidth;
private color roadColor;
private PImage mainBackgroundGrass;
private PImage treeKid;
private PImage tree1;
private PImage lake;
private PImage house;
private PImage houseTwo;
private PFont levelFont;
private PFont boldFont;
private Car carObject;
private int timerWhileWining;
private float score;
private GameSoundManager soundManager; 
private PApplet parent;



    // Score system
    private ArrayList<CollectiblePoint> collectiblePoints;
    private final float COLLISION_PENALTY = .05;
    private final int POINT_VALUE = 5;
class CollectiblePoint {
        float x, y;
        float size;
        boolean collected;
        color pointColor;
        
        CollectiblePoint(float x, float y) {
            this.x = x;
            this.y = y;
            this.size = 15;
            this.collected = false;
            this.pointColor = color(255, 215, 0); // Gold color
        }
        
        void display() {
            if (!collected) {
                pushStyle();
                fill(pointColor);
                noStroke();
                ellipse(x, y, size, size);
                // Add sparkle effect
                if (frameCount % 30 < 15) {
                    fill(255, 255, 255, 150);
                    ellipse(x, y, size/2, size/2);
                }
                popStyle();
            }
        }
        
        boolean checkCollection(float carX, float carY, float carWidth, float carHeight) {
            if (!collected) {
                float distance = dist(x, y, carX, carY);
                if (distance < (carWidth/2 + size/2)) {
                    collected = true;
                    return true;
                }
            }
            return false;
        }
    }

    private void initializeCollectiblePoints() {
        // Add points along the road path
        collectiblePoints.add(new CollectiblePoint(175, 100));
        collectiblePoints.add(new CollectiblePoint(300, 200));
        collectiblePoints.add(new CollectiblePoint(200, 400));
        collectiblePoints.add(new CollectiblePoint(600, 400));
        collectiblePoints.add(new CollectiblePoint(300, 600));
        collectiblePoints.add(new CollectiblePoint(600, 100));
        collectiblePoints.add(new CollectiblePoint(800, 200));
        collectiblePoints.add(new CollectiblePoint(800, 400));



    }

Level2(PApplet parent){
  //intializing some variables
this.carObject = new Car(70, 110, color(150,150,150), color(255,0,0), color(255,255,255));
this.roadWidth = 70;
this.roadColor = color(150,150,150);

//loading the images
this.mainBackgroundGrass = loadImage("grass3.png");
this.treeKid = loadImage("treeKid.png");
this.lake = loadImage("lake.png");
this.tree1 = loadImage("tree.png");
this.house = loadImage("home.png");
this.houseTwo = loadImage("home2.png");


//loading the fonts
this.levelFont = loadFont("BradleyHandITC-48.vlw");
this.boldFont = loadFont("Arial-Black-48.vlw");
//drawing the car for the frame setup
this.carObject.drawCar();


        this.collectiblePoints = new ArrayList<CollectiblePoint>();
        initializeCollectiblePoints();
score = 0;

// sound
this.soundManager = new GameSoundManager(parent);
}

public void backgroundDrawing(){
  //main grass
  image(this.mainBackgroundGrass,0,0);
  image(this.mainBackgroundGrass,this.mainBackgroundGrass.width,0);
  image(this.mainBackgroundGrass,this.mainBackgroundGrass.width*2,0);
  image(this.mainBackgroundGrass,0,this.mainBackgroundGrass.height);
  image(this.mainBackgroundGrass,this.mainBackgroundGrass.width,this.mainBackgroundGrass.height);
  image(this.mainBackgroundGrass,this.mainBackgroundGrass.width*2,this.mainBackgroundGrass.height);
  //trees
  image(this.treeKid, 550, 500, 55, 74); 
  
  image(this.tree1, 930, 50, 120, 100);

  image(this.tree1, 930, 200, 120, 100); 
  
  image(this.tree1, 930, 350, 120, 100); 

  
  image(this.lake, 600, 500, 250, 175);
  image(this.house, 150, 530, 112, 108);
  image(this.houseTwo, 950, 550, 112, 108);
  //text 
  textFont(this.levelFont);
  fill(255);
  textSize(50);
  text("level 2",900, 50); 
  fill(0);
}

public void roadDrawing(){
  strokeCap(ROUND);
  stroke(this.roadColor);        // Set the line color
  strokeWeight(this.roadWidth);  // Set the line thickness
  noFill();

  // Main Path from start to split
  beginShape();
  vertex(50, 100);
  vertex(300, 100);
  vertex(300, 200);
  vertex(200, 200);
  vertex(200, 300);
  vertex(300, 300);
  vertex(300, 400);
  vertex(50, 400);
  endShape();

  // Path to Dead End 1
  beginShape();
  vertex(200, 200);
  vertex(100, 200);
  endShape();

  // Path to Dead End 2
  beginShape();
  vertex(200, 300);
  vertex(100, 300);
  endShape();

  // Upper Loop
  beginShape();
  vertex(300, 100);
  vertex(500, 100);
  vertex(500, 200);
  vertex(400, 200);
  vertex(400, 300);
  vertex(500, 300);
  vertex(500, 400);
  vertex(300, 400);
  endShape();

  // Shortcut Path
  beginShape();
  vertex(400, 200);
  vertex(550, 200);
  vertex(550, 300);
  vertex(400, 300);
  endShape();

  // Lower Loop
  beginShape();
  vertex(300, 400);
  vertex(500, 400);
  vertex(500, 600);
  vertex(300, 600);
  endShape();

  // Path to Parking Spot with Multiple Turns
  beginShape();
  vertex(500, 400);
  vertex(700, 400);
  vertex(700, 300);
  vertex(600, 300);
  vertex(600, 200);
  vertex(700, 200);
  vertex(700, 100);
  vertex(900, 100);
  vertex(900, 300);
  vertex(800, 300);
  vertex(800, 400);
  vertex(900, 400);
  vertex(900, 500);
  vertex(1000, 500);
  endShape();

  // Dead End 3
  beginShape();
  vertex(700, 300);
  vertex(800, 200);
  endShape();

  // Dead End 4
  beginShape();
  vertex(600, 200);
  vertex(600, 100);
  endShape();

  // Draw the parking spot
  stroke(255, 0, 0);
  strokeCap(SQUARE);
  line(970, 500, 1035, 500);
  
  // Draw the parking 'P'
  textFont(boldFont);
  fill(255);
  textSize(30);
  text("P", 985, 520);
  fill(0);
}

public void playGame() {
    // Background and road first
    this.backgroundDrawing();
    this.roadDrawing();

    // Car movement
    this.carObject.handleInput();
    this.carObject.updateCar();

    // Draw collectible points BEFORE checking for collection
    for (CollectiblePoint point : collectiblePoints) {
        
        point.display();
    }

    // Check for point collection
    for (int i = collectiblePoints.size() - 1; i >= 0; i--) {
        CollectiblePoint point = collectiblePoints.get(i);
        if (point.checkCollection(carObject.getX(), carObject.getY(), 
                                  carObject.carWidth, carObject.carHeight)) {
            this.soundManager.playCoinSound();                        
            collectiblePoints.remove(i);
            score += POINT_VALUE;
        }
    }

    // Display HUD
    displayHUD();

    // Winning and collision checks
    if (this.carObject.checkWining()) {
        if (score >= 0) {
            this.carObject.carSpeed = 0;
            fill(0, 255, 0);
            textSize(100);
            text("You won:)", width/2-250, height/2);
            fill(0, 0, 0);
            this.soundManager.playWinSound();
            if (timerWhileWining == 0) {
                timerWhileWining = millis();
            }
            if (millis() - timerWhileWining >= 4000) {
                exit();
            }
        } else {
            this.carObject.carSpeed = 0;
            fill(255, 0, 0);
            textSize(100);
            text("You Lose:)", width/2-250, height/2);
            fill(0, 0, 0);
            this.soundManager.playLoseSound();
            if (timerWhileWining == 0) {
                timerWhileWining = millis();
            }
            if (millis() - timerWhileWining >= 4000) {
                exit();
            }
        }
    } else {
        // Collision check
        if (this.carObject.checkCollision() && !this.carObject.checkWining()) {
            this.carObject.carSpeed = 0;
            score -= COLLISION_PENALTY;
            fill(255, 0, 0);
            textFont(boldFont);
            textSize(25);
            this.soundManager.playCrashSound();
            text("Collision!", 10, 25);
            fill(0, 0, 0);
        }
    }

    // Draw the car
    this.carObject.drawCar();
}

 private void displayHUD() {

        textSize(24);
        text("Score: " + String.format("%.2f", score), 10, 60);
    }

}
