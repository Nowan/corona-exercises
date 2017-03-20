return function()
  local color_switcher = display.newImage( "core/assets/textures/tile.png" );
  color_switcher.xScale = 1.3;
  color_switcher.yScale = 1.3;
  
  color_switcher.active_color = Color.Red;
  
  function color_switcher:nextColor()
    local next_color = (color_switcher.active_color + 1) % 3
    self:setColor( next_color );
  end
  
  function color_switcher:setColor( color_key )
    if( color_key == Color.Red ) then
      color_switcher:setFillColor( 1, 0, 0 );
    elseif( color_key == Color.Green ) then
      color_switcher:setFillColor( 0, 1, 0 );
    elseif( color_key == Color.Blue ) then
      color_switcher:setFillColor( 0, 0, 1 );
    end
    
    color_switcher.active_color = color_key;
  end
  
  function color_switcher:tap( event )
    self:nextColor();
  end
  
  color_switcher:addEventListener( "tap" );
  
  color_switcher:setColor( Color.Red );
  
  return color_switcher;
end