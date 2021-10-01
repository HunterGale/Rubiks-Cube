class Face {
  //Each face needs its own color and normal vector for it position
  PVector normal;
  color c;

  Face(PVector normal, color c) {
    this.normal = normal;
    this.c = c;
  }
  
  //Below functions apply a given rotation to the face along a specified axis
  //Apparently these are the transformation matrix formulas for rotating along x, y, and z. 
  //We keep one axis fixed becaused we are rotating along that axis
  void turnX(float angle) 
  {
    PVector tempVector = new PVector();
    tempVector.y = round(normal.y * cos(angle) - normal.z * sin(angle));
    tempVector.z = round(normal.y * sin(angle) - normal.z * cos(angle));
    tempVector.x = round(normal.x);
    normal = tempVector;
  }
  
  void turnY(float angle) 
  {
    PVector tempVector = new PVector();
    tempVector.x = round(normal.x * cos(angle) - normal.z * sin(angle));
    tempVector.z = round(normal.x * sin(angle) - normal.z * cos(angle));
    tempVector.y = round(normal.y);
    normal = tempVector;
  }
  
  void turnZ(float angle) 
  {
    PVector tempVector = new PVector();
    tempVector.x = round(normal.x * cos(angle) - normal.y * sin(angle));
    tempVector.y = round(normal.x * sin(angle) - normal.y * cos(angle));
    tempVector.z = round(normal.z);
    normal = tempVector;
  }
  
  
  //This function is what actually draws an individual face on top of the cube piece
  void show()
  {
    pushMatrix();
    fill(c);
    stroke(0);
    strokeWeight(0.1);
    rectMode(CENTER);
    
    translate(0.5*normal.x, 0.5*normal.y, 0.5*normal.z);
    
    //Here we have to rotate the some of the faces based on their position on the cube
    if (normal.x != 0) {
      rotateY(HALF_PI); 
    } else if (normal.y != 0) {
      rotateX(HALF_PI); 
    }
    
    
    square(0, 0, 1);
    
    popMatrix();
  }
}
