class Level2{
// level 2 properties
private int snowballx;
private int snowballRadius;
private int snowbally;
private float roadWidth;
private color roadColor;
private PImage mainBackgroundGrass;
private PImage treeKid;
private PImage tree1;
private PImage lake;
private PImage house;
private PImage Boy;
private PImage houseTwo;
private PFont levelFont;
private PFont boldFont;
private Car carObject;
private GameSoundManager soundManager; // Declare the object
private PApplet parent;
private int timerWhileWining;
Level2(PApplet parent){
  //intializing some variables
this.carObject = new Car(70,100,color(150,150,150),color(255,0,0),color(255,255,255));
this.soundManager = new GameSoundManager(parent);
this.roadWidth = 70;
this.roadColor = color(150,150,150);
this.snowballx = 700;
this.snowbally = 190;
this.snowballRadius=15;
//loading the images
this.mainBackgroundGrass = loadImage("grass3.png");
this.treeKid = loadImage("treeKid.png");
this.lake = loadImage("lake.png");
this.tree1 = loadImage("tree.png");
this.house = loadImage("home.png");
this.houseTwo = loadImage("home2.png");
this.Boy = loadImage("throw_ball.png");
//loading the fonts
this.levelFont = loadFont("BradleyHandITC-48.vlw");
this.boldFont = loadFont("Arial-Black-48.vlw");
//drawing the car for the frame setup
this.carObject.drawCar();
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
  image(this.treeKid,700,350,55,74); 
  image(this.treeKid,850,380,55,74); 
  image(this.treeKid,330,300,55,74);  
  image(this.treeKid,350,150,55,74); 
  image(this.tree1,350,390,120,100); 
  //boy
  image(this.Boy,710,160,70,74);
  
  //this.lake
  image(this.lake,5,360,250,175);
  image(this.lake,800,120,250,175);
  //this.house 
  image(this.house,350,450,112,108);
    image(this.houseTwo,950,360,112,108);
  //text 
  textFont(this.levelFont);
  fill(255);
  textSize(50);
  text("level 2",900, 50); 
  fill(0);
}

public void roadDrawing(){
  strokeCap(ROUND);
  stroke(this.roadColor);        // Set the line color to black
  strokeWeight(this.roadWidth);  // Set the line thickness
  noFill();
  beginShape();
  vertex(50, 100);
  vertex(300, 100);
  vertex(300, 200);
  vertex(50, 200);
  vertex(50, 300);
  vertex(300, 300);
  vertex(300, 600);
  vertex(50, 600);
  endShape();
  
  beginShape();
  vertex(300, 100); 
  vertex(550, 100); 
  vertex(550, 200); 
  vertex(650, 200); 
  vertex(650, 100); 
  vertex(800, 100);
  endShape();
  
  beginShape();
  vertex(550, 200);
  vertex(550, 400);
  vertex(650, 400);
  vertex(650, 300);
  vertex(800, 300);
  endShape();
  
  beginShape();
  vertex(650, 400);
  vertex(650, 500);
  vertex(1000, 500);
  endShape();
 stroke(255,0,0);
  strokeCap(SQUARE);
  line(970,500,1035,500);
  //parking text
  textFont(boldFont);
  fill(255);
  text("P",985,515);
  fill(0);
}

public void playGame(){


   this.backgroundDrawing();
  this.roadDrawing();
  this.carObject.handleInput();
  this.carObject.updateCar();
  this.draw_snowball();
   //check the wining
  if (this.check_collision_snow_ball())
  {
    this.soundManager.playBoomSound();
    fill(0, 255, 0);
    textSize(100);
    text("BOOM:)", width/2-250, height/2);
  }
  if (this.carObject.checkWining()) {
    this.soundManager.playWinSound();
    this.carObject.carSpeed = 0; // Stop the car on collision
    fill(0, 255, 0);
    textSize(100);
    text("You won:)", width/2-250, height/2);
    fill(0, 0, 0);
  //waiting for 4 seconds before closing the game after wining
 if (timerWhileWining == 0) {
    timerWhileWining = millis();
  }
  if (millis() - timerWhileWining >= 5000) {
    exit();
  }
  
  }
 else{
 //Check collision
  if (this.carObject.checkCollision()&& !this.carObject.checkWining()) {
    this.carObject.carSpeed = 0; // Stop the car on collision
    fill(255, 0, 0);
    textFont(boldFont);
    textSize(25);
    text("Collision!", 10, 25);
    fill(0, 0, 0);
    this.soundManager.playCrashSound();
  }
 }
 this.carObject.drawCar();
}

public void draw_snowball(){
  
  fill(255);  // Set the color to white
  noStroke(); // Remove the outline
  ellipse(snowballx, snowbally, snowballRadius, snowballRadius);
  if (snowballx < 400)
    snowballx = 700;
   else 
   snowballx -=3;
}
public boolean check_collision_snow_ball (){
  float circleX = snowballx;
    float circleY = snowbally;
    float radius = snowballRadius;

    // Car's rectangle bounds
    float rectX = this.carObject.carX;           // Top-left corner X of the car
    float rectY = this.carObject.carY;           // Top-left corner Y of the car
    float rectWidth = this.carObject.carWidth;   // Width of the car
    float rectHeight = this.carObject.carHeight; // Height of the car

    // 1. Check if the circle's center is inside the rectangle
    if (circleX >= rectX && circleX <= rectX + rectWidth &&
        circleY >= rectY && circleY <= rectY + rectHeight) {
        return true; // Collision: Circle center is inside the rectangle
    }

    // 2. Find the closest point on the rectangle to the circle center
    float closestX = Math.max(rectX, Math.min(circleX, rectX + rectWidth));  // Clamp circleX to the rectangle's X range
    float closestY = Math.max(rectY, Math.min(circleY, rectY + rectHeight)); // Clamp circleY to the rectangle's Y range

    // 3. Calculate the distance between the circle center and the closest point
    float distX = circleX - closestX;
    float distY = circleY - closestY;

    // 4. If the distance is less than or equal to the circle's radius, there's a collision
    return (distX * distX + distY * distY) <= (radius * radius);
}

}
