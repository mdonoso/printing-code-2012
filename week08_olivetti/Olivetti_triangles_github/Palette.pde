class Palette {
  int palA, palB;
  int alphaN;
  
  Palette( int palA_, int palB_, int alphaN_) {
    palA = palA_;
    palB = palB_;
    alphaN = alphaN_;
  }
  
  void palA() {
    canvas.fill(palA, alphaN);
  }
  
  void palB() {
    canvas.fill(palB, alphaN);
  }
}
