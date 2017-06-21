class Cursor{
  private Vector2D pos;
  private float size = 8;
  private color c = color(81, 81, 81, 255);
  
  Cursor(){}
  
  Cursor( Vector2D _pos )
  {
    this.pos = _pos;
  }
  
  Cursor( Vector2D _pos, float _size )
  {
    this.pos = _pos;
    this.size = _size;
  }
  
  Cursor( Vector2D _pos, float _size, color _c )
  {
    this.pos = _pos;
    this.size = _size;
    this.c = _c;
  }
  
  public void update()
  {
    
    this.setPos( new Vector2D( mouseX, mouseY ) ); // Set custom cursor position
    
  }
  
  public void draw()
  {
    stroke(this.c); // Fill with the cursor color
    strokeWeight(2); // Make it bigger
    line(this.pos.x - this.size / 2, this.pos.y, // Horizontal line segment
         this.pos.x + this.size / 2, this.pos.y);
    line(this.pos.x, this.pos.y - this.size / 2, // Vertical line segment
         this.pos.x, this.pos.y + this.size / 2);
  }
  
  public void setPos( Vector2D _pos )
  {
    this.pos = _pos;
  }
  
  public Vector2D getPos()
  {
    return this.pos;
  }
  
  public void setColor( color _c )
  {
    this.c = _c;
  }
  
  public color getColor()
  {
    return this.c;
  }

}