local sheet_info = require("core.assets.spritesheets.basesheet");

local image_sheet = graphics.newImageSheet( "core/assets/spritesheets/basesheet.png", 
                                            sheet_info:getSheet() );

local createTimeIndicator, createPointsIndicator; -- methods declaration

local function Constructor()
  local upper_bar = display.newContainer( content.width, 140 );
  upper_bar.anchorX, upper_bar.anchorY = 0, 0;
  upper_bar.anchorChildren = false;
  
  function upper_bar:updateTimer( value )
    self.time_indicator.label.text = tostring( value );
  end
  
  function upper_bar:updatePoints( value )
    self.points_insicator.label.text = tostring( value );
  end
  
  local time_indicator = createTimeIndicator();
  time_indicator.x = 35;
  time_indicator.y = upper_bar.height * 0.5;
  
  local points_indicator = createPointsIndicator();
  points_indicator.x = upper_bar.width - points_indicator.width - 40;
  points_indicator.y = upper_bar.height * 0.5;
  
  upper_bar.time_indicator = time_indicator;
  upper_bar:insert( time_indicator );
  
  upper_bar.points_indicator = points_indicator;
  upper_bar:insert( points_indicator );
  
  return upper_bar;
end

createTimeIndicator = function()
  local time_indicator = display.newGroup();

  time_indicator.icon = display.newImage( time_indicator, image_sheet, 
                                          sheet_info:getFrameIndex("timer_icon"));
  time_indicator.icon.anchorX = 0;
  
  time_indicator.label = display.newText( { 
    parent = time_indicator,
    text = "00:00",
    x = time_indicator.icon.width + 25,
    font = "LuckiestGuy.ttf",
    fontSize = 64 
  } );
  time_indicator.label.anchorX = 0;
  time_indicator.label:setFillColor( 225/255, 244/255, 172/255 );
  
  return time_indicator;
end

createPointsIndicator = function()
  local points_indicator = display.newGroup();

  points_indicator.icon = display.newImage( points_indicator, image_sheet, 
                                            sheet_info:getFrameIndex("raccoon_icon"));
  points_indicator.icon.anchorX = 0;
  
  points_indicator.label = display.newText( { 
    parent = points_indicator,
    text = "0",
    x = 0,
    width = 80,
    font = "LuckiestGuy.ttf",
    fontSize = 64,
    align = "right"
  } );
  points_indicator.label.anchorX = 0;
  points_indicator.label:setFillColor( 225/255, 244/255, 172/255 );
  
  points_indicator.icon.x = points_indicator.label.width + 15;
  
  return points_indicator;
end

return Constructor;