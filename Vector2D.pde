class Vector2D{ // Better than to have X and Y for everything
  float x;
  float y;
  
  Vector2D(){}
  
  Vector2D( float _x, float _y )
  {
    this.x = _x;
    this.y = _y;
  }
  
  void cartToIso()
  {
    float nx = ( this.x - this.y );
    float ny = ( this.x + this.y ) / 2;
    
    this.x = nx;
    this.y = ny;
  }


}