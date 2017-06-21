/*#############################
## Project Name: RPG_Fairies ##
###############################*/


Cursor mouseCursor;

void setup() // Setup, called once on start
{
  
  frameRate( FPS ); // Set constant framerate
  
  fullScreen(); // Make the window fullscreen
  
  noCursor(); // Remove default cursor
  
  mouseCursor = new Cursor(); // Initialize new custom cursor
  mouseCursor.setColor( color( 112, 112, 112, 255 ) ); // Set custom cursor color
  
}


void update()
{
  
  mouseCursor.setPos( new Vector2D( mouseX, mouseY ) ); // Set custom cursor position
  
}


void draw()
{
  
  update(); // Call the update function
  
  background( color( 255, 255, 255, 255 ) ); // Draw white background over everything
  
  mouseCursor.draw(); // Draw the custom cursor
  
}