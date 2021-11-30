// Adapted from https://processing.org/examples/accelerationwithvectors.html


class Mover {

  // The Mover tracks location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector acceleration;
  // The Mover's maximum speed
  float topspeed;
  float q1;
  float q2;
  float ref_q;
  PVector p1;
  PVector p2; 
  PVector oldLocation;
  PVector startLocation;
  float massConst;

  Mover(float ref_load,float load1, float load2, PVector pos_load1,PVector pos_load2, float mass, PVector inputStartVector) {
    // Start in the center
    //  location = new PVector(width/2,height/2);
    location =inputStartVector;
    oldLocation = location;
    startLocation =new PVector( map(location.x,-5,5,0,width),map(location.y,-5,5,0,height));
    
    velocity = new PVector(0,0);
    topspeed = 5;
     q1 = load1;
     q2 = load2;
    p1 = pos_load1;
    p2 = pos_load2;
    ref_q =ref_load;
    massConst = mass;
  }
 
//Berechnung der Bewegung aufgrund der Ladungen, x=F/m, Abhängig von
  PVector coulomb_force(float load1,float load2, float load_ref,PVector pos1, PVector pos2, PVector pos_ref){
 //Formel Coulombfeld, res Vektor einzeln Berechnen für jede stationäre Ladung
  PVector forceVector1 = PVector.sub(pos_ref,pos1).mult(load1*load_ref).div(pow(PVector.dist(pos1,pos_ref),1.5));
  PVector forceVector2 = PVector.sub(pos_ref,pos2).mult(load2*load_ref).div(pow(PVector.dist(pos2,pos_ref),1.5));
  //ein Vektor aus den zwei res. Vektoren Loads
  PVector totalForceVector = forceVector1.add(forceVector2);
  return totalForceVector;
}

//Berechnung der neuen Position des Movers
    void update() {
    oldLocation = location;
    // Compute a vector that points from location to mouse
   // PVector mouse = new PVector(mouseX,mouseY);
    PVector acceleration = coulomb_force(q1,q2,ref_q,p1,p2,location).mult(0.01/massConst);
   // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    // Location changes by velocity
    location.add(velocity);
  }
 
// Anzeigen der Probeladung 
  void display() {
  
  stroke(255);
    // Zeichnen des Movers
    strokeWeight(2);
    fill(127);
    //Farbe Mover
    if(ref_q >0){
    fill(255,0,0);
}

  else{
    fill(0,0,255);
}
     //Mapping auf den Bildschirm
    translate(  map(location.x,-5,5,0,width)-startLocation.x, map(location.y,-5,5,0,width)-startLocation.y);
    ellipse(startLocation.x,startLocation.y,30,30);
  }
}
 
 
 
 
 
 
 
 
 
 
 
 
