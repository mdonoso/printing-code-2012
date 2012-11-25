class Quadrilateral {
  PVector topLeft, topRight,  bottomLeft, bottomRight;
  
  Quadrilateral(PVector topLeft_, PVector topRight_,  PVector bottomLeft_, PVector bottomRight_) {
    topLeft = topLeft_;
    topRight = topRight_;
    bottomLeft = bottomLeft_;
    bottomRight = bottomRight_;
  }
  
  void setPoints(PVector topLeft_, PVector topRight_,  PVector bottomLeft_, PVector bottomRight_) {
    topLeft = topLeft_;
    topRight = topRight_;
    bottomLeft = bottomLeft_;
    bottomRight = bottomRight_;
  }
  
  void drawQuad() {
    Palette col = palette.getRandom();
    col.palA();
    canvas.triangle(topLeft.x, topLeft.y, topRight.x, topRight.y, bottomLeft.x, bottomLeft.y);
    col.palB();
    canvas.triangle(topLeft.x, topLeft.y, topRight.x, topRight.y, bottomRight.x, bottomRight.y);
  }
  
//  void printQuad() {
//    println("-- Quad");
//    println("tL = "+topLeft+", tR = "+topRight+", bL = "+bottomLeft+", bR = "+bottomRight);
//  }
}
