return function( color )
  local tile = display.newImage( "core/assets/textures/tile.png" );
  
  if( color == "red" ) then
    tile:setFillColor( 1, 0, 0 );
    tile.color = Color.Red;
    
  elseif( color == "green" ) then
    tile:setFillColor( 0, 1, 0 );
    tile.color = Color.Green;
    
  elseif( color == "blue" ) then
    tile:setFillColor( 0, 0, 1 );
    tile.color = Color.Blue;
    
  end
  
  function tile:initPhysics()
    
  end
  
  return tile;
end