local Burrow = require("core.modules.Burrow");

return function( size )
  local burrow_field = display.newGroup();
  
  burrow_field.size = size or 3;
  burrow_field.burrows = {}; -- multidimentional array of burrows
  
  for row = 1, burrow_field.size do
    burrow_field.burrows[row] = {};
    
    for col = 1, burrow_field.size do
      local burrow = Burrow();
      burrow.anchorX, burrow.anchorY = 0, 0;
      burrow.x = (col - 1) * (burrow.width + 80);
      burrow.y = (row - 1) * 220;
      
      burrow_field:insert( burrow );
      burrow_field.burrows[row][col] = burrow;
      
    end
  end
  
  return burrow_field;
end