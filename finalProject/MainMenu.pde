class MainMenu{
private float windowSizeY;
private PImage mainMenuPic; 
private color buttonColor;
private color buttonColorAfterHover;
private color buttonTextColor;
private PFont buttonFont;
private PFont gameTitleFont;
MainMenu(float windowSizeY){
  
this.windowSizeY = windowSizeY;
this.buttonColor= color(55,35,30);
this.buttonColorAfterHover = color(55,35,30,127);
this.buttonTextColor = color(200,200,200);

this.mainMenuPic = loadImage("mater.png");
this.buttonFont = loadFont("AgencyFB-Bold-48.vlw");
this.gameTitleFont = loadFont("Arial-Black-48.vlw");
}
  
public void drawMainMenu(){
//background image
image(mainMenuPic,0,windowSizeY-mainMenuPic.height);
textFont(gameTitleFont);
textSize(60);
text("Car-Maze Game",60,180);


//buttons
//first one
if (dist(mouseX, mouseY, 200, 300) < 50) { // Moved up to 300
    fill(buttonColorAfterHover);
    if(mousePressed && mouseButton == LEFT){
     gameState = 1;
    }  
} else {
    fill(buttonColor); // Full opacity
  }
ellipse(200,300,210,90);

 //second one
 if (dist(mouseX, mouseY, 200, 400) < 50) { // 100 pixels margin
    fill(buttonColorAfterHover); // 50% opacity
     if(mousePressed && mouseButton == LEFT){
       gameState = 2;
    }  
  } else {
    fill(buttonColor); // Full opacity
  }
ellipse(200,400,210,90);

 //Third one
 if (dist(mouseX, mouseY, 200, 500) < 50) { // 100 pixels margin
    fill(buttonColorAfterHover); // 50% opacity
     if(mousePressed && mouseButton == LEFT){
       gameState = 3;
    }  
  } else {
    fill(buttonColor); // Full opacity
  }
ellipse(200,500,210,90);

 //Fourth one (Info)
 if (dist(mouseX, mouseY, 200, 600) < 50) { // 100 pixels margin
    fill(buttonColorAfterHover); // 50% opacity
     if(mousePressed && mouseButton == LEFT){
       gameState = -1;
    }  
  } else {
    fill(buttonColor); // Full opacity
  }
ellipse(200,600,210,90);


//buttons text
textFont(this.buttonFont);
  fill(buttonTextColor);
  textSize(50);
  text("Level-1",150, 315); // Adjusted text positions
  text("Level-2",150, 415);
  text("Level-3",150, 515);
  text("Info",170, 615);
  fill(0);
}


}
