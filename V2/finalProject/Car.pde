class Car{
private float carX, carY; // Car position
 float carSpeed; // Current speed
 float carAngle; // Orientation (angle in radians)
 float acceleration; // How fast the car accelerates
 float maxSpeed; // Maximum speed
 float friction; // Slowdown factor when no input
 float rotationSpeed; // How fast the car rotates
 float carWidth;
 float carHeight;
 PImage carImage;
 color roadColor;
 color finishingLineColor;
 color parkingTextColor;


Car(float carX,float carY,color roadColor, color finishingLineColor,color parkingTextColor){
//intializing some variables 
this.carX = carX;
this.carY = carY;
this.carSpeed = 0;
this.carAngle = 0;
this.acceleration = 0.1;
this.maxSpeed = 5;
this.friction = 0.05;
this.rotationSpeed = 0.03;
this.carWidth = 70;
this.carHeight = 36;
this.roadColor = roadColor;
this.finishingLineColor =finishingLineColor;
this.parkingTextColor = parkingTextColor;


//loading car image
  this.carImage = loadImage("car.png");
  
  

}

public void handleInput() {
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      carSpeed += acceleration; // Accelerate forward
    }
    if (key == 's' || key == 'S') {
      carSpeed -= acceleration; // Accelerate backward
    }
    if (key == 'a' || key == 'A') {
      carAngle -= rotationSpeed; // Turn left
    }
    if (key == 'd' || key == 'D') {
      carAngle += rotationSpeed; // Turn right
    }
  }
}


public void updateCar() {
  // Limit speed
  carSpeed = constrain(carSpeed, -maxSpeed, maxSpeed);

  // natural slowing down
  if (carSpeed > 0) {
    carSpeed -= friction;
  } else if (carSpeed < 0) {
    carSpeed += friction;
  }

  // Stop the car completely if the speed is very low
  if (abs(carSpeed) < 0.01) {
    carSpeed = 0;
  }

  // Update position based on speed and angle
  carX += cos(carAngle) * carSpeed;
  carY += sin(carAngle) * carSpeed;

  // Prevent the car from leaving the screen
  carX = constrain(carX, 0, width);
  carY = constrain(carY, 0, height);
}


public void drawCar() {
  pushMatrix();
  translate(this.carX, this.carY);
  rotate(this.carAngle);  
  imageMode(CENTER);
  image(carImage,0,0,carWidth,carHeight);
  imageMode(CORNER);
  popMatrix();
}

public boolean checkCollision() {
  // Get the color at the car's position
  color tl = get((int) (carX - cos(carAngle) * ((carWidth-8)/2) - sin(carAngle) * ((carHeight-8)/2)), (int) (carY - sin(carAngle) * ((carWidth-8)/2) + cos(carAngle) * ((carHeight-8)/2)));
  color tr = get((int) (carX + cos(carAngle) * ((carWidth-8)/2) - sin(carAngle) * ((carHeight-8)/2)), (int) (carY + sin(carAngle) * ((carWidth-8)/2) + cos(carAngle) * ((carHeight-8)/2)));
  color bl = get((int) (carX - cos(carAngle) * ((carWidth-8)/2) + sin(carAngle) * ((carHeight-8)/2)), (int) (carY - sin(carAngle) * ((carWidth-8)/2) - cos(carAngle) * ((carHeight-8)/2)));
  color br = get((int) (carX + cos(carAngle) * ((carWidth-8)/2) + sin(carAngle) * ((carHeight-8)/2)), (int) (carY + sin(carAngle) * ((carWidth-8)/2) - cos(carAngle) * ((carHeight-8)/2)));
  
  /*color snowColor = color (254,254,254,100);
 if( (tl == roadColor && tl != finishingLineColor) &&
     (tr == roadColor && tr != finishingLineColor) &&
     (bl == roadColor && bl != finishingLineColor) &&
     (br == roadColor && br != finishingLineColor)
   )
   return false;
   else // at least one tire corner is --> snow --> out of way
   {
     if (  (tl != snowColor) &&
           (tr != snowColor) &&
           (bl != snowColor) &&
           (br != snowColor)
     ) {  println(tl,tr,bl,br);   
         return true;}  
     else 
         return false;
   
   }*/
   
   if(
  (tl != roadColor && tl != finishingLineColor)||
  (tr != roadColor && tr != finishingLineColor)||
  (bl != roadColor && bl != finishingLineColor)||
  (br != roadColor && br != finishingLineColor))
    return true;
  else 
  return false;
}


public boolean checkWining() {
  // Get the color at the car's position
  color tl = get((int) (carX - cos(carAngle) * ((carWidth-5)/2) - sin(carAngle) * ((carHeight-5)/2)), (int) (carY - sin(carAngle) * ((carWidth-5)/2) + cos(carAngle) * ((carHeight-5)/2)));
  color tr = get((int) (carX + cos(carAngle) * ((carWidth-5)/2) - sin(carAngle) * ((carHeight-5)/2)), (int) (carY + sin(carAngle) * ((carWidth-5)/2) + cos(carAngle) * ((carHeight-5)/2)));
  color bl = get((int) (carX - cos(carAngle) * ((carWidth-5)/2) + sin(carAngle) * ((carHeight-5)/2)), (int) (carY - sin(carAngle) * ((carWidth-5)/2) - cos(carAngle) * ((carHeight-5)/2)));
  color br = get((int) (carX + cos(carAngle) * ((carWidth-5)/2) + sin(carAngle) * ((carHeight-5)/2)), (int) (carY + sin(carAngle) * ((carWidth-5)/2) - cos(carAngle) * ((carHeight-5)/2)));
  if(
  ((tl == finishingLineColor)||(tl== parkingTextColor))||
  ((tr == finishingLineColor)||(tr== parkingTextColor))|| 
  ((bl == finishingLineColor)||(bl== parkingTextColor))||
  ((br == finishingLineColor)||(br== parkingTextColor))
  )
  return true;
  else 
  return false;
}


    public float getX() { return carX; }
    public float getY() { return carY; }

}
