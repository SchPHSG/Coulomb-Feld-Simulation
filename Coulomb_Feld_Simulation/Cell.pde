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
