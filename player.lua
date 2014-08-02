  require "hit"
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
  for x=0, levelWidth do
	  for y=0, levelHeight do
	    if levelGrid[x][y] > 0 then
		  if collisionDetect(player.x, player.y, player.width, player.height, x * 16, y * 16, 16, 16) then
		player.x = player.x + player.speed
	      end
	    end
	  end
  end
	
  end
  
  if love.keyboard.isDown("d") then
  player.x = player.x + player.speed
	for x=0, levelWidth do
	  for y=0, levelHeight do
	    if levelGrid[x][y] > 0 then
		  if collisionDetect(player.x, player.y, player.width, player.height, x * 16, y * 16, 16, 16) then
		player.x = player.x - player.speed
	      end
	    end
	  end
    end
  end
  
  if love.keyboard.isDown("w") then
  player.y = player.y - player.speed
  	for x=0, levelWidth do
	  for y=0, levelHeight do
	    if levelGrid[x][y] > 0 then
		  if collisionDetect(player.x, player.y, player.width, player.height, x * 16, y * 16, 16, 16) then
		  player.y = player.y + player.speed
	      end
	    end
	  end
    end
  end
  
  if love.keyboard.isDown("s") then
  player.y = player.y + player.speed
    for x=0, levelWidth do
	  for y=0, levelHeight do
	    if levelGrid[x][y] > 0 then
		  if collisionDetect(player.x, player.y, player.width, player.height, x * 16, y * 16, 16, 16) then
		    player.y = player.y - player.speed
	      end
	    end
	  end
    end
  end
  
  end
  
  function playerAim()
  x, y = love.mouse.getPosition( ) -- gets position of mouse
  end