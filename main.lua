local _player = require("player")
local player = _player:new()

function love.load()
    player:load()
end

function love.draw()
    player:draw()
end

function love.update(dt)
    player:update(dt)
end