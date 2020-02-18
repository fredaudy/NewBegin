local _player = require("player")
local player = _player:new()
local _background = require("background")

function love.load()
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  --player:load()
  _background:load()
end

function love.draw()
  --player:draw()
  _background:draw()
end

function love.update(dt)
    --player:update(dt)
end