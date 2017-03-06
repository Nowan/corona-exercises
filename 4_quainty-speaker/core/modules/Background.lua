return function( width, height )
  -- set up default values for width and height if they're not provided
  width = width or content.actualWidth;
  height = height or content.actualHeight;
  
  local background = display.newRect( 0, 0, width, height );
  
  local paint = {
    type = "gradient",
    color1 = { 135/255 },
    color2 = { 236/255 },
    direction = "up"
  }
  
  background.fill = paint;
  
  return background;
end