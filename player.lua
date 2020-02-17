local player = {}
local playerProto = {
    x = 100, y = 100
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
    self.img = love.graphics.newImage("/Assets/ScrollOSprites.png")
    self.top_left = love.graphics.newQuad(64, 192, 32, 32, self.img:getDimensions())
end

function playerProto:draw(x, y)
    self.x = x or self.x
    self.y = y or self.y
    love.graphics.draw(self.img, self.top_left, self.x, self.y)
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