//adapted from: https://github.com/vlukashevich/vector-fileds-processing



int margin_x = 60;
int margin_y = 60;
int len = 40;
int w, h;
int cols, rows;
float off;

Cell grid[][];
PGraphics field;
color[][] colors;
float load1 =1;
float load2 =1;
PVector pos_load1 =new PVector(-3,1);
PVector pos_load2 = new PVector(2,0);
float load_ref = 1;
  

PVector vector__field (float x, float y, float load1, float load2,PVector pos_load1,PVector pos_load2) {
  x = map(x, 0, width, -5,5);
  y = map(y, 0, height, -5,5);//

  float load_ref = 1;
  float u = load_ref*load1*(x-pos_load1.x)/((x-pos_load1.x)*(x-pos_load1.x)+(y-pos_load1.y)*(y-pos_load1.y))+ load_ref*load2*(x-pos_load2.x)/((x-pos_load2.x)*(x-pos_load2.x)+(y-pos_load2.y)*(y-pos_load2.y));
  float v =load_ref*load1*(y-pos_load1.y)/((x-pos_load1.x)*(x-pos_load1.x)+(y-pos_load1.y)*(y-pos_load1.y))+ load_ref*load2*(y-pos_load2.y)/((x-pos_load2.x)*(x-pos_load2.x)+(y-pos_load2.y)*(y-pos_load2.y));
  
  return new PVector(u, v);
}
