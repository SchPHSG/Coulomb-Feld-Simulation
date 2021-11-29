// adapted from: https://github.com/vlukashevich/vector-fileds-processing 
// Vektorfelder berechnen erklärt

class Cell {
  int i, j;  
  PVector vec;

  float arg;
  float mag;

  Cell (int _i, int _j, float load1, float load2, PVector pos1, PVector pos2){
    i = _i;
    j = _j;
    
    float x = (i + 0.5) * len;
    float y = (j + 0.5) * len;
    
    vec = vector__field(x, y,load1, load2, pos1,pos2);
    mag = vec.mag();
    arg = vec.heading();
  }
}
  //Abbilden
  void show () {
    if (mag != 0) {
      push();
      strokeWeight(2);
      stroke(0);
  
      float r = 8; 
      float l = len;
      float buffer = 5;
  
      translate((i + 0.5) * l, (j + 0.5) * l);
      rotate(arg);
      line(-l/2 + buffer, 0, l/2 - buffer, 0);
      
      translate(l/2 - buffer, 0);
  
      float a = radians(150);
      float x1 = r * cos(a);
      float y1 = r * sin(a);
      
      line(0, 0, x1, y1);  
      line(0, 0, x1, -y1);
        
      pop();
    }
  }
