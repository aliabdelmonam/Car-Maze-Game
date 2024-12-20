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
private PImage heart;
private PImage boom;
private PImage ping_ball;
private PImage ping_row;
private PImage red_fuel;
private PImage orange_fuel;
private PImage green_fuel;
private PImage red_orange_fuel;
private PImage throw_ball; 
private PImage key_;
private PImage gate;
private PFont levelFont;
private PFont boldFont;
private Car carObject;
private int timerWhileWining;
private GameSoundManager soundManager; 
private PApplet parent;
// for snow
private float[] snowX;            // X positions of snowflakes
private float[] snowY;            // Y positions of snowflakes
private float[] snowSpeed;  // Speed of each snowflakes
private int snowballRadius;
private int snowbally;
private float snowballx;
// key 
private float keyAngle;
private float keyX;
private float keyY;
private int flagkey=0;
// lives
private int lives =3;
private float delayStartTime=0;
private int gamefinished = 0;
// Fuel system
private float fuelLevel = 100;    // Starting fuel level
private float fuelDecrease = 0.06; // Rate of fuel consumption (adjust as needed)
private float fuelX = width - 150; // Fuel gauge X position
private float fuelY = 30;         // Fuel gauge Y position
// layer
private PGraphics snowLayer;  // Separate layer for snow
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
this.throw_ball = loadImage("throw_ball.png");
this.key_ =  loadImage("key.png");
this.gate = loadImage("gate.png");
// heart lives
this.heart = loadImage("heart.png");
//loading the fonts
this.levelFont = loadFont("BradleyHandITC-48.vlw");
this.boldFont = loadFont("Arial-Black-48.vlw");
//drawing the car for the frame setup
this.carObject.drawCar();

// sound
this.soundManager = new GameSoundManager(parent);
// snow ball
this.snowballRadius= 15;
this.snowbally = 290;
this.snowballx = 850;
// key 
this.keyAngle = 0;
this.keyX = 530;
this.keyY = 180;
this.flagkey=0;
// boom
this.boom = loadImage("car_boom.png");
// fuel
this.red_fuel =loadImage("red_fuel.png");
this.orange_fuel = loadImage("orange_fuel.png");
this.green_fuel = loadImage("green_fuel.png");
this.red_orange_fuel = loadImage("orange_red_fuel.png");

