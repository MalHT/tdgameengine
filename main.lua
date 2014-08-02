Gamestate = require "lib.hump.gamestate"
require "hit"
require "player"

local menu = {}
local game = {}

function love.load()
  love.window.setMode(31*16, 31*16, {resizable=false, vsync=false, minwidth=400, minheight=300})
  Gamestate.registerEvents()
  Gamestate.switch(game)

end

function game:enter()
  levelWidth = 30
  levelHeight = 30
  levelGrid = {}
  for x = 0, levelWidth do
      levelGrid[x] = {}
      for y = 0, levelHeight do
          levelGrid[x][y] = 0
      end
  end
  for x = 0, 10 do
  levelGrid[x][10] = 1
  end
    
  love.mouse.setVisible(false)
  
  tiles = {}
  tiles.basefloor = love.graphics.newImage("res/basefloortile.gif")
  tiles.containmentfloor = love.graphics.newImage("res/containmentfloortile.gif")
  tiles.dirt = love.graphics.newImage("res/dirttile.gif")
  
  horbasewall = {}
  horbasewall.sprite = love.graphics.newImage("res/HorBaseWall.gif")
end

function drawMap(map)

  for x=0, levelWidth do
    for y=0, levelHeight do
	  love.graphics.draw(tiles.basefloor, x*16, y*16)
    end
  end

end

function game:update(dt)
  playerMove()
  mapDetect()
  playerAim()
	
  end

function game:draw()
  
  drawMap(levelGrid)
  love.graphics.setColor(255, 0, 0)
  love.graphics.line(player.x + 8,player.y + 16, x + 8,y + 8) -- plus and minus to create line that goes from centre instead of top right
  love.graphics.setColor(255, 255, 255)
  for x=0, levelWidth do
    for y=0, levelHeight do
	  if levelGrid[x][y] == 1 then
	     love.graphics.draw(horbasewall.sprite, x*16, y*16)
	  end
    end
  end
  love.graphics.draw(player.sprite, player.x, player.y)
  love.graphics.draw(player.crosshair, x, y) -- draw the custom mouse image
end