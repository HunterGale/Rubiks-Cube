void scramble()  {
  resetCube();
  int previousR = 1;
  for (int i = 0; i < 30; i++) {
    int r = int(random(allMoves.length));
    
    //This is a clunky system to prevent reverse moves back to back
    if (r == 0 || r % 2 == 0) {
      if (r == (previousR - 1)) {
        r += 1;
      }
    } else {
      if (r == (previousR + 1)) {
        r -= 1;
      }
    }
    
    Move m = allMoves[r];
    sequence.add(m);
    
    previousR = r;
  }
  
  currentMove = sequence.get(counter);
  
  currentMove.start();
}

void resetCube() {
  //Filling cube 3D array with pieces
  int index = 0;
  for (int x = -1; x <= 1; x++) { 
    for (int y = -1; y <= 1; y++) {
      for (int z = -1; z <= 1; z++) {
        
        PMatrix3D matrix = new PMatrix3D();
        
        matrix.translate(x, y, z);
        
        cube[index] = new Piece(matrix, x, y, z);
        
        index++;
        
      }
    }
  }
}
