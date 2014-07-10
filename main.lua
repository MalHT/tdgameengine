function love.load()
  levelWidth = 50
  levelHeight = 50
  levelGrid = {}
  for x = 0, levelWidth do
      levelGrid[x] = {}
      for y = 0, levelHeight do
          levelGrid[x][y] = 0
      end
  end
    
    
    
  player = {} -- new table
  player.x = 300
  player.y = 300
  player.speed = 300
end

function drawMap(map)

  for x=0, levelWidth do
    for y=0, levelHeight do
      if levelGrid[x][y] == 1 then
        love.graphics.setColor(0,128,0,255)
      else
        love.graphics.setColor(255,0,0,255)
      end
      love.graphics.rectangle("fill", x*16, y*16, 16, 16)
    end
  end

end

function love.update(dt)

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
end

function love.draw()
  
  levelGrid[0][0] = 1
  levelGrid[0][1] = 1
  levelGrid[1][0] = 1
  levelGrid[0][2] = 1
  levelGrid[1][2] = 1
  levelGrid[2][0] = 1
  levelGrid[2][1] = 1
  levelGrid[2][2] = 1
  
  drawMap(levelGrid)
  
  love.graphics.setColor(255,255,0,255)
  love.graphics.circle("fill", player.x, player.y, 16)
end