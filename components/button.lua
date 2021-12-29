local Button = {}

function Button:new(x, y, width, height, label, func)
    local button = {
        x = x,
        y = y,
        width = width,
        height = height,
        label = label,
        func = func,
        hover = false,
        clicked = false
    }
    setmetatable(button, self)
    self.__index = self
    return button
end

function Button:setColor(rgba)
    self.color = rgba
end

function Button:setHoverColor(rgba)
    self.hoverColor = rgba
end

function Button:setFontColor(rgba)
    self.fontColor = rgba
end

function Button:setFunction(f)
    self.func = f
end

function Button:setHover(hover)
    self.hover = hover
end

function Button:checkMousePosition()
    local mouseX, mouseY = love.mouse.getPosition()
    local left = self.x
    local right = self.x + self.width
    local top = self.y
    local bottom = self.y + self.height
    return
        mouseX > 0
        and mouseX < love.graphics.getWidth()
        and mouseY > 0
        and mouseY < love.graphics.getHeight()
        and mouseX >= left
        and mouseX <= right
        and mouseY >= top
        and mouseY <= bottom
end

function Button:checkMouseClick()
    self.clicked = love.mouse.isDown(1)
    if self.hover and self.clicked then
        self.clicked = false
        self.func()
    end
end

function Button:draw()
    self:setHover(self:checkMousePosition())
    self:checkMouseClick()

    local currentR, currentG, currentB = love.graphics.getColor()
    local buttonColor

    if self.hover then
        buttonColor = self.hoverColor
    else
        buttonColor = self.color
    end

    love.graphics.setColor(buttonColor[1], buttonColor[2], buttonColor[3])
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    
    local currentFont = love.graphics.getFont()
    local textWidth = currentFont:getWidth(self.label)
    local textHeight = currentFont:getHeight(self.label)

    love.graphics.setColor(self.fontColor[1], self.fontColor[2], self.fontColor[3])
    local buttonXCenter = self.x + self.width / 2
    local buttonYCenter = self.y + self.height / 2
    local labelXPos = buttonXCenter - textWidth / 2
    local labelYPos = buttonYCenter - textHeight / 2
    love.graphics.print(self.label, labelXPos, labelYPos)
        
    love.graphics.setColor(currentR, currentG, currentB)
end


return Button
