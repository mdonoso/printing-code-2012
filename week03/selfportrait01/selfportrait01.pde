/*
Printing Code ITP - Fall 2012
 Instructor: Rune Madsen
 Week 3 Assignment: self portrait
 beginShape(), and all vertex points in a for loop.
 
 Created by Manuela Donoso
 */


import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

/*  Properties canvas________________________________________________________________*/
PGraphics canvas;
int canvasWidth = 5100;
int canvasHeight = 5100;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;


/*  Properties ________________________________________________________________________*/
float rectSize = 7*(canvasHeight/700);



/*  Setup _____________________________________________________________________________*/
void setup() {
  size(700, 700);
  //size(canvasWidth, canvasHeight);

  canvas=createGraphics(canvasWidth, canvasHeight);
  calculateResizeRatio();

  canvas.beginDraw();
 
  canvas.colorMode(HSB, 1, 1, 1);
    canvas.background(0);
   //canvas.background(2,2,2);
  canvas.noStroke();
  canvas.smooth();
  canvas.translate(0, 0);

  for (float y=0; y <=canvas.height*7; y+=rectSize) {
    for (float x =0; x<= canvas.width*7; x+=rectSize) {

      // create a color range object ranges of hue, saturation and brightness
      FloatRange h = new FloatRange(.5,.7);
      FloatRange s = new FloatRange(0.1, 1);
      FloatRange b = new FloatRange(0.7, 1);
      ColorRange range = new ColorRange(h, s, b, "My range");
     //ColorRange range = ColorRange.INTENSE;

      TColor ranColor = range.getColor();

      if (random(0, canvas.width/3)>abs(x-canvas.width/2) && random(0, canvas.height/3)>abs(y-canvas.height/2))
        // canvas.fill(random(0, 255*(width/2-abs(canvas.width/2-x))/width), random(0, 255*(width/2-abs(width/2-x))/width), random(0, 255*(width/2-abs(width/2-x))/width));
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness());
      else
    canvas.fill(0);
      //canvas.fill(2,2,3);
      canvas.rect(x, y, rectSize, rectSize);
    }
  }


  //for printing
  canvas.endDraw();

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;
  image(canvas, (width/2) - (resizedWidth/2), (height/2) -(resizedHeight/2), resizedWidth, resizedHeight);
  canvas.save("img_range03.tif");
}


void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

