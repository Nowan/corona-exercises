-- parent table
local stringulator = {};

-- include module "widget", which allows to create all kind of 
-- user controls - buttons, sliders, spinners, pickers, etc.
local widget = require("widget"); 
widget.setTheme( "widget_theme_android_holo_light" );

-- global variable storing size and center point of content area 
-- ( just for convenience )
content = {
  centerX = display.contentCenterX,
  centerY = display.contentCenterY,
  width = display.contentWidth,
  height = display.contentHeight
};

-- set default anchor position to upper left corner
display.setDefault( "anchorX", 0 ); 
display.setDefault( "anchorY", 0 );

---------------------------------------------------------------
-- Functions
---------------------------------------------------------------

function stringulator:showResult( result )
  self.output_field.text = tostring( result );
end

local function createButton( title, pos_x, pos_y, w, h, releaseCallback )
  local button = widget.newButton( {
    x = pos_x,
    y = pos_y,
    width = w,
    height = h,
    label = title,
    onRelease = releaseCallback
  } );

  button.text = title;
  return button;
end

local function onRegularButtonReleased( event )
  stringulator.input_field.text = stringulator.input_field.text..event.target.text;
end

local function onEraseButtonReleased( event )
  stringulator.input_field.text = "";
  stringulator.output_field.text = "0";
end

local function onSubmitButtonReleased( event )
  if(stringulator.onSubmit) then
    local result = stringulator.onSubmit( stringulator.input_field.text );
    stringulator:showResult( result );
  end
end

---------------------------------------------------------------
-- Display objects
---------------------------------------------------------------

stringulator.input_field = native.newTextField( 0, 0, content.width - 120, 50 );
local inputListener = require("modules.InputListener");
stringulator.input_field:addEventListener( "userInput", 
  function(event) 
    inputListener( stringulator, event ); 
  end );

stringulator.output_field = native.newTextField( content.width, 0, 90, 50 );
stringulator.output_field.text = "0";
stringulator.output_field.anchorX = 1;


local _equals_label = display.newText( {
    text = "=",     
    x = stringulator.input_field.width,
    y = 13,
    width = 30,
    height = stringulator.input_field.height,
    font = native.systemFont,   
    fontSize = 20,
    align = "center"  -- Alignment parameter
} );

local button_size = content.width / 3;

-- init numeric buttons
local num_buttons = {};
for i = 0, 9 do 
  local x = (i % 3) * button_size;
  local y = 50 + math.floor(i/3) * button_size;
  num_buttons[i + 1] = createButton( tostring((i + 1) % 10), 
                                     x, y, button_size, button_size, 
                                     onRegularButtonReleased );
end

local erace_button = createButton( 'c', button_size, num_buttons[10].y,
                                    button_size / 2, button_size / 2, 
                                    onEraseButtonReleased );
                                        
local float_button = createButton( '.', button_size, erace_button.y + button_size / 2,
                                    button_size / 2, button_size / 2, 
                                    onRegularButtonReleased );

local operations = "+*-/";
local operation_buttons = {};
for i = 0, #operations - 1 do
  local x = erace_button.x + button_size / 2 + (i % 2) * button_size / 2;
  local y = erace_button.y + math.floor(i / 2) * button_size / 2;
  operation_buttons[i + 1] = createButton( operations:sub( i + 1, i + 1 ), x, y, 
                                           button_size / 2, button_size / 2, 
                                           onRegularButtonReleased );
end

local equals_button = createButton( '=', 
                                    operation_buttons[2].x + button_size / 2, 
                                    erace_button.y,
                                    button_size / 2, button_size, 
                                    onSubmitButtonReleased );

return stringulator;