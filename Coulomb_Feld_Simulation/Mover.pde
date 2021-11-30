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
  }
