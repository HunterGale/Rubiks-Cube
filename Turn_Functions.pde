//The below functions turn an entire "slice" of the cube! There are 3 different slices to 
//choose from on each axis and they can either be turned clockwise or counter-clockwise.
void turnZ(int index, int direction)
{
  for (int i = 0; i < cube.length; i++)
  {    
    if (cube[i].z == index)
    {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(direction*HALF_PI);
      matrix.translate(cube[i].x, cube[i].y);
      cube[i].update(round(matrix.m02), round(matrix.m12), round(cube[i].z));
      cube[i].turnFacesZ(direction);
    }  
  }
}

void turnY(int index, int direction)
{
  for (int i = 0; i < cube.length; i++)
  {    
    if (cube[i].y == index)
    {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(direction*HALF_PI);
      matrix.translate(cube[i].x, cube[i].z);
      cube[i].update(round(matrix.m02), round(cube[i].y), round(matrix.m12));
      cube[i].turnFacesY(direction);
    }  
  }
}


void turnX(int index, int direction)
{
  for (int i = 0; i < cube.length; i++)
  {    
    if (cube[i].x == index)
    {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(direction*HALF_PI);
      matrix.translate(cube[i].y, cube[i].z);
      cube[i].update(round(cube[i].x), round(matrix.m02), round(matrix.m12));
      cube[i].turnFacesX(direction);
    }  
  }
}
