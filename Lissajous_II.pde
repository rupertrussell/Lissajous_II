// Created using "Processing 3.5":http://processing.org/ 

// Draws a Lissajous figures
// Based on code by Javier Romero 
// http://www.fjromero.com/processing/lissajous/

// 27 March 2011  Updated 10 October 2020
// http://www.rupert.id.au/tutorials/processing/examples.php
boolean saveFrames = false;
int ellipseCount = 0;
int oldEllipseCount = 0;
int screen_width = 600; // 2400
int screen_height = 600; // 3200

/* Scale image and reduce by 10 pixels to remove from edge of screen */
int AX = (screen_width/2) ;
int BX = (screen_height/2) ;

/* Try different values for a & b */
// eg a=1, b=3; a=1, b=2; a = 3, b = 4; a=9, b=8; 

float a = 1;
float b = 3;
float delta = PI/2;

float x, y;
float t = 0;
float inc_t = 0.005; // step size between ellipses
int saveEvery = 100; // save a screen every 100 ellipses
int count = 0;
int leftMargin = 100;
int topMargin = 100;

String str_count;
String file_name;

void setup() {
  smooth();
  fill(255);
  strokeWeight(1);   // Thicker
  size(800, 825);
  background(0);
}

void draw() {

  x = AX*sin(a*t + delta) + screen_width/2;
  x = x + leftMargin;
  y = BX*sin(b*t) + screen_height/2;
  y = y + topMargin;

  fill(#ffff00);
  ellipse(x, y, 30, 30);
  ellipseCount ++;
  if ((ellipseCount >= oldEllipseCount + saveEvery) && (saveFrames == true)) {
    String file_name = "Lissajou_8_" + str(ellipseCount) + ".png";
    save(file_name);
    println(file_name);
    oldEllipseCount = ellipseCount;
  }
  t = t+inc_t;
}

// Save png when mouse is clicked
void mouseClicked() {
  // noLoop();
  if (saveFrames == false) {
    saveFrames = true;
    println("saveFrames = true");
  } else {
    saveFrames = false;
    println("saveFrames = flase");
  }
  String file_name = "Lissajou_8_" + str(ellipseCount) + ".png";
  save(file_name);
}
