Gamestate = require "lib.hump.gamestate"

local menu = {}
local game = {}

function love.load()
  Gamestate.registerEvents()
  Gamestate.switch(game)

end

function game:enter()
  levelWidth = 50
  levelHeight = 50
  levelGrid = {}
  for x = 0, levelWidth do
      levelGrid[x] = {}
      for y = 0, levelHeight do
          levelGrid[x][y] = 0
      end
  end
    
  love.mouse.setVisible(false)
	
  player = {} -- new table
  player.sprite = love.graphics.newImage("res/steve.gif")
  player.crosshair = love.graphics.newImage("res/crosshair.gif")
  player.x = 300
  player.y = 300
  player.speed = 200
  
  tiles = {}
  tiles.basefloor = love.graphics.newImage("res/basefloortile.gif")
  tiles.containmentfloor = love.graphics.newImage("res/containmentfloortile.gif")
  tiles.dirt = love.graphics.newImage("res/dirttile.gif")
end

function drawMap(map)

  for x=0, levelWidth do
    for y=0, levelHeight do
      if levelGrid[x][y] == 1 then
	  love.graphics.draw(tiles.dirt, x*16, y*16)
      --  love.graphics.setColor(120,120,120,255)
      else
	  love.graphics.draw(tiles.basefloor, x*16, y*16)
       -- love.graphics.setColor(210,210,210,255)
      end
      --love.graphics.rectangle("fill", x*16, y*16, 16, 16)
    end
  end

end

function game:update(dt)

  if love.keyboard.isDown("a") then
    player.x = player.x - player.speed*dt
  end
  if love.keyboard.isDown("d") then
    player.x = player.x + player.speed*dt
  end
  if love.keyboard.isDown("w") then
    player.y = player.y - player.speed*dt
  end
  if love.keyboard.isDown("s") then
    player.y = player.y + player.speed*dt
  end
  
  x, y = love.mouse.getPosition( ) -- gets position of mouse
end

function game:draw()
  
  levelGrid[0][0] = 1
  levelGrid[0][1] = 1
  levelGrid[1][0] = 1
  levelGrid[0][2] = 1
  levelGrid[1][2] = 1
  levelGrid[2][0] = 1
  levelGrid[2][1] = 1
  levelGrid[2][2] = 1
  
  drawMap(levelGrid)
  
  love.graphics.setColor(255, 0, 0)
  love.graphics.line(player.x + 8,player.y + 16, x + 8,y + 8) -- plus and minus to create line that goes from centre instead of top right
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(player.sprite, player.x, player.y)
  love.graphics.draw(player.crosshair, x, y) -- draw the custom mouse image
end