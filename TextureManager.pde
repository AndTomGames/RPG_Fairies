class TextureManager{
  
  private ArrayList<Texture> groundTextures;
  private ArrayList<Texture> propTextures;

  TextureManager()
  {
    this.groundTextures = new ArrayList<Texture>();
    this.propTextures = new ArrayList<Texture>();
  }
  
  public boolean loadTexture( Layer _layer, String _name, String _path, Boolean _is2D )
  {
    
    /*#############################
       Loads the textures, for now hardcoded the layers,
       will have to find out better way to do this for more layers dynamically    
     ##############################*/
    
    
    PImage t = loadImage(_path);
    if( t == null ){
      return false;
    }else{
      if( _layer == Layer.GROUND ) // Ground layer
        groundTextures.add( new Texture( _name, t, _is2D) );
      else if( _layer == Layer.PROPS ) // Prop layer. . .
        propTextures.add( new Texture( _name, t, _is2D) );
      return true;
    }
    
    /*########*/
    
  }
  
  public ArrayList<Texture> getGroundTextures()
  {
    return this.groundTextures;
  }
  
  public ArrayList<Texture> getPropTextures()
  {
    return this.propTextures;
  }

}