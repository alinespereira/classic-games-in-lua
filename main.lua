local totalTime
local gameFont
local smallFont

local windowTitle
local windowTitleWidth
local windowTitleHeight

function love.load()
    gameFont = love.graphics.newFont(40)
    smallFont = love.graphics.newFont(24)
    windowTitle = love.window.getTitle()
    windowTitleWidth = gameFont:getWidth(windowTitle)
    windowTitleHeight = gameFont:getHeight(windowTitle)

    totalTime = 0
end

function love.update(dt)
    totalTime = totalTime + dt
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    
    love.graphics.setFont(smallFont)
    love.graphics.print(string.format("Tempo: %.2fs", totalTime), 0, 0)
    
    love.graphics.setFont(gameFont)
    local windowWidth = love.graphics.getWidth()
    local windowHeight = love.graphics.getHeight()
    local titleXPos = (windowWidth - windowTitleWidth) / 2
    local titleYPos = (windowHeight - windowTitleHeight) / 2
    love.graphics.print(windowTitle, titleXPos, titleYPos)
end

