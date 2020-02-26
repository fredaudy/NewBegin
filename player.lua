local player = {}
local playerProto = {
    x = 100, y = 100,
    dx = 0, dy = 0
}
local playerMT = {
    __index = playerProto
}

function player:new(p)
    p = p or {}
    setmetatable(p, playerMT)
    return p
end

function playerProto:load()
    local tiles = require("background")
    tiles:load()
    tilesQuad = tiles.quads
    self.img = tiles.img
end

function playerProto:draw(x, y)
    self.x = x or self.x
    self.y = y or self.y
    love.graphics.setColor(1, 0.5, 0.25)
    love.graphics.draw(self.img, tilesQuad[1], self.x, self.y)
end

function  playerProto:update(dt)
    if love.keyboard.isDown("up") then
        self.y = self.y - 300*dt
    end
    if love.keyboard.isDown("down") then
        self.y = self.y + 300*dt
    end
    if love.keyboard.isDown("right") then
        self.x = self.x + 300*dt
    end
    if love.keyboard.isDown("left") then
        self.x = self.x - 300*dt
    end
end

return player