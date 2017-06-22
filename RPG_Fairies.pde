/*#############################
## Project Name: RPG_Fairies ##
###############################*/

MapManager mapManager;
TextureManager textureManager;

Cursor mouseCursor;

void setup() // Setup, called once on start
{
  
  frameRate( FPS ); // Set constant framerate
  
  fullScreen(P2D); // Make the window fullscreen
  
  noCursor(); // Remove default cursor
  
  mouseCursor = new Cursor( new Vector2D( width/2, height/2 ), 12 ); // Initialize new custom cursor
  mouseCursor.setColor( color( 80, 80, 80, 255 ) ); // Set custom cursor color
  
  mapManager = new MapManager(); // Initiliaze the MapManager
  textureManager = new TextureManager(); // Initiliaze the TextureManager
  load_textures(); // Call the function which loads the textures
  
  mapManager.createMap( new Vector2D( 0, 0 ) , new Vector2D( 100, 100 ) , "Fairies Land" ); // Create map
  
  for( int s = 0; s < mapManager.getMaps().keySet().toArray().length; s++ ) // For every map do:
  {
    
    Map m = mapManager.getMaps().get(mapManager.getMaps().keySet().toArray()[s]); // Get Map
    m.generateMap( textureManager ); // Generate Random Map, later will be replaced with function to load map from file
    
    // Sets the maps offset to position it in the center of the screen, depending on the map size
    m.setOffset( new Vector2D( -( m.getSize().x * m.getTiles().get(0).texture.image.width ) /2,
                               -( m.getSize().y * m.getTiles().get(0).texture.image.height ) /2 ) );
    
  }
  
}

void load_textures() // Load some textures
{
  
  textureManager.loadTexture( Layer.GROUND ,"grass" , "textures/grass_patch.png" );
  textureManager.loadTexture( Layer.GROUND, "dirt" , "textures/dirt_patch.png" );
  textureManager.loadTexture( Layer.PROPS, "bush" , "textures/bush_patch.png" );
  
}

void update()
{
  
  // Nothing here yet, will be used to call object update method
  
}


void draw_out_map()
{
  
  Map currentMap = mapManager.getCurrentMap(); // Get current loaded map
  for( Tile tile : currentMap.getTiles()) // For every tile on this map do:
  {
    /*
    Vector2D pos = new Vector2D( currentMap.getOffset().x + t.pos.x * t.texture.image.width, // Get the tile position
                                 currentMap.getOffset().y + t.pos.y * t.texture.image.height );
    Vector2D size = new Vector2D( t.texture.image.width, t.texture.image.height ); // get the tile size from texture
    
    // #####################
    // # pos.cartToIso(); // Enable this to make it cool xDD
    // #####################
    
    
    image( t.texture.image, pos.x, pos.y, size.x, size.y ); // Draw the image
    noFill(); // Remove fill color
    stroke( color( 0, 0, 0, 255 ) ); // Make it black
    strokeWeight( 1 ); // Make it slim
    rect( pos.x, pos.y, size.x, size.y ); // Draw the borders of each image just for better viewability
    */
    
    // get position of top corner
    Vector2D isoPos = new Vector2D( currentMap.getOffset().x + tile.pos.x * tile.texture.image.width, // Get the tile position
                                    currentMap.getOffset().y + tile.pos.y * tile.texture.image.height );
    isoPos.cartToIso();
    
    // get position of left corner
    Vector2D isoPosLeft = new Vector2D( currentMap.getOffset().x + tile.pos.x * tile.texture.image.width, // Get the tile position
                                        currentMap.getOffset().y + (tile.pos.y+1) * tile.texture.image.height );
    isoPosLeft.cartToIso();
    
    // get position of right corner
    Vector2D isoPosRight = new Vector2D( currentMap.getOffset().x + (tile.pos.x+1) * tile.texture.image.width, // Get the tile position
                                         currentMap.getOffset().y + tile.pos.y * tile.texture.image.height );
    isoPosRight.cartToIso();
    
    // get position of bottom corner
    Vector2D isoPosEnd = new Vector2D( currentMap.getOffset().x + (tile.pos.x+1) * tile.texture.image.width, // Get the tile position
                                       currentMap.getOffset().y + (tile.pos.y+1) * tile.texture.image.height );
    isoPosEnd.cartToIso();
    
    /*########*/
    
    // draw the tile
    beginShape();
    texture(tile.texture.image);   // set background texture of shape
    vertex(isoPos.x, isoPos.y, 0, 0); // set top vertex
    vertex(isoPosLeft.x, isoPosLeft.y, tile.texture.image.width, 0); // set left vertex
    vertex(isoPosEnd.x, isoPosEnd.y, tile.texture.image.width, tile.texture.image.height); // set bottom vertex
    vertex(isoPosRight.x, isoPosRight.y, 0, tile.texture.image.height); // set right vertex
    endShape(CLOSE);
  }
  
}


void draw()
{
  
  update(); // Call the update function
  
  clear(); // Clears the screen
  
  background( color( 255, 255, 255, 255 ) ); // Draws white background
  
  draw_out_map(); // Call the function that draws the current map
  
  mouseCursor.draw(); // Draw the custom cursor
  
  fill( color( 60, 80, 255, 255 ) ); // Make it visible
  textSize( 18 ); // Set the text size
  text( frameRate, 0, 20 ); // Draw FPS text
  
}

void keyPressed()
{
  
  // Some mockup for map control movement, will be definitely be changed later
  
  if( key == 'w' ){ 
    mapManager.getCurrentMap().addOffset( new Vector2D( 0f, 20f ) );
  } else if( key == 's' ){
    mapManager.getCurrentMap().addOffset( new Vector2D( 0f, -20f ) );
  }
  if( key == 'a' ){
    mapManager.getCurrentMap().addOffset( new Vector2D( 20f, 0f ) );
  } else if( key == 'd' ){
    mapManager.getCurrentMap().addOffset( new Vector2D( -20f, 0f ) );
  }
  
}

void mouseDragged()
{
  mouseCursor.update(); // Update the cursor position
}

void mouseMoved()
{  
  mouseCursor.update(); // Update the cursor position 
}