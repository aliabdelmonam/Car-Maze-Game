class Info{
private float windowSizeY;
private PImage mainMenuPic; 
private color buttonColor;
private color buttonColorAfterHover;
private color buttonTextColor;
private PFont buttonFont;
Info(float windowSizeY){
this.windowSizeY = windowSizeY;
this.buttonColor= color(55,35,30);
this.buttonColorAfterHover = color(55,35,30,127);
this.buttonTextColor = color(200,200,200);
this.mainMenuPic = loadImage("mater.png");
this.buttonFont = loadFont("AgencyFB-Bold-48.vlw");
}
  
public void drawInfoPage(){
//background image
image(mainMenuPic,0,windowSizeY-mainMenuPic.height);
textFont(buttonFont);
textSize(40);
text("The goal is to reach 'P' sign.",60,110);
text("'W' is for acceleration.",60,180);
text("'S' is  for  deacceleration.",60,250);
text("'D' is for right Rotation.",60,320);
text("'A' is  for  left Rotation.",60,390);
//buttons
//first one
if (dist(mouseX, mouseY, 200, 600) < 50) { // Hover detection for Play button
    fill(buttonColorAfterHover);
    if(mousePressed && mouseButton == LEFT){
     gameState = 0;
    }  
} else {
    fill(buttonColor); // Full opacity
  }
ellipse(200,600,210,90);
//buttons text
textFont(this.buttonFont);
  fill(buttonTextColor);
  textSize(50);
  text("Back",170, 615); 
  fill(0);
}


}
