Gamestate = require "lib.hump.gamestate"
require "hit"
require "player"

local menu = {}
local game = {}

function love.load()
  love.window.setMode(31*16, 31*16, {resizable=true, vsync=false, minwidth=400, minheight=300})
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
  playerMove()
  mapDetect()
  playerAim()
end

function game:draw()
  
  drawMap(levelGrid)
  love.graphics.setColor(255, 0, 0)
  love.graphics.line(player.x + 8,player.y + 16, x + 8,y + 8) -- plus and minus to create line that goes from centre instead of top right
  love.graphics.setColor(255, 255, 255)
  for i = 10, 20, 1 do
	love.graphics.draw(horbasewall.sprite, i * 16, 10 * 16)
	love.graphics.draw(horbasewall.sprite, i * 16, 20 * 16)
  end
  love.graphics.draw(player.sprite, player.x, player.y)
  love.graphics.draw(player.crosshair, x, y) -- draw the custom mouse image
end