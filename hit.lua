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