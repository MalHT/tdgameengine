function mapDetect()
	if player.x < 0 then
	player.x = 0
	end
	if player.y < 0 then
	player.y = 0
	end
	if player.y + player.sprite:getHeight() > 496 then
	player.y = 496 - player.sprite:getHeight()
	end
	if player.x + player.sprite:getWidth() > 496 then
	player.x = 496 - player.sprite:getWidth()
	end
end

function collisionDetect(ax1, ay1, aWidth, aHeight, bx1, by1, bWidth, bHeight)
ax2 = ax1 + aWidth
ay2 = ay1 + aHeight
bx2 = bx1 + bWidth
by2 = by1 + bHeight
return ax1 < bx2 and ax2 > bx1 and ay1 < by2 and ay2 > by1
end

function LevelDetect()
	collide = false
	for x=0, levelWidth do
	  for y=0, levelHeight do
	    if levelGrid[x][y] > 0 then
	     collide = collisionDetect(player.x, player.y, player.width, player.height, x * 16, y * 16, 16, 16)
	    end
	  end
    end
	return collide
end