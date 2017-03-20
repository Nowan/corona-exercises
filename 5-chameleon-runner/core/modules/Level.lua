local Tile = require( "core.modules.Tile" );

return function( level_data )
  local level = display.newGroup();
  
  level.tiled_width = level_data.width;
  level.tiled_height = level_data.height;
  level.tile_size = level_data.tileheight;
  
  level.tiles = {};
  
  -- parse layers
  for _, layer in pairs( level_data.layers ) do
    for i = 1, #layer.data do
      if layer.data[i] == 1 then
        local row = math.floor( (i - 1) / level_data.width ) + 1;
        local col = (i - 1) % level_data.width + 1
        
        local tile = Tile( layer.name );
        tile.x = (col - 0.5) * level.tile_size;
        tile.y = (row - 0.5) * level.tile_size;
        
        tile.ilx = tile.x; -- in-level x
        tile.ily = tile.y; -- in-level y
        
        level:insert( tile );
        table.insert( level.tiles, tile );
      end
    end
  end
  
  function level:initPhysics()
    
  end
  
  function level:moveX( x )
    for _, tile in pairs( self.tiles ) do
      tile.x = tile.x + x;
    end
  end
  
  return level;
end