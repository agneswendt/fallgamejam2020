function love.load()
    require "player"
	require "platform"
	require "collisionBox"
	require "sprite"
	require "level01"

    setWorldPhysics()
	player = loadPlayer(love.graphics.getWidth()/2, love.graphics.getHeight()/2)
	level = createLevel()
end
 
function setWorldPhysics()
	love.physics.setMeter(32)
	world = love.physics.newWorld(0, 9.82*64, true)
	world:setCallbacks(beginContact, endContact, preSolve, postSolve)
	objects = {}
end

function love.update(dt)
	world:update(dt)
	player.update(dt)
	updatePlatforms(dt)
end

function updatePlatforms(dt)
	for i,pl in ipairs(level.platforms) do
		pl.update(dt)
	end
end

function love.draw()
	drawPlatforms()
	player.draw()
	level.draw()
end

function drawPlatforms()
	for i,pl in ipairs(level.platforms) do
		pl.draw()
	end
end
