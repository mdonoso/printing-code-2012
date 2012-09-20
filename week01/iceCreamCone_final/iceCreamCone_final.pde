/*
Printing Code ITP - Fall 2012 
 Instructor: Rune Madsen
 
 Week 1 Assignment: Draw an ice-cream cone 
 using only triangle(), rect() and ellipse(), once each.
 
 Created by Manuela Donoso
 */


/*  Properties
 _________________________________________________________________ */

PGraphics canvas;
int canvas_width = 3508;
int canvas_height = 4961;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;




/*  Setup
 _________________________________________________________________ */

void setup() {

  size(620, 877);
  background(0);
  smooth();
  noFill();
  stroke(255);


  canvas = createGraphics(canvas_width, canvas_height, P2D);

  calculateResizeRatio();


  canvas.beginDraw();
  canvas.background(0);
  canvas.stroke(255);
  canvas.noFill();
  canvas.strokeWeight(1);



  //canvas.scale(2);
  for (int i=width*3/4; i > width/4; i-=8) {
    int x_center = width/2;
    int y_center = height/2;
    canvas.stroke (255);
    canvas.strokeWeight(5);
    canvas.triangle (x_center/ratio, height/ratio, (width/4)/ratio, (height/4)/ratio, i/ratio, (0.008*(i-width/4)*(i-width*3/4)+height/4)/ratio);
  }
  canvas.endDraw();

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("icream01.png");
}

/*  Calculate resizing
 _________________________________________________________________ */

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

