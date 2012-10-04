/*
Printing Code ITP - Fall 2012
 Instructor: Rune Madsen
 Week 4 Assignment: generative Typography
 based on Geomerative code
 
 by Manuela Donoso
 */

import geomerative.*;


/*  Properties canvas________________________________________________________________*/
PGraphics canvas;
int canvasWidth = 5100;
int canvasHeight = 5100;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;


/*  Properties ________________________________________________________________________*/
public float position = random (-250, 250);
public float alpha = random (30, 80);
float a = random(.05, 1);
//float a = 1;


/*  Setup _____________________________________________________________________________*/
void setup() {
  size(1000, 1000);
  canvas=createGraphics(canvasWidth, canvasHeight, P2D);
  calculateResizeRatio();
}


/*  Draw _____________________________________________________________________________*/
void draw() {


  canvas.background(255);
  canvas.smooth();
  canvas.beginDraw();
  int fontSize = 500;

  // initialize the geomerative library
  RG.init(this);
  // create a new font
  RFont font = new RFont("JosefinSans-Thin.ttf", fontSize, RFont.LEFT);
  // tell library we want 11px between each point on the font path
  RCommand.setSegmentLength(random (.001, 2));

  // get the points on font outline.
  RGroup grp;
  grp = font.toGroup("RESPIRA");
  grp = grp.toPolygonGroup();
  RPoint[] pnts = grp.getPoints();

  canvas.translate(canvas.width/6, canvas.height/2);
  float h= 1025;
  // float fX = 0.99;
  float fX = (float) h/canvas.width;


  for (int i = 0; i < pnts.length; i++ ) {

    float randomX = random(0, canvas.width); 
    float randomY = random(0, canvas.height);
    float x = lerp(randomX, pnts[i].x, fX);
    float y = lerp(randomY, pnts[i].y, fX);

    canvas.fill(0);
    canvas.ellipse(x, y, a, a);

    canvas.beginShape ();
    canvas.vertex (x, y);
    canvas.vertex (pnts[i].x-position, pnts[i].y-position);
    canvas.strokeWeight(random(.05, 2));
    canvas.stroke(0, 0, 0, alpha);
    canvas.endShape ();
  }
  stop();
  //for printing
  canvas.endDraw();

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;
  image(canvas, (width/2) - (resizedWidth/2), (height/2) -(resizedHeight/2), resizedWidth, resizedHeight);
  canvas.save("generative_typography_print.tif");
}


void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}


