
PFont font;
int ranCol, ranRow;
Module module;


void setup(){
  
  size(800, 1200);
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
  background(330, 8, 91, random(10, 100));
  
  smooth();
  strokeWeight(.3);

  int rows = 36;
  int cols = 8;
  
  // create a modular grid object
  ModularGrid modulegGrid = new ModularGrid(cols, rows, 0, 0);

  ranCol = floor(random(modulegGrid.cols));
  ranRow = floor(random(modulegGrid.rows));

  module = modulegGrid.modules[ranCol][ranRow];

  font = loadFont("Miso-Light-123.vlw");
  textFont(font, 123);
  String s = "OVER";
  String t = "TONE";

  int displacement = 0;

  // draw 6 random rectangles in the modules
  for (int i=0; i<3; i++)  {
    noStroke();
    fill(130, 0, 0, random(10, 120));
    text(s, module.x, module.y+displacement);
    text(t, module.x, module.y+displacement+85);
    displacement += (int)random(80, 100);
  }

  if (ranRow>rows/2) {
    //ranRow = floor(random(modulegGrid.rows/2)); // = ranRow - 100;
    println(ranRow);
    ranRow -= 8;
  }
  else {
    //ranRow = floor(random(modulegGrid.rows/2, modulegGrid.rows)); // = ranRow + 100;
    ranRow += 4;
  }
  
  ranCol = floor(random(modulegGrid.cols));
  module = modulegGrid.modules[ranCol][ranRow];

  //int period = (int)random(8);
  int period = 1;
  int amp = (int)module.h*period;

  noFill();

  displacement = 0;
  for (int k=0; k<3; k++) {
    stroke(0);
    strokeWeight(random(8));
    smooth();

    beginShape();
    for (int i=0; i<width; i++) {
      vertex(i, amp*sin(i*2*PI*1/(2*period*module.w))+module.y+displacement);
    }
    endShape();
    beginShape();
    for (int i=0; i<width; i++) {
      vertex(i, amp*cos(i*2*PI*1/(2*period*module.w)+PI/2)+module.y+displacement);
    }
    endShape();
    displacement += (int)random(10, 30);
  }

  strokeWeight(1);
  // show both grids on top of each other
  modulegGrid.display();
  save("grid01.tif");
}

