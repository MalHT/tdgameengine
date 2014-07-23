  player = {} -- new table
  player.sprite = love.graphics.newImage("res/steve.gif")
  player.crosshair = love.graphics.newImage("res/crosshair.gif")
  player.x = 300
  player.y = 250
  player.speed = 1
  player.width = 16
  player.height = 32
  
  function playerMove()
  --movement of player character system
  if love.keyboard.isDown("a") then
    player.x = player.x - player.speed
  end
  if love.keyboard.isDown("d") then
    player.x = player.x + player.speed
  end
  if love.keyboard.isDown("w") then
    player.y = player.y - player.speed
  end
  if love.keyboard.isDown("s") then
    player.y = player.y + player.speed
  end
  
  end
  
  function playerAim()
  x, y = love.mouse.getPosition( ) -- gets position of mouse
  end