class Level1{
// level 1 properties
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


Level1(){
  //intializing some variables
this.carObject = new Car(70,100,color(150,150,150),color(255,0,0),color(255,255,255));
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
  text("level 1",900, 50); 
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
  
   //check the wining
  if (this.carObject.checkWining()) {
    this.carObject.carSpeed = 0; // Stop the car on collision
    fill(0, 255, 0);
    textSize(100);
    text("You won:)", width/2-250, height/2);
    fill(0, 0, 0);
  //waiting for 4 seconds before closing the game after wining
 if (timerWhileWining == 0) {
    timerWhileWining = millis();
  }
  if (millis() - timerWhileWining >= 2000) {
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
  }
 }
 this.carObject.drawCar();
}

}