this.ping_ball = loadImage("ping_ball.png");
this.ping_row = loadImage("ping_row.png");
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
  //image(this.bear,250,350,55,74); 
  //image(this.logloo,300,450,250,250); 
  //this.frozen_lake
  //image(this.frozen_lake,5,360,250,175);
 // image(this.frozen_lake,700,70,250,250);
  //image(this.ping_ball,10,500,180,150);
  //image(this.ping_row,700,550,300,150);
  //this.house 
  //image(this.house,350,450,112,108);
    //image(this.houseTwo,950,360,112,108);
  // gate
  
  //snow man
  image(this.throw_ball,850,250,100,100);
  // key
  image(this.key_,530,180,30,30);
  //text 
  textFont(this.levelFont);
  fill(255);
  textSize(50);
  text("level 3",900, 50); 
  fill(0);
}
//#####################################################################################################################
public void roadDrawing() {
  strokeCap(ROUND);
  stroke(this.roadColor);        
  strokeWeight(this.roadWidth * 0.85);  // Wider roads for easier navigation
  noFill();
  
  // Initial curve (more gentle)
  beginShape();
  vertex(50, 100);
  vertex(200, 100);
  vertex(200, 200);
  vertex(100, 200);
  vertex(100, 300);
  endShape();

  // Middle section (smoother turns)
  beginShape();
  vertex(100, 300);
  vertex(300, 300);
  vertex(300, 200);
  vertex(400, 200);
  vertex(400, 350);
  vertex(500, 350);
  endShape();

  // Central area
  beginShape();
  vertex(500, 350);
  vertex(500, 200);
  vertex(600, 200);
  vertex(600, 400);
  vertex(500, 400);
  vertex(500, 500);
  vertex(700, 500);
  endShape();

  // Pre-final section
  strokeWeight(this.roadWidth * 0.8);
  beginShape();
  vertex(700, 500);
  vertex(700, 300);
  vertex(800, 300);
  vertex(800, 400);
  vertex(900, 400);
  endShape();

  // Final approach (wider and more forgiving)
  beginShape();
  vertex(900, 400);
  vertex(900, 500);
  vertex(1000, 500);
  vertex(1000, 450);
  vertex(1000, 450);
  vertex(1000, 250);
  endShape();

  // Parking spot (properly aligned with final approach)
  stroke(255, 0, 0);
  strokeCap(SQUARE);
  strokeWeight(this.roadWidth * 0.8);
  line(970, 250, 1035, 250);  
  
  textFont(boldFont);
  fill(255);
  textSize(30);  // Adjusted text size for better fit
  text("P", 995, 260);  // Centered the P on the red line
  fill(0);
}
//#####################################################################################################################
public void playGame(){

  
  this.backgroundDrawing();
  this.roadDrawing();
  this.draw_snowball();
  this.carObject.handleInput();
  this.carObject.updateCar();
  this.drawKey();
  this.drawGate();
  this.drawLives(); 
  this.drawFuel();
  this.updateFuel();  
  
  if (fuelLevel <= 0) {
        // Game Over due to no fuel
        fill(255, 0, 0);
        textSize(50);
        text("Out of Fuel!", width/2-100, height/2);
        gamefinished = 1;
        this.soundManager.stopAllSounds();
        this.soundManager.playLoseSound();
    }
  if (gamefinished==1)
  {
    if (delay(3))
    this.carObject.carSpeed=0;
    exit();
  }
  // check if snow ball collision
  if (checkSnowballCollision()) {
        lives--;  // Reduce lives
        
        if (lives > 0) {
            // Reset car position
            this.carObject.carX = 70;
            this.carObject.carY = 100;
            this.carObject.carSpeed = 0;
            this.carObject.carAngle = 0;
            
            // Reset key if it was collected
            flagkey = 0;
            
            // Show boom and message
            image(this.boom, this.carObject.carX - 30, this.carObject.carY - 30, 60, 60);
            fill(255, 0, 0);
            textFont(boldFont);
            textSize(25);
            text("Hit by Snowball! Lives left: " + lives, width/2-120, 50);
            this.soundManager.stopAllSounds();
            this.soundManager.playBoomSound();
        } else {
            // Game Over
            fill(255, 0, 0);
            textSize(50);
            text("Game Over!", width/2-100, height/2);
             gamefinished=1;
            this.soundManager.stopAllSounds();
            this.soundManager.playLoseSound();
            /*if(delay(2000))
            {
            exit();
            }*/
        }
    }
   // Only draw key if not collected
    if (flagkey == 0 && checkKeyCollision()) {
        flagkey = 1;  // Set flag to indicate key is collected
        this.soundManager.playKeySound();  // Optional: play collection sound
        // Show collection message
        fill(255, 215, 0);
        textFont(boldFont);
        textSize(25);
        text("Key Collected!", width/2-60, 50);
    }
  
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
  //this.drawSnow();
  //image(snowLayer, 0, 0); 
}
//#####################################################################################################################3
private void drawSnow() {
    // Initialize snow system if not already done
    if (snowX == null) {
        int numSnowflakes = 200;
        snowX = new float[numSnowflakes];
        snowY = new float[numSnowflakes];
        snowSpeed = new float[numSnowflakes];
        
        // Initialize each snowflake
        for (int i = 0; i < numSnowflakes; i++) {
            snowX[i] = random(width);        // Random x position
            snowY[i] = random(height);       // Random y position
            snowSpeed[i] = random(2, 5);     // Random fall speed
        }
    }
    
    // Begin drawing on snow layer
    snowLayer.beginDraw();
    snowLayer.clear();  // Clear previous frame
    
    // Set up snow appearance
    snowLayer.noStroke();
    snowLayer.fill(255, 255, 255, 150);  // White with transparency
    
    // Update and draw each snowflake
    for (int i = 0; i < snowX.length; i++) {
        // Draw snowflake
        snowLayer.ellipse(snowX[i], snowY[i], 3, 3);
        
        // Update position
        snowY[i] += snowSpeed[i];  // Fall downward
        snowX[i] += sin(radians(frameCount + i) * 0.5) * 0.5;  // Gentle side-to-side motion
        
        // Reset snowflake if it goes off screen
        if (snowY[i] > height) {
            snowY[i] = 0;          // Reset to top
            snowX[i] = random(width);
        }
        
        // Wrap around sides
        if (snowX[i] > width) snowX[i] = 0;
        if (snowX[i] < 0) snowX[i] = width;
    }
    
    snowLayer.endDraw();
    
    // Display snow layer
    image(snowLayer, 0, 0);
}
//#####################################################################################################################
public void draw_snowball(){
  
  fill(240,240,240);  // Set the color to white
  noStroke(); // Remove the outline
  ellipse(snowballx, snowbally, snowballRadius, snowballRadius);
  if (snowballx < 0)
    snowballx = 850;
   else 
   snowballx -=2;
}
//#####################################################################################################################
private void drawKey() {
    if (flagkey == 0) {  // Only draw the key if not collected
        pushMatrix(); 
        translate(keyX + 15, keyY + 15); 
        rotate(radians(keyAngle)); 
        image(this.key_, -15, -15, 30, 30); 
        popMatrix(); 
        
        // Update rotation angle only if key is still there
        keyAngle += 2; 
        if (keyAngle >= 360) keyAngle = 0;
    }
}
//#####################################################################################################################
private boolean checkKeyCollision() {
    // Get car's position from your Car class
    
    // Calculate distance between car center and key center
    float distance = dist(this.carObject.carX, this.carObject.carY, keyX + 15, keyY + 15);
    
    // Define collision radius (adjust based on your car and key size)
    float collisionRadius = 35;  // Adjust this value as needed
    
    return distance < collisionRadius;
}
//#####################################################################################################################
private void drawGate(){
  if (flagkey == 0){
  pushMatrix(); 
  image(this.gate,950,300,100,100);
  popMatrix(); 
  }
}
//#####################################################################################################################
private boolean checkSnowballCollision() {
    // Get car's dimensions
    float carWidth = 30;  // Reduced for more precise collision
    float carHeight = 50; // Reduced for more precise collision
    
    // Calculate car's corners based on its rotation
    float angle = radians(this.carObject.carAngle);
    float cos = cos(angle);
    float sin = sin(angle);
    
    // Define car corners (relative to center)
    float[][] carCorners = {
        {-carWidth/2, -carHeight/2}, // Top left
        {carWidth/2, -carHeight/2},  // Top right
        {carWidth/2, carHeight/2},   // Bottom right
        {-carWidth/2, carHeight/2}   // Bottom left
    };
    
    // Rotate and translate corners to actual position
    for (int i = 0; i < 4; i++) {
        float tempX = carCorners[i][0];
        float tempY = carCorners[i][1];
        carCorners[i][0] = tempX * cos - tempY * sin + this.carObject.carX;
        carCorners[i][1] = tempX * sin + tempY * cos + this.carObject.carY;
    }
    
    // Check if snowball intersects with any of the car's edges
    for (int i = 0; i < 4; i++) {
        int next = (i + 1) % 4;
        float edgeX = carCorners[next][0] - carCorners[i][0];
        float edgeY = carCorners[next][1] - carCorners[i][1];
        float edgeLength = sqrt(edgeX * edgeX + edgeY * edgeY);
        
        // Calculate distance from snowball center to edge
        float dx = snowballx - carCorners[i][0];
        float dy = snowbally - carCorners[i][1];
        float projection = (dx * edgeX + dy * edgeY) / edgeLength;
        
        if (projection >= 0 && projection <= edgeLength) {
            float perpDist = abs(dx * (-edgeY/edgeLength) + dy * (edgeX/edgeLength));
            if (perpDist <= snowballRadius) {
                return true;
            }
        }
    }
    
    // Check if snowball is inside the car
    boolean inside = false;
    for (int i = 0, j = 3; i < 4; j = i++) {
        if (((carCorners[i][1] > snowbally) != (carCorners[j][1] > snowbally)) &&
            (snowballx < (carCorners[j][0] - carCorners[i][0]) * (snowbally - carCorners[i][1]) /
            (carCorners[j][1] - carCorners[i][1]) + carCorners[i][0])) {
            inside = !inside;
        }
    }
    
    return inside;
}
//#####################################################################################################################
private void drawLives() {
    // Draw hearts in top left corner
    for(int i = 0; i < lives; i++) {
        image(this.heart, 20 + (i * 40), 20, 30, 30);  // Changed position to start from left
    }
    
    // Lives count text also moved to left
    fill(255);
    textFont(boldFont);
    textSize(20);
    text("Lives: " + lives, 20, 65);  // Moved text under the hearts
}
//#####################################################################################################################
/*
private boolean waitForMilliseconds(int delay) {
    if (timerWhileWining == 0) {
        timerWhileWining = millis();
    }
    return millis() - timerWhileWining >= delay;
}*/
//#####################################################################################################################
private boolean delay(float seconds) {
    int currentTime = millis();
    
    // If this is the first time checking, initialize start time
    if (delayStartTime == 0) {
        delayStartTime = currentTime;
    }
    
    // Check if enough time has passed
    if (currentTime - delayStartTime >= seconds * 1000) {
        delayStartTime = 0;  // Reset for next use
        return true;
    }
    return false;
}
//#####################################################################################################################
private void updateFuel() {
    // Decrease fuel when car is moving (check car's speed)
    if (abs(this.carObject.carSpeed) > 0) {
        fuelLevel -= fuelDecrease;
    }
    
    // Ensure fuel doesn't go below 0
    if (fuelLevel < 0) {
        fuelLevel = 0;
        this.carObject.carSpeed = 0; // Stop car when out of fuel
    }
}
//#####################################################################################################################
private void drawFuel() {
    float centerX = width/2;  // Center of window
    float topY = 30;         // Distance from top
    float gaugeWidth = 200;  // Width of fuel gauge
    float gaugeHeight = 20;  // Height of fuel gauge
    
    // Draw fuel gauge background
    fill(50);
    rect(centerX - gaugeWidth/2, topY, gaugeWidth, gaugeHeight);
    
    // Draw fuel level
    if (fuelLevel > 70) {
        fill(0, 255, 0); // Green when fuel is high
    } else if (fuelLevel > 30) {
        fill(255, 165, 0); // Orange when fuel is medium
    } else {
        fill(255, 0, 0); // Red when fuel is low
    }
    
    // Draw current fuel level
    float currentFuelWidth = (fuelLevel/100) * gaugeWidth;
    rect(centerX - gaugeWidth/2, topY, currentFuelWidth, gaugeHeight);
    
    // Draw fuel icon based on level
    float iconSize = 30;
    if (fuelLevel > 70) {
        image(this.green_fuel, centerX - gaugeWidth/2 - iconSize - 5, topY - 5, iconSize, iconSize);
    } else if (fuelLevel > 30) {
        image(this.orange_fuel, centerX - gaugeWidth/2 - iconSize - 5, topY - 5, iconSize, iconSize);
    } else {
        image(this.red_fuel, centerX - gaugeWidth/2 - iconSize - 5, topY - 5, iconSize, iconSize);
    }
    
    // Draw fuel text
    fill(255);
    textFont(boldFont);
    textSize(15);
    textAlign(CENTER);
    text("Fuel: " + int(fuelLevel) + "%", centerX, topY - 5);
    textAlign(LEFT);  // Reset text alignment to default
}
}
