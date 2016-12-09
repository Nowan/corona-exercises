-- module corresponds for handling user input in text field it attached to
-- among others, it prevents printing symbols

local operation_chars = "+-*/";
local float_chars = ".";
local number_chars = "1234567890";
local valid_chars = number_chars..float_chars..operation_chars;

return function( stringulator, event )
  if ( event.phase == "began" ) then
    
  elseif( event.phase == "editing" ) then
    -- usual flow when backspace pressed
    if( #event.text < #event.oldText ) then return end;
    
    local insertion_index = #event.text; -- index where charactere have been inserted
    local insertion_character = event.text[insertion_index]; -- inserted character
    
    for i = 1, #event.text do
      local old_char = event.oldText:sub( i, i ); -- character from old string
      local new_char = event.text:sub( i, i ); -- character from new string
      
      if (old_char ~= new_char) then
        insertion_index = i;
        insertion_character = new_char;
        break
      end
    end
    
    -- check whether inserted character is valid
    local is_character_valid = false;
    
    for valid_char in valid_chars:gmatch"." do
      if( insertion_character == valid_char) then
        is_character_valid = true;
        break;
      end
    end
    
    if not is_character_valid then
      event.target.text = event.oldText; -- ignore event
      return;
    end
    
  elseif ( event.phase == "submitted" ) then
    if( stringulator.onSubmit ) then
      local result = stringulator.onSubmit( event.target.text );
      stringulator:showResult( result );
    end
    
  end
end