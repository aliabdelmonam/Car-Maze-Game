class Level3{
// level 3 properties
private float roadWidth;
private color roadColor;
private PImage mainBackgroundSnow;
private PImage bear;
private PImage logloo;
private PImage frozen_lake;
private PImage house;
private PImage houseTwo;
private PFont levelFont;
private PFont boldFont;
private Car carObject;
private int timerWhileWining;
private GameSoundManager soundManager; 
private PApplet parent;
// for snow
private float[] snowX;            // X positions of snowflakes
private float[] snowY;            // Y positions of snowflakes
private float[] snowSpeed;        // Speed of each snowflakes
//#####################################################################################################################
Level3(PApplet parent){
  //intializing some variables
this.carObject = new Car(70,100,color(150,150,150),color(255,0,0),color(255,255,255));
this.roadWidth = 70;
this.roadColor = color(150,150,150);

//loading the images
this.mainBackgroundSnow = loadImage("snow_background.jpg");
this.bear = loadImage("bear2.png");
this.frozen_lake = loadImage("frozen_lake2.png");
this.logloo = loadImage("logloo.png");
this.house = loadImage("home.png");
this.houseTwo = loadImage("home2.png");


//loading the fonts
this.levelFont = loadFont("BradleyHandITC-48.vlw");
this.boldFont = loadFont("Arial-Black-48.vlw");
//drawing the car for the frame setup
this.carObject.drawCar();

// sound
this.soundManager = new GameSoundManager(parent);
}
//#####################################################################################################################
public void backgroundDrawing(){
  //main grass
  image(this.mainBackgroundSnow,0,0);
  image(this.mainBackgroundSnow,this.mainBackgroundSnow.width,0);
  image(this.mainBackgroundSnow,this.mainBackgroundSnow.width*2,0);
  image(this.mainBackgroundSnow,0,this.mainBackgroundSnow.height);
  image(this.mainBackgroundSnow,this.mainBackgroundSnow.width,this.mainBackgroundSnow.height);
  image(this.mainBackgroundSnow,this.mainBackgroundSnow.width*2,this.mainBackgroundSnow.height);
  //trees
  image(this.bear,700,350,55,74); 
  image(this.bear,850,380,55,74); 
  image(this.bear,330,300,55,74);  
  image(this.bear,350,150,55,74); 
  image(this.logloo,350,390,120,100); 
  //this.frozen_lake
  image(this.frozen_lake,5,360,250,175);
  image(this.frozen_lake,800,120,250,175);
  //this.house 
  image(this.house,350,450,112,108);
    image(this.houseTwo,950,360,112,108);
  //text 
  textFont(this.levelFont);
  fill(255);
  textSize(50);
  text("level 3",900, 50); 
  fill(0);
}
//#####################################################################################################################
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
//#####################################################################################################################
public void playGame(){


   this.backgroundDrawing();
  this.roadDrawing();
  this.carObject.handleInput();
  this.carObject.updateCar();
   this.drawSnow();
   //check the wining
  if (this.carObject.checkWining()) {
    this.carObject.carSpeed = 0; // Stop the car on collision
    fill(0, 255, 0);
    textSize(100);
    text("You won:)", width/2-250, height/2);
    fill(0, 0, 0);
    this.soundManager.playWinSound();
  //waiting for 4 seconds before closing the game after wining
 if (timerWhileWining == 0) {
    timerWhileWining = millis();
  }
  if (millis() - timerWhileWining >= 4000) {
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
    this.soundManager.playCrashSound();
    text("Collision!", 10, 25);
    fill(0, 0, 0);
  }
 }
 this.carObject.drawCar();
}
//#####################################################################################################################3
private void drawSnow() {
    // Snow parameters
    int numSnowflakes = 200;
    
    // Create static arrays for snow properties (using static ensures they persist between function calls)
    if (snowX == null) {  // Initialize only once
        snowX = new float[numSnowflakes];
        snowY = new float[numSnowflakes];
        snowSpeed = new float[numSnowflakes];
        
        // Initialize snowflakes
        for (int i = 0; i < numSnowflakes; i++) {
            snowX[i] = random(width);
            snowY[i] = random(height);
            snowSpeed[i] = random(2, 5);
        }
    }
    
    // Draw and update snowflakes
    noStroke();
    fill(254, 254, 254, 200);  // White color with some transparency
    
    for (int i = 0; i < numSnowflakes; i++) {
        // Draw the snowflake
        ellipse(snowX[i], snowY[i], 5, 5);
        
        // Update position
        snowY[i] += snowSpeed[i];
        snowX[i] += sin(radians(frameCount)) * 0.5;  // Slight side-to-side movement
        
        // If snowflake reaches bottom, reset to top
        if (snowY[i] > height) {
            snowY[i] = 0;
            snowX[i] = random(width);
        }
        
        // If snowflake goes off sides, wrap around
        if (snowX[i] > width) snowX[i] = 0;
        if (snowX[i] < 0) snowX[i] = width;
    }
}
}
