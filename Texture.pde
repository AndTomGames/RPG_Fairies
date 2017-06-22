class Texture{
  
  private String name;
  private PImage image;
  private Boolean is2D;
  
  Texture(){}
  
  Texture( String _name, PImage _image, Boolean _is2D )
  {
    this.name = _name;
    this.image = _image;
    this.is2D = _is2D;
  }
  
}