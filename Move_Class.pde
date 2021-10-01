class Move {
  float angle = 0;
  int x;
  int y;
  int z;
  int direction;
  boolean animating;
  boolean finished;

  Move(int x, int y, int z, int direction) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.direction = direction;
  }
  
  void start() {
    animating = true;
    finished = false;
  }
  
  void updateState() {
    if (animating) {
      angle += direction * 0.08;
      
      //This code tests to see if the animation has completed turned the slice 90 degrees
      //If it has, we stop the animation and "turn" the cube pieces to where they need to be
      if (abs(angle) > HALF_PI) {
        angle = 0;
        animating = false;
        finished = true;
        if (x != 0) {
          turnX(x, direction);
        } else if (y != 0) {
          turnY(y, direction);
        } else if (z != 0) {
          turnZ(z, direction);
        }
      }
    }
    
    for (int index = 0; index < cube.length; index++) {
    push();
    
    //This code will rotate each cube piece slightly if we are mid-animation
    //Remember... this is getting ran once per frame so we only move the pieces a little at a time
    if (animating) {
      if (cube[index].z != 0 && cube[index].z == this.z) {
        rotateZ(this.angle);
      } else if (cube[index].x != 0 && cube[index].x == this.x) {
        rotateX(this.angle);
      } else if (cube[index].y != 0 && cube[index].y == this.y) {
        rotateY(-this.angle);
      }
    }
    
    //This code then draws each cube piece on the screen
    cube[index].show();  
    
    pop();
    }
  }
}
