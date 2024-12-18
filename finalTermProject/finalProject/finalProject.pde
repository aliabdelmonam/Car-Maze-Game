//level one Object
int gameState = 0; 
/*
-1 for info page
0 for main menu ,
1 for level 1 ,
2 for level 2 ,
*/
Level1 level1 ;
Level2 level2 ;
MainMenu mainMenu;
Info infoPage;
void setup() {
size(1080, 700);
level1 = new Level1(this);
level2 = new Level2(this) ;

mainMenu = new MainMenu(700);
infoPage = new Info(700);
}
void draw(){
  //background(0,255,0);
  //level1.playGame();
  if(gameState == 0)
  {
  background(255);
  mainMenu.drawMainMenu();  
  }
  else if(gameState == 1)
  {
  background(0,255,0);
  level1.playGame();  
  }
  else if(gameState == 2)
  {
  background(0,255,0);
  level2.playGame();  
  }
  else if(gameState == -1)
  {
  background(255);
  infoPage.drawInfoPage();
  }

  
}
