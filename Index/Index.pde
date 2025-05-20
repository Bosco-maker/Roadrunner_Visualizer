

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
  
  int pauseX = 120;
  int pauseY = 610;
  noFill();
  rect(pauseX, pauseY, 100, 100);
  fill(0, 0, 0);
  textSize(30);
  text("pause", (pauseX + 15) , pauseY + 60);
  
  int fileX = 120 + 110;
  int fileY = 610;
  noFill();
  rect(fileX, fileY, 600 - fileX - 10, 100);
  rect(fileX + 10 , fileY + 10, 80, 80);
  fill(0, 0, 0);
  textSize(30);
  text("file", (fileX + 30) , fileY + 60);
}

void draw() {
  
}
