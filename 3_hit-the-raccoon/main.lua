
--------------------------------------------------------------------------------
--	Global variables
--------------------------------------------------------------------------------

content = {};
content.width = display.contentWidth;
content.height = display.contentHeight;
content.actualWidth = display.actualContentWidth;
content.actualHeight = display.actualContentHeight;
content.centerX = display.contentCenterX;
content.centerY = display.contentCenterY;
content.upperEdge = display.contentCenterY - display.actualContentHeight * 0.5;
content.lowerEdge = display.actualContentHeight;

local countdown_start = 30000;
local countdown_value = countdown_start;

local spawn_min = 2500;
local spawn_max = 4000;

points = 0;

--------------------------------------------------------------------------------
--	Include modules
--------------------------------------------------------------------------------

local Background = require("core.modules.Background");
local BurrowField = require("core.modules.BurrowField");
local UpperBar = require("core.modules.UpperBar");
local Raccoon = require("core.modules.Raccoon");

--------------------------------------------------------------------------------
--	Initialize stage
--------------------------------------------------------------------------------

local background = Background();
background.x, background.y = content.centerX, content.centerY;

local burrow_field = BurrowField();
burrow_field.x = content.centerX - burrow_field.width * 0.5;
burrow_field.y = content.centerY - burrow_field.height * 0.5;

local upper_bar = UpperBar();
upper_bar.y = content.upperEdge;

function increasePoints( value )
  points = points + value;
  upper_bar:updatePoints( points );
end

--------------------------------------------------------------------------------
--	Frame handler
--------------------------------------------------------------------------------

local random_time = math.random( countdown_start - spawn_max, countdown_start - spawn_min );

local function globalCountdown( event )
  local loop_time = event.time % countdown_start;
  countdown_value = countdown_start - loop_time;
  
  if(countdown_value < 0) then
    countdown_value = countdown_start;
  end
  
  local rand_col = math.random( 1, 3 );
  local rand_row = math.random( 1, 3 );
  
  if(countdown_value < random_time) then
    local raccoon = Raccoon( burrow_field.burrows[rand_col][rand_row] );
    raccoon:emerge();
    
    random_time = math.random( countdown_value - spawn_max, countdown_value - spawn_min );
  end
  
  upper_bar:updateTimer(math.floor((countdown_start - loop_time) / 1000));
end

Runtime:addEventListener( "enterFrame", globalCountdown );