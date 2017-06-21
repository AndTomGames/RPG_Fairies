class Tile{
  
  private Vector2D pos;
  private Texture texture;
  private float globalLightLevel = 0.0f; // Lighting not yet implemented
  private float tileLightLevel = 0.0f; // Lighting not yet implemented
  
  Tile(){}
  
  Tile( Vector2D _pos, Texture _texture){
    this.pos = _pos;
    this.texture = _texture;
  }

}