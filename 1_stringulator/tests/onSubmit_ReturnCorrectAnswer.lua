local test = { levels = {} };

test.levels.easy = {
  { "4+2", 6 },
  { "2*2", 4 },
  { "020-40", -20 },
  { "-4+4", 0 },
  { "512/256", 2 },
  { "2.3+6.032", 8.332 },
  { "24.50/2", 12.25 },
  { "5*0.5", 2.5 }
};

test.levels.medium = {
  { "2.5+4-13.2", -6.3 },
  { "5+5+5+5+5+5+5", 35 },
  { "2*4-4", 4 },
  { "-14.4/2+3.4*0", -7.2 }
};

test.levels.hard = {
  { "2*(4-4)", 0 },
  { "-((8+2)*0.2)/(20+10/2)", -0.08 }
};

function test:run( onSubmit, level )
  if not onSubmit then return end;
  level = level or "easy";
  
  for _, unit in pairs( self.levels[level] ) do
    local input_string = unit[1];
    local expected_answer = unit[2];
    local returned_answer = onSubmit( input_string );
    
    local is_test_passed = returned_answer == expected_answer;
    
    local message = "------------------------\n";
    message = message.."Testing \""..input_string.."\" -> "..expected_answer.."\n";
    message = message..tostring(is_test_passed):upper();
    message = is_test_passed and message or message.." (got "..returned_answer..")";
    
    print( message );
  end
end

return test;