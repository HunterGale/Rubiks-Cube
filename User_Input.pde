//This is my current user input solution based on real-world cubing notation with minor tweaks
void applyMove(char move) {
  switch (move) {
  case 'f': 
    currentMove = new Move(0, 0, 1, 1);
    currentMove.start();
    break;
  case 'F': 
    currentMove = new Move(0, 0, 1, -1);
    currentMove.start();
    break;  
  case 'b': 
    currentMove = new Move(0, 0, -1, -1);
    currentMove.start();
    break;
  case 'B': 
    currentMove = new Move(0, 0, -1, 1);
    currentMove.start();
    break;
  case 'u': 
    currentMove = new Move(0, -1, 0, 1);
    currentMove.start();
    break;
  case 'U': 
    currentMove = new Move(0, -1, 0, -1);
    currentMove.start();
    break;
  case 'd': 
    currentMove = new Move(0, 1, 0, -1);
    currentMove.start();
    break;
  case 'D': 
    currentMove = new Move(0, 1, 0, 1);
    currentMove.start();
    break;
  case 'l': 
    currentMove = new Move(-1, 0, 0, -1);
    currentMove.start();
    break;
  case 'L': 
    currentMove = new Move(-1, 0, 0, 1);
    currentMove.start();
    break;
  case 'r': 
    currentMove = new Move(1, 0, 0, 1);
    currentMove.start();
    break;
  case 'R': 
    currentMove = new Move(1, 0, 0, -1);
    currentMove.start();
    break;
  }
}
