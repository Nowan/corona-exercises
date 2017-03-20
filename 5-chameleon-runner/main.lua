
content = {};
content.width = display.contentWidth;
content.height = display.contentHeight;
content.centerX = display.contentCenterX;
content.centerY = display.contentCenterY;
content.screenWidth = display.pixelHeight * (content.height / display.pixelWidth);
content.screenLeftEdge = content.centerX - content.screenWidth/2;
content.screenRightEdge = content.width + math.abs(content.screenLeftEdge);

Color = {
  Red = 0,
  Green = 1,
  Blue = 2
}

local Background = require( "core.modules.Background" );
local Level = require( "core.modules.Level" );
local Character = require( "core.modules.Character" );
local ColorSwitcher = require( "core.modules.ColorSwitcher" );

local background = Background( content.screenWidth, content.height );
background.x, background.y = content.centerX, content.centerY;

local level_data = require( "core.data.level" );
local level = Level( level_data );

local character = Character();
character.y = 370;
character.x = 100;

local color_switcher = ColorSwitcher();
color_switcher.y = content.height - 100;
color_switcher.x = content.screenLeftEdge + 100;
