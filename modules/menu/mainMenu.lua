local MainMenu = {}

local Button = require "components/button"
local Colors = require "components/colors"

local BUTTON_WIDTH = 100
local BUTTON_HEIGHT = 32

function MainMenu:load()
    self.buttons = {}

    table.insert(self.buttons,
        Button:new(300, 284, BUTTON_WIDTH, BUTTON_HEIGHT, "Exit", function()
            print("Exit")
            love.event.quit(0)
        end)
    )

    for _, button in ipairs(self.buttons) do
        button:setColor(Colors.gray.lighter)
        button:setHoverColor(Colors.gray.dark)
        button:setFontColor(Colors.white.medium)
    end
end

function MainMenu:update(dt)
end

function MainMenu:draw()
    for _, button in ipairs(self.buttons) do
        button:draw()
    end
end

return MainMenu
