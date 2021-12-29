local MainMenu = require "modules/menu/mainMenu"

local totalTime
local gameFont

function love.load()
    MainMenu:load()
    gameFont = love.graphics.newFont(24)

    totalTime = 0
end

function love.update(dt)
    totalTime = totalTime + dt
end

function love.draw()    
    love.graphics.setFont(gameFont)
    MainMenu:draw()
end

