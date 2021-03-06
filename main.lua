local _player = require("player")
local player = _player:new()
local _background = require("background")

function love.load()
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  
  _background:load()
  player:load()
  
  screenX, screenY = 0, 0
end

function love.draw()
  local camMaxX = love.graphics.getWidth()*2/3
  local camMaxY = love.graphics.getHeight()*2/3
  local camMinX = love.graphics.getWidth()*1/3
  local camMinY = love.graphics.getHeight()*1/3
  
  local translateX, translateY = 0, 0
  
  if player.x > camMaxX then
    translateX = camMaxX - player.x
  end
  if player.y > camMaxY then
    translateY = camMaxY - player.y
  end
  
   if player.x < camMinX then
    translateX = camMinX - player.x
  end
  if player.y < camMinY then
    translateY = camMinY - player.y
  end
  
  local playerScreenX, playerScreenY = 0, 0
  if translateX ~= 0  or translateY ~= 0 then
    love.graphics.push()
    love.graphics.translate(translateX, translateY) 
    _background:draw()
    player:draw()
    playerScreenX, playerScreenY = love.graphics.transformPoint(player.x,player.y)
    love.graphics.pop()
  else
    _background:draw()
    player:draw()
    playerScreenX, playerScreenY = love.graphics.transformPoint(player.x,player.y)
  end

  
  if translateX ~= 0 then
    screenX = -translateX
  end
  if translateY ~= 0 then
    screenY = -translateY
  end
  
  love.graphics.setColor(0.8, 0.50, 0.25)
  love.graphics.print("camMinX : " .. camMinX .. ", camMinY : " .. camMinY .. ", camMaxX : " .. camMaxX .. ", camMaxY : " .. camMaxY, 30, 10)
  love.graphics.print("px : " .. player.x .. ", py : " .. player.y, 30, 30)
  love.graphics.print("trX : " .. translateX .. ", trY : " .. translateY, 30, 50)
  love.graphics.print("globalX : " .. playerScreenX .. ", globalY : " .. playerScreenY, 30, 70)

end

function love.update(dt)
  player:update(dt)
end