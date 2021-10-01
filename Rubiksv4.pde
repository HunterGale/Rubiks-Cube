import peasy.*;

PeasyCam cam;

boolean scrambleOver = false;
boolean resetOver = false;
int sButtonX = 25, sButtonY = 25, sButtonL = 150, sButtonW = 50;
int rButtonX = 25, rButtonY = 100, rButtonL = 150, rButtonW = 50;
color sColor = color(255);
color sHighlightColor = color(190);

Move[] allMoves = new Move[] {
  new Move(0, 1, 0, 1), 
  new Move(0, 1, 0, -1), 
  new Move(0, -1, 0, 1), 
  new Move(0, -1, 0, -1), 
  new Move(1, 0, 0, 1), 
  new Move(1, 0, 0, -1), 
  new Move(-1, 0, 0, 1), 
  new Move(-1, 0, 0, -1), 
  new Move(0, 0, 1, 1), 
  new Move(0, 0, 1, -1), 
  new Move(0, 0, -1, 1), 
  new Move(0, 0, -1, -1) 
};

ArrayList<Move> sequence = new ArrayList<Move>();
int counter = 0;


//Here we're making an array to store every piece of the rubik's cube
//A 3X3 will have 27 pieces. You can't see the center piece...
//which is a redudancy that can be coded out
int cubeSize = 3;
Piece[] cube = new Piece[cubeSize*cubeSize*cubeSize];

Move currentMove = new Move(0, 0, 0, 0);

void setup() {
  
  //Setting up Window
  size(1920,1080,P3D);
  
  //Setting up Camera
  cam = new PeasyCam(this, 300);
  
  cam.setResetOnDoubleClick(false);
  
  cam.setMinimumDistance(250);
  cam.setMaximumDistance(1000);  // clamping zoom in/out for orbit camera
  
  
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


void keyPressed() {
  if (!currentMove.animating) {
    applyMove(key); 
  }
}

void mousePressed() {
  if (!currentMove.animating) {
    if (scrambleOver) {
    scramble();
  }
  if (resetOver) {
    resetCube();
  } 
  }
}


void draw() {
 
  
  
  background(51);
  scale(50);
  
  
  //We're going to constantly show each cube piece in the cube array for rest of program, even if they are mid-animation
  currentMove.updateState();
  if (currentMove.finished) {
    if (counter < sequence.size()-1) {
      counter++;
      currentMove = sequence.get(counter);
      currentMove.start();
    }
  }
  
  // Utility methods to permit the use of a Heads-Up Display
  cam.beginHUD();
  update(mouseX, mouseY);
  if (!currentMove.animating) {
    if (scrambleOver) {
    fill(sHighlightColor);
    } else {
    fill(sColor);
    } 
  } else {
    fill(sHighlightColor);
  } 
  stroke(0);
  strokeWeight(3);
  rect(sButtonX, sButtonY, sButtonL, sButtonW);
  
  if (!currentMove.animating) {
    if (resetOver) {
    fill(sHighlightColor);
    } else {
    fill(sColor);
    } 
  } else {
    fill(sHighlightColor);
  } 
  stroke(0);
  strokeWeight(3);
  rect(rButtonX, rButtonY, rButtonL, rButtonW);
  
  rectMode(CENTER);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(26); 
  text("Scramble", (sButtonX + (sButtonL / 2)), (sButtonY + (sButtonW / 2)));
  text("Reset", (rButtonX + (rButtonL / 2)), (rButtonY + (rButtonW / 2)));
  rectMode(CORNER);
  cam.endHUD(); // always!

}
