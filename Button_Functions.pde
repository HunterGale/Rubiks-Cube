void update(int x, int y) {
  if (overScrambleButton(x, y)) {
    scrambleOver = true;
  } else {
    scrambleOver = false;
  } 
  
  if (overResetButton(x, y)) {
    resetOver = true;
  } else {
    resetOver = false;
  }
}

boolean overScrambleButton(int x, int y) {
  boolean checkX = false;
  boolean checkY = false;
  
  if ((x > sButtonX) && (x < (sButtonX + sButtonL))) {
    checkX = true;
  }
  
  
  if ((y > sButtonY) &&(y < (sButtonY + sButtonW))) {
    checkY = true;
  }
  
  
  if (checkX && checkY) {
    return true;
  } else {
    return false;
  }
}

boolean overResetButton(int x, int y) {
  boolean checkX = false;
  boolean checkY = false;
  
  if ((x > rButtonX) && (x < (rButtonX + rButtonL))) {
    checkX = true;
  }
  
  
  if ((y > rButtonY) &&(y < (rButtonY + rButtonW))) {
    checkY = true;
  }
  
  
  if (checkX && checkY) {
    return true;
  } else {
    return false;
  }
}
