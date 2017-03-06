return function()
  local speaker = display.newGroup();
  
  --------------------------------------------------------------------------------
  --	Public fields
  --------------------------------------------------------------------------------
  
  speaker.offset_top = -80;
  speaker.offset_bottom = 80;
  
  --------------------------------------------------------------------------------
  --	Methods declaration
  --------------------------------------------------------------------------------
  local animateOnce, animateRecursicely;
  
  function speaker:animateOnce()
    animateOnce( self );
  end
  
  function speaker:startAnimating()
    animateRecursicely( self );
  end
  
  function speaker:stopAnimating()
    
  end
  
  function speaker:playSound()
  
  end
  
  function speaker:playMusic()
  
  end

  --------------------------------------------------------------------------------
  --	Private functions
  --------------------------------------------------------------------------------
  
  animateOnce = function( self )
    
  end
  
  animateRecursicely = function( self )

  end

  --------------------------------------------------------------------------------
  --	Display object
  --------------------------------------------------------------------------------
  
  local wood_side = display.newImage( speaker, "core/assets/textures/wood_side.png" );
  wood_side.anchorX = 0;
  wood_side.path.y1 = speaker.offset_top;
  wood_side.path.y2 = speaker.offset_bottom;
  speaker.wood_side = wood_side;
  
  local matt_side = display.newSnapshot( speaker, 187, 329 );
  matt_side.anchorX = 1;
  speaker.matt_side = matt_side;
  
  matt_side.bg = display.newImage( matt_side.group, "core/assets/textures/matt_side.png" );
  
  matt_side.bs = display.newImage( matt_side.group, "core/assets/textures/speaker.png" ); -- big speaker
  matt_side.bs.y = 60;
  
  matt_side.ss = display.newImage( matt_side.group, "core/assets/textures/speaker.png" ); -- big speaker
  matt_side.ss.width = matt_side.ss.width * 0.6;
  matt_side.ss.height = matt_side.ss.height * 0.6;
  matt_side.ss.y = -95;
  
  matt_side.path.y4 = speaker.offset_top;
  matt_side.path.y3 = speaker.offset_bottom;
  
  return speaker;
end