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
  
    void update() {
    oldLocation = location;
    // Compute a vector that points from location to mouse
   // PVector mouse = new PVector(mouseX,mouseY);
    PVector acceleration = coulomb_force(q1,q2,ref_q,p1,p2,location).mult(0.01/massConst);
    // Set magnitude of acceleration
    //acceleration.setMag(0.2);
    
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    // Location changes by velocity
    location.add(velocity);
  }
 
 
  void display() {
  
  stroke(255);

    strokeWeight(2);
    fill(127);

        fill(255,0,0);
   } 
    ellipse(startLocation.x,startLocation.y,30,30);
 }
 
 
 
 
 
 
 
 
 
 
 
 
