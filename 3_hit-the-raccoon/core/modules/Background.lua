return function( width, height )
  -- set up default values for width and height if they're not provided
  width = width or content.actualWidth;
  height = height or content.actualHeight;
  
  local background = display.newContainer( width, height );
  
  local main_fill = display.newRect( background, 0, 0, width, height );
  main_fill:setFillColor( 159/255, 199/255, 45/255 );
  
  local sub_fill_1 = display.newRect( background, 0, height * 0.35, width, height * 0.3 );
  sub_fill_1:setFillColor( 148/255, 186/255, 39/255 );
  
  local sub_fill_2 = display.newRect( background, 0, height * 0.48, width, height * 0.04 );
  sub_fill_2:setFillColor( 136/255, 173/255, 31/255 );
  
  return background;
end