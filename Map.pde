class Map{
  
  private Vector2D offset;
  private Vector2D pos; // Map position in world, not yet implemented
  private Vector2D size; // Map size
  private String name; // Map name, important for MapManager
  private ArrayList<Tile> tiles;
  
  Map()
  {
    this.tiles = new ArrayList<Tile>();
    this.offset = new Vector2D( 0f, 0f );
  }

  Map( Vector2D _pos, Vector2D _size, String _name )
  {
    this.tiles = new ArrayList<Tile>();
    this.offset = new Vector2D( 0f, 0f );
    this.pos = _pos;
    this.size = _size;
    this.name = _name;
  }
  
  public void generateMap( TextureManager tm )
  {    
    // !!!!!!!!!!!!
    // The order of these cycles matter, the one on the top will be drawn first on the canvas
    
    // Ground Tiles
    for( float x=0; x < this.size.x; x++ ){
      for( float y=0; y < this.size.y; y++ ){
          
          int s = tm.getGroundTextures().size();
          
          int textureId = (int)random( s );
          
          Texture t = tm.getGroundTextures().get(textureId);
          
          this.tiles.add( new Tile( new Vector2D( x, y ), t ) );
          
      }
    }
    
    // Prop Tiles
    for( float x=0; x < this.size.x; x++ ){
      for( float y=0; y < this.size.y; y++ ){
        
        boolean shouldPlace = random(100) < 8;
        
        if( shouldPlace ){
          int s = tm.getPropTextures().size();
          
          int textureId = (int)random( s );
          
          Texture t = tm.getPropTextures().get(textureId);
          
          this.tiles.add( new Tile( new Vector2D( x, y ), t ) );
        }
        
      }
    }
     
    /*########*/
    
  }
  
  public void loadMap(){}
  
  public ArrayList<Tile> getTiles()
  {
    return this.tiles;
  }
  
  public void setOffset( Vector2D _offset )
  {
    this.offset = _offset;
  }
  
  public void addOffset( Vector2D _offset )
  {
    this.offset.x += _offset.x;
    this.offset.y += _offset.y;
  }

  public Vector2D getOffset()
  {
    return this.offset;
  }
  
  public Vector2D getSize()
  {
    return this.size;
  }


}