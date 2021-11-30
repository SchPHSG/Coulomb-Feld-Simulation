//adapted from: https://github.com/vlukashevich/vector-fileds-processing
Mover mover;
float mass=1;

//Pfeile für Vektorfeld
int margin_x = 60;
int margin_y = 60;
int len = 40;
int w, h;
int cols, rows;
float off;

Cell grid[][];
PGraphics field;
PImage img;
color[][] colors;

float load1 =1;
float load2 =1;
PVector pos_load1 =new PVector(-3,0);
PVector pos_load2 = new PVector(3,0);
float load_ref = 1;
  
//Coulomb Feld berechnen, Ladungen
PVector vector__field (float x, float y, float load1, float load2,PVector pos_load1,PVector pos_load2) {
    //Mappen auf dem Bildschirm
  x = map(x, 0, width, -5,5);
  y = map(y, 0, height, -5,5);//

  float load_ref = 1;
  float u = load_ref*load1*(x-pos_load1.x)/((x-pos_load1.x)*(x-pos_load1.x)+(y-pos_load1.y)*(y-pos_load1.y))+ load_ref*load2*(x-pos_load2.x)/((x-pos_load2.x)*(x-pos_load2.x)+(y-pos_load2.y)*(y-pos_load2.y));
  float v = load_ref*load1*(y-pos_load1.y)/((x-pos_load1.x)*(x-pos_load1.x)+(y-pos_load1.y)*(y-pos_load1.y))+ load_ref*load2*(y-pos_load2.y)/((x-pos_load2.x)*(x-pos_load2.x)+(y-pos_load2.y)*(y-pos_load2.y));
  
  return new PVector(u, v);
}

PImage bg;
//Window settings
void setup () {
//Grösse Feld
  size(1000,1000);
  //fullScreen();
  background(255); //bg weiss
  
 
  cols = floor(width / len);//Anzahl Pfeile berechnen -> Oberfläche einteilen
  rows = floor(height / len);
  //sichtbares Fenster wird in Grids für Vektorpfeile unterteilt
  grid = new Cell[cols][rows];
  

  //Schleife um Vektoren in die Zellen zu füllen und anzeigen zu lassen
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Cell(i, j,load1,load2,pos_load1,pos_load2);
      grid[i][j].show();
    }
  }
  
  off += 0.;
  
  
  //Ladungen abbilden, Farbe ändern bei pos. o. neg. Ladung
  if(load1 >0){
    fill(255,0,0);
  }
  else{
    fill(0,0,255);
  }
  ellipse(map(pos_load1.x,-5,5,0,width),map(pos_load1.y,-5,5,0,height),50,50);
  
  if(load2 >0){
    fill(255,0,0);
  }
  else{
    fill(0,0,255);
  }
  ellipse(map(pos_load2.x,-5,5,0,width),map(pos_load2.y,-5,5,0,height),50,50);
  
//Speichern des abgebildeten Bild mit:
  save("test.png");
  bg = loadImage("test.png");//Lädt img damits zur Verfügung steht
  }
