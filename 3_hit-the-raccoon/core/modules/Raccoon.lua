local sheet_info = require("core.assets.spritesheets.basesheet");

local image_sheet = graphics.newImageSheet( "core/assets/spritesheets/basesheet.png", 
                                            sheet_info:getSheet() );

return function( burrow )
  local raccoon = display.newRect( 0, 0, 131, 200 );
  
  raccoon.is_angry = nil;
  raccoon.is_hidden = nil;
  raccoon.hidden_y = 200;
  raccoon.exposed_y = 10;
  
  local paint = {
    calm = {
      type = "image",
      sheet = image_sheet,
      frame = sheet_info:getFrameIndex("raccoon_calm");
    },
    angry = {
      type = "image",
      sheet = image_sheet,
      frame = sheet_info:getFrameIndex("raccoon_angry");
    }
  };

  function raccoon:setAngry( flag )
    if self.is_angry == flag then return end;
    self.fill = flag and paint.angry or paint.calm;
  end
  
  function raccoon:emerge()
    if not self.is_hidden then return end;
    
    self.is_hidden = false;
    
    if self.transition then
      transition.cancel( self.transition );
      self.transition = nil;
    end
    
    self.transition = transition.to( self, { 
      y = self.exposed_y, 
      time = 700, 
      transition = easing.outQuart
    } );
  end
  
  function raccoon:hide()
    if self.is_hidden then return end;
    
    self.is_hidden = true;
    
    if self.transition then
      transition.cancel( self.transition );
      self.transition = nil;
    end
    
    self.transition = transition.to( self, { 
      y = self.hidden_y, 
      time = 500, 
      transition = easing.inQuart
    } );
  end
  
  burrow:insert( raccoon );
  raccoon.y = raccoon.hidden_y;
  
  raccoon:setAngry( false );
  raccoon:emerge();
  
  return raccoon;
end