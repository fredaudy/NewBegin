local background = {
  x = 50, y = 50
  , tilesMap = {}
  , tileset = {}
  , layer = {}
  , quads = {}
}

function background:setTilesMap()
  background.img = love.graphics.newImage("/Assets/ScrollOSpritesClean.png")
  background.tilesMap = require("/Assets/MyFirstTileMap")
  background.tileset = background.tilesMap.tilesets[1]
  background.layer = background.tilesMap.layers[1]
end

function background:setQuads()
  for y = 0, background.tileset.imageheight - background.tileset.tileheight, background.tileset.tileheight do
    for x = 0, background.tileset.imagewidth - background.tileset.tilewidth, background.tileset.tilewidth do
      table.insert(background.quads, 
        love.graphics.newQuad(
          x, 
          y, 
          background.tileset.tilewidth, 
          background.tileset.tileheight, 
          self.img:getDimensions()))
    end
  end
end

function background:load()
    background:setTilesMap()
    background:setQuads()
end

function background:draw()
  love.graphics.setColor(1,1,1)
 for y = 0, background.layer.height - 1 do
      for x = 0, background.layer.width - 1 do
        if background.layer.data[x + (y * background.layer.width) + 1] == nil then
          print("ICI")
        end
        if background.layer.data[x + (y * background.layer.width) + 1] ~= 0 then          
          love.graphics.draw(
            background.img, 
            background.quads[background.layer.data[x + (y * background.layer.width) + 1]], 
            x*background.tileset.tilewidth, 
            y*background.tileset.tileheight)
        end
      end
    end
end

return background