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

--------------------------------------------------------------------------------
--	Include modules
--------------------------------------------------------------------------------

local Background = require("core.modules.Background");
local Speaker = require("core.modules.Speaker");

--------------------------------------------------------------------------------
--	Initialize stage
--------------------------------------------------------------------------------

local background = Background();
background.x, background.y = content.centerX, content.centerY;

local speaker = Speaker();
speaker.x, speaker.y = content.centerX, content.centerY;