/*
Printing Code ITP - Fall 2012
 Instructor: Rune Madsen
 Week 6 Assignment: generative logo
 Generative logo design for Barqo: "chilean architecture imagebank" (www.barqo.cl)
 
 Created by Manuela Donoso
 */


/*  Properties canvas____________________________________________________________*/
PGraphics canvas;
int canvas_width = 2100;
int canvas_height = 2100;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

/*  Properties ___________________________________________________________________*/
int value = 0;
PFont font;
int fontSize = 200;


/*  Setup ________________________________________________________________________*/
void setup() {
  size(700, 700, P2D);
  background(255); 

  //create & resize canvas 
  canvas=createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();
  font = loadFont("Miso-48.vlw");
  canvas.textFont(font, 95);

  drawTriangles();
}


void draw() {
  float resizedWidth = (float) canvas.width * ratioWidth;
  float resizedHeight = (float) canvas.height * ratioHeight;
  image(canvas, (width/2) - (resizedWidth/2), (height/2) - (resizedHeight/2), resizedWidth, resizedHeight);
}


void mouseClicked() {
  drawTriangles();
  //canvas.save("barqo_log"+hour()+minute()+second()+".tiff"); //high quality
  canvas.save("barqo_log_low"+hour()+minute()+second()+".png");
}


void drawTriangles() {
  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 100, 100);
  canvas.stroke(0);
  canvas.fill(20);
  canvas.background(299, 0, 100); 

  float randY = random(canvas.height/1.9, canvas.height/1.5);


  /* draw logo only with outlines*/
  //   canvas.noFill(); 
  //canvas.strokeWeight(5);
  //  canvas.triangle(canvas.width/3, canvas.height/2, canvas.width/1.5, canvas.height/2, canvas.width/2, randY); //x3,y3 variables to randomize
  //  canvas.triangle(random(canvas.width/2.8, canvas.width/2.2), canvas.height/2, canvas.width/2, canvas.height/2, canvas.width/2, random(canvas.height/2.8, canvas.height/2.2)); // x1,y1 & x3, y3 randomize

  /* draw logo fill*/
  canvas.triangle(canvas.width/3, canvas.height/2, canvas.width/1.5, canvas.height/2, canvas.width/2, randY); //x3,y3 variables to randomize, bottom triangle
  canvas.triangle(random(canvas.width/2.8, canvas.width/2.2), canvas.height/2.01, canvas.width/2, canvas.height/2.01, canvas.width/2, random(canvas.height/2.8, canvas.height/2.2)); // x1,y1 & x3, y3 randomize

  canvas.text("BARQO", canvas.width/2-97, randY+80);
  canvas.endDraw();
}


// resize canvas function
void calculateResizeRatio() {
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else ratio = ratioHeight;
}

