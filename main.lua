require "Player"
require "rock"
function love.load()
area = 1
ground = {450, 500, 325, 500}
player.load()
rock.load()
end

function love.update(dt)
player.update(dt)
rock.update(dt)
end

function love.draw()
love.graphics.setBackgroundColor(0,255,255)
love.graphics.setColor(0, 205, 0)
love.graphics.line (0, 550, 200, ground[1], 400, ground[2], 600, ground[3], 600, 500, 800, 500)
player.draw()
rock.draw()
end
