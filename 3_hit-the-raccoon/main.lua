
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