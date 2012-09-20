/*
Printing Code ITP - Fall 2012
 Instructor: Rune Madsen
 Week 2 Assignment: sharp & wet
 beginShape(), and all vertex points in a for loop.

 Created by Manuela Donoso
 */


/*  Properties canvas________________________________________________________________*/

PGraphics canvas;
int canvas_width = 5100;
int canvas_height = 6600;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

/*  Properties ________________________________________________________________________*/
float mu;       //center of the hill
float sigma;    //fatness of the hill
float amp;      //amplitude of the hill
float hill;     //hill value

float noiseAmp; //noise amplitude
float noise;    //noise value


/*  Setup _____________________________________________________________________________*/
void setup() {  
  size(593, 850);

  canvas = createGraphics(canvas_width, canvas_height, P2D);
  calculateResizeRatio();

  canvas.beginDraw();
  canvas.background(0);
  canvas.stroke(255);
  canvas.strokeWeight(canvas.height/1700); 
  canvas.noFill();

  for (float i=canvas.height/3.2; i<canvas.height/1.5; i+=(int)canvas.height/170) {
    canvas.beginShape();

    /*  WET _______________________________________________________________*/

                                                                               //set amplitude, center and fatness of the hill for one line
    amp = -10*canvas.height*random(0.1, 1.5);    
    mu = canvas.width/4 + canvas.width*random(-0.02, 0.02); 
    sigma = canvas.width*random(0.02, 0.04); 

    for (int j=0; j<canvas.width/2; j+=(int)canvas.width/200) {               //for that iterates inside a line

      hill = -amp/(sigma*sqrt(2*PI))*exp(-1*pow(j-mu, 2)/(2*pow(sigma,2)));   //(normal/gausian distribution) equation that calculate the hill value that follows a normal distribution
      canvas.vertex(j, i+hill);                                               //draw the vertex
    }


    /*  SHARP ____________________________________________________________________________*/

    noiseAmp = 0.01;
    amp = 10*canvas.height*random(0.1, 1.5);
    mu = 3*canvas.width/4 + width*random(-0.02, 0.02);
    sigma = canvas.width*random(0.005, 0.025);  
    for (int j=canvas.width/2; j<canvas.width; j+=(int)canvas.width/100) {  //for that iterates inside a line
    
      noise = noiseAmp*(3*canvas.width/4-abs(j-3*canvas.width/4))*random(-1,1);      //calculate the noise, which grows towards the centerof the canvas
      hill = -amp/(sigma*sqrt(2*PI))*exp(-1*pow(j-mu, 2)/(2*pow(sigma,2)));          //calculate the hill value that follows a normal distribution
      canvas.vertex(j, i+hill+noise);     //draw the vertex
    }

    canvas.endShape();
  }

  canvas.endDraw();

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;
  image(canvas, (width/2) - (resizedWidth/2), (height/2) -(resizedHeight/2), resizedWidth, resizedHeight);

  canvas.save("wet&sharp.tiff");
 
}

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}
