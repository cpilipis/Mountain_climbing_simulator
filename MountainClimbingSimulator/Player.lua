player = {}

function player.load ()
player.x = 0
player.y = 0
player.xvel = 0
player.yvel = 0
player.jumpable = false
player.ground = 500
player.score = -1
player.hurt = false
player.hp = 100
end

function player.update(dt)
if player.hp > 0 then
player.move(dt)
player.locate()
player.injuries()
else
if love.keyboard.isDown("r") then
player.hp = 100
player.score = 0 
end
end

function player.draw()
love.graphics.setColor(255,0,0)
if player.hp > 0 then
love.graphics.rectangle("fill", player.x, player.y, 30, 50)
else
love.graphics.rectangle("fill", player.x, player.y, 50, 30)
love.graphics.setColor(0,0,0)
love.graphics.print ("You died, \n Having climbed " .. player.score .. " mountains, \n and having bravely faced boulders about " .. player.score * 5 .. " meters wide and across. \n Press R to try again at the beginning", 300, 100)
end
love.graphics.setColor(0,0,0)

if player.score > -1 then
love.graphics.print ("Mountains climbed = " .. player.score, 600, 50)
love.graphics.print (player.hp .. " health", 100, 50)
if player.score > 9 then
love.graphics.print ("You win!", 300, 300)
end
else
love.graphics.print ("Use W, A, and D to move!", 300, 200)
end
if player.score == 0 then
love.graphics.print ("Climb the mountain!" .. player.score, 300, 200)
end
end
end

function player.locate ()
if player.x < 200 then
player.ground = 550 - 100 * (player.x / 200)
elseif player.x < 400 then
player.ground = ground[1] + (ground[2] - ground[1]) * (player.x / 200 - 1)
elseif player.x < 600 then
player.ground = ground[2] + (ground[3] - ground[2]) * (player.x / 200 - 2)
elseif player.x > 600 and player.x < 800 then
player.ground = ground[4]
else
area = 2
ground = {450, 300, 100, 500}
player.x = 0
player.score = player.score + 1
rock.x = 599
rock.y = 100
rock.xvel = 0
rock.yvel = 0
rock.speed = rock.speed + 1
end
end

function player.move(dt)
if love.keyboard.isDown("d") then
player.xvel = 150
elseif love.keyboard.isDown("a") then
player.xvel = -150
else
player.xvel = 0
end
if player.y < player.ground - 50 then
player.yvel = player.yvel + 10
jumpable = false
elseif player.y > player.ground then
player.xvel = -player.xvel
jumpable = false
else
player.y = player.ground - 50
player.yvel = 0
player.jumpable = true
end
if player.jumpable == true and love.keyboard.isDown("w") then
player.y = player.y - 10
player.yvel = -300
player.jumpable = false
end
player.x = player.x + player.xvel * dt
player.y = player.y + player.yvel * dt
end

function player.injuries()
if player.x + 30 > rock.x - rock.radius and player.x < rock.x + rock.radius and player.y + 50 > rock.y and player.hurt == false then
player.hp = player.hp - rock.radius
player.hurt = true
end
end
