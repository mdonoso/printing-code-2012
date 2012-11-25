/*
 Printing Code ITP - Fall 2012
 Instructor: Rune Madsen
 Week 8: Vectors and Randomization
 Assignment: pick one Olivetti poster by Giovanni Pintori 
 and write a Processing sketch that directly copies or is inspired by the design of the poster.
 
 Created by Manuela Donoso
 */


/*  Properties canvas____________________________________________________________*/
PGraphics canvas;
int canvas_width = 3000;  
int canvas_height = 4200;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

/*  Properties _____________________________________________________________________*/
import toxi.util.datatypes.*;

Quadrilateral quad;
int quadNum;
int step;
int noiseX;
int noiseY;
int phase;
boolean drawing;
WeightedRandomSet<Palette> palette;

PFont font;
PVector tL, bL, tR, bR;


/*  Setup _____________________________________________________________________________*/
void setup() {
  size(500, 700);
  background(255);

  canvas = createGraphics(canvas_width, canvas_height, JAVA2D);
  calculateResizeRatio();
  font = loadFont("Miso-190.vlw");
  textFont(font);
  noFill();

  palette = new WeightedRandomSet<Palette>();
  palette.add(new Palette(#283614, #548B3C, 180), 4); //green
  palette.add(new Palette(#5F0405, #E0280B, 180), 3); //red
  palette.add(new Palette(#9B6A02, #FFE705, 180), 3); //yellow 
  palette.add(new Palette(#577689, #FAFCFF, 180), 2); //lightblue

  quadNum = canvas.width/8;
  step = canvas.width/10;
  noiseX = canvas.width/8;
  noiseY = canvas.height/10;
  phase = canvas.width/10;
  drawing = true;
  
  drawTriangles();
}


/*  Draw _____________________________________________________________________________*/
void draw() {     

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;
  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);
}


void mouseClicked() {
  drawTriangles();  
  canvas.save("olivetti" + day() + hour() + minute() + second() + ".jpg");
}

void drawTriangles(){  
  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 100, 100);
  canvas.noStroke();
  canvas.smooth();
  canvas.background(299, 0, 100);

 tL = new PVector(0, canvas.height/4);
  bL = new PVector(0, 3*canvas.height/4);
  tR = new PVector(tL.x+step+random(-noiseX, noiseX), tL.y+random(-noiseY, noiseY));
  bR = new PVector(bL.x+step+random(-noiseX, noiseX), bL.y+random(-noiseY, noiseY));
  
  quad = new Quadrilateral(tL, tR, bL, bR);  
  quad.drawQuad();

  for (int i=0; i<quadNum; i++) {

    float m = (tR.y-bR.y)/(tR.x-bR.x); //pendiente de la recta

    if (random(1)<0.5) {
      tL.x = tR.x+phase*(1/m);
      tL.y = m*(tL.x-tR.x)+tR.y;
      bL.x = bR.x;
      bL.y = bR.y;
    }
    else {
      tL.x = tR.x;
      tL.y = tR.y;
      bL.x = bR.x+phase*(1/m);
      bL.y = m*(bL.x-bR.x)+bR.y;
    }

    tR.x = tL.x+step+random(-noiseX, noiseX);
    tR.y = tL.y+random(-noiseY, noiseY);
    bR.x = bL.x+step+random(-noiseX, noiseX);
    bR.y = bL.y+random(-noiseY, noiseY);

    quad.setPoints(tL, tR, bL, bR);
    quad.drawQuad();
  }
  
  quad.setPoints(tL, tR, bL, bR);
  quad.drawQuad();

  canvas.fill(0, 0, 30);
  canvas.textFont(createFont("olivetti", 120));
  canvas.text("olivetti", canvas.width/1.2, canvas.height/1.1);
  canvas.fill(255);
  canvas.endDraw();
}


/*  Calculate resizing _________________________________________________________________ */
void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}
