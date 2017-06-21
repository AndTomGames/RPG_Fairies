class MapManager{
  
  private HashMap<String, Map> maps;
  private Map currentMap;
  
  MapManager()
  {
    this.maps = new HashMap<String, Map>();
  }
  
  public void createMap( Vector2D _pos, Vector2D _size, String _name )
  {
    Map m = new Map( _pos, _size, _name );
    this.currentMap = m;
    this.maps.put( _name, m );
  }
  
  public HashMap<String, Map> getMaps()
  {
    return this.maps;
  }
  
  public Map getCurrentMap()
  {
    return this.currentMap;
  }
  
}