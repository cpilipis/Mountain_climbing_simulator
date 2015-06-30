rock = {}

function rock.load()
rock.radius = 0
rock.x = 599
rock.y = 0
rock.xvel = 0
rock.yvel = 0
rock.ground = 300
rock.speed = 5
end

function rock.update (dt)
rock.grounded()
if player.score > 0 and player.score < 10 then
rock.radius = player.score * 5
rock.xvel = rock.xvel - rock.speed
rock.x = rock.x + rock.xvel * dt
rock.y = rock.ground
end
if rock.x < -500 then
rock.x = 600
rock.y = 100
rock.xvel = 0
player.hurt = false
end
end

function rock.draw()
if player.score > 0 and player.score < 10 then
love.graphics.setColor(100,100,100)
love.graphics.circle("fill", rock.x, rock.y, rock.radius, 50)
end
end

function rock.grounded()
if rock.x < 200 then
rock.ground = 550 - 100 * (rock.x / 200) - rock.radius
elseif rock.x < 400 then
rock.ground = ground[1] + (ground[2] - ground[1]) * (rock.x / 200 - 1) - rock.radius
elseif rock.x < 600 then
rock.ground = ground[2] + (ground[3] - ground[2]) * (rock.x / 200 - 2) - rock.radius
elseif rock.x > 600 and rock.x < 800 then
rock.ground = ground[4]
end
end
