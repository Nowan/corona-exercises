return function( width, height )
  width = width or display.contentWidth;
  height = height or display.contentHeight;
  
  
  local background = display.newContainer( width, height );
  
  local hw, hh = width * 0.5, height * 0.5;
  
  background.layers = {};
  
  display.setDefault( "anchorY", 1 );
  
  background.layers[1] = display.newRect( background, 0, hh, width, height ); 
  background.layers[1]:setFillColor( 75/255, 175/255, 221/255 );
  
  background.layers[2] = display.newRect( background, 0, hh, width, height * 0.45 ); 
  background.layers[2]:setFillColor( 70/255, 164/255, 208/255 );
  
  background.layers[3] = display.newRect( background, 0, hh, width, height * 0.25 ); 
  background.layers[3]:setFillColor( 58/255, 152/255, 196/255 );
  
  background.layers[4] = display.newRect( background, 0, hh, width, height * 0.1 ); 
  background.layers[4]:setFillColor( 48/255, 144/255, 188/255 );
  
  display.setDefault( "anchorY", 0.5 );
  
  return background;
end