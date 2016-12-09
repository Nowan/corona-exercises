--[[

Function stringulator.onSubmit() is called when user hits "Enter" key or 
clicks on "=" button. [input] parameter contains text from input TextField.

Returning value [answer] is displayed in output TextField.

Tasks: 

-----------------------> Easy <-------------------------

1. Parse string in format [int][operator][int] and return operation result. 
Example: "4+2" -> 6; "2*2" -> 4; "512/256" -> 2; ...

2. Parse string in format [float][operator][float] / [int][operator][float] / [float][operator][int]
Example: "2.3+6.032" -> 8.332; "24.50/2" -> 12.25; "5*1.5" -> 7.25; ...

----------------------> Medium <------------------------

3. Parse string with undefined number of operands, using only operators + and -
Example: "2.5+4-13.2" -> -6.3; "5+5+5+5+5+5+5" -> 35; ...

4. Parse string with undefined number of operands, with operators +, -, *, /
Example: "2*4-4" -> 4; "-14.4/2+3.4*0" -> -7.2; ...

-----------------------> Hard <-------------------------

5. Parse string with any number of operands, with operators +, -, *, /, and braces ()
Example: "2*(4-4)" -> 0; "-((8+2)*0.2))/(20+10/2)" -> -0.08; ...

]]--

local stringulator = require("modules.Stringulator");

stringulator.onSubmit = function( input )
  print("Input: \""..input.."\"")
  
  local answer = 0.0;
  
  -- your code here
  
  return answer;
end
