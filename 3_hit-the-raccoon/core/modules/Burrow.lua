local sheet_info = require("core.assets.spritesheets.basesheet");

local image_sheet = graphics.newImageSheet( "core/assets/spritesheets/basesheet.png", 
                                            sheet_info:getSheet() );

return function( row, col )
  local burrow = display.newContainer(144, 220);
  
  burrow.image = display.newImage( burrow, image_sheet, 
                                   sheet_info:getFrameIndex("burrow"));
  burrow.image.anchorY = 1;
  burrow.image.y = burrow.height * 0.5;
  
  local mask = graphics.newMask( "core/assets/textures/burrow_mask.png" )
  burrow:setMask( mask );
  burrow.maskY = burrow.height * 0.5 - 19;
  
  return burrow;
end