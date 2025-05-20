int runX = 10;
int runY = 610;

int pauseX = 120;
int pauseY = 610;
  
int fileX = 120 + 110;
int fileY = 610;

File selectedAuto;
JSONArray steps;

//draw robot
float ROBOT_WIDTH_INCH = 18;
float ROBOT_LENGTH_INCH = 18;
float inchToPixel = 600/144;
float robotWidthInPixel = ROBOT_WIDTH_INCH * inchToPixel;
float robotLengthInPixel = ROBOT_LENGTH_INCH * inchToPixel;

float origin = 600/2;
float previousRobotX;
float previousRobotY;

void setup() {
  size(600, 800);
  background(255, 255, 255);
  noFill();
  stroke(0, 0, 0);
  line(0, 600, 600, 600);
  rect(10, 610, 100, 100);
  fill(0, 0, 0);
  textSize(30);
  text("run", (10 + 30) , 610 + 60);
  

  noFill();
  rect(pauseX, pauseY, 100, 100);
  fill(0, 0, 0);
  textSize(30);
  text("pause", (pauseX + 15) , pauseY + 60);
  

  noFill();
  rect(fileX, fileY, 600 - fileX - 10, 100);
  rect(fileX + 10 , fileY + 10, 80, 80);
  fill(0, 0, 0);
  textSize(30);
  text("file", (fileX + 30) , fileY + 60);
  
  PImage field = loadImage("Ftc_into_the_deep_field.jpg");
  image(field, 0, 0 , 600, 600);
}

void draw() {
  fill(255,255,255);
  noStroke();             // avoid borders
  rect(fileX + 100, fileY + 15, 250, 70);       // draw over the area you want to clear
  fill(0, 0, 0);
  textSize(10);
  text(selectedAuto != null ? selectedAuto.getName() : "None", (fileX + 100) , fileY + 60);
  
  drawRobot(0,0);
}

void mousePressed() {
  if (isInBox(fileX + 10, fileY + 10, 80, 80)) {
    selectInput("Select an image to open:", "fileSelected");
  }
}

boolean isInBox(int x, int y, int xSize, int ySize) {
  return (x < mouseX && x + xSize > mouseX && y < mouseY && y + ySize > mouseY);
}

void fileSelected(File selection) {
  if (selection == null) {
  } else {
    selectedAuto = selection;
    steps = loadJSONArray(selection.getAbsolutePath());
  }
}

void drawRobot(float RRX, float RRY) {
  float realX = RRX * inchToPixel + origin;
  float realY = RRY * inchToPixel + origin;
  
  float centerX = realX - robotWidthInPixel / 2;
  float centerY = realY - robotLengthInPixel / 2;
  
  noFill();
  stroke(14, 255, 3);
  rect(centerX, centerY, robotWidthInPixel , robotLengthInPixel);
}
