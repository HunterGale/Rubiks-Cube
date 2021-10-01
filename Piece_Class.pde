class Piece {

  PMatrix3D matrix;
  
  
  //Each of the 27 cube pieces has to have a location, as well as 6 faces to cover each of it's sides.
  //Obviously you can only see a maximum of 3 sides on 1 piece, so the others are all redundant, I can work
  //on this later
  int x;
  int y;
  int z;
  Face[] faces = new Face[6];
  
  Piece(PMatrix3D matrix, int x, int y, int z) {
    this.matrix = matrix;
    
    this.x = x;
    this.y = y;
    this.z = z;
    
    if (z == -1) {
      faces[0] = new Face(new PVector(0, 0, -1), color(0, 0, 255));
    } else {
      faces[0] = new Face(new PVector(0, 0, -1), color(16, 12, 8));
    }
    
    if (z == 1) {
      faces[1] = new Face(new PVector(0, 0, 1), color(0, 255, 0));
    } else {
      faces[1] = new Face(new PVector(0, 0, 1), color(16, 12, 8));
    }
    
    if (y == 1) {
      faces[2] = new Face(new PVector(0, 1, 0), color(255, 255, 255));
    } else {
      faces[2] = new Face(new PVector(0, 1, 0), color(16, 12, 8));
    }
    
    if (y == -1) {
      faces[3] = new Face(new PVector(0, -1, 0), color(255, 255, 0));
    } else {
      faces[3] = new Face(new PVector(0, -1, 0), color(16, 12, 8));
    }
    
    if (x == 1) {
      faces[4] = new Face(new PVector(1, 0, 0), color(255, 150, 0));
    } else {
      faces[4] = new Face(new PVector(1, 0, 0), color(16, 12, 8));
    }
    
    if (x == -1) {
      faces[5] = new Face(new PVector(-1, 0, 0), color(255, 0, 0));
    } else {
      faces[5] = new Face(new PVector(-1, 0, 0), color(16, 12, 8));
    }
    
  }
  
  
  //The below functions rotate every face attached to the piece along a specifed axis and direction 
  void turnFacesX(int direction) {
    for (Face f : faces) {
      f.turnX(direction*HALF_PI);
    }
  }
  
  void turnFacesY(int direction) {
    for (Face f : faces) {
      f.turnY(direction*HALF_PI);
    }
  }
  
  void turnFacesZ(int direction) {
    for (Face f : faces) {
      f.turnZ(direction*HALF_PI);
    }
  }
  
  
  //Simple function to update x, y, and z, of where our piece is located
  void update(int x, int y, int z)
  {
    matrix.reset();
    matrix.translate(x, y, z);
    
    this.x = x;
    this.y = y;
    this.z = z;
  }

  
  //This is what actually draws the "piece"
  //We really only have to draw each face
  void show() {
    
    
    pushMatrix();
    
    applyMatrix(matrix);
    
    //box(1);
    
    for (Face f : faces)
    {
      f.show();
    }
    
    popMatrix();
    
  }
}
