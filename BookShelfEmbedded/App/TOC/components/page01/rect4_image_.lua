-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: BookTOC
--
local _M = {}
--
local _K = require "Application"
--
function _M:myMain()
end
-- not
local imageWidth             = 449/4
local imageHeight            = 222/4
local mX, mY                 = _K.ultimatePosition(431, 502)
local oriAlpha = 1
--
local imagePath = "p1/rect4.png"
--
function _M:localVars(UI)
    end
--
--[[
local info     = require ("assets.sprites.".."page1")
local sheet    = graphics.newImageSheet ( _K.spriteDir.."page1.png", _K.systemDir, info:getSheet() )
local sequence = {start=1, count= #info:getSheet().frames }
function newImageRect(name, width, height)
  local image
  if string.find(name, "background") == nil then
      image = display.newSprite(sheet, sequence)
      image.name = name
      image:setFrame (info:getFrameIndex (name))
      image.width, image.height = width, height
      else
       image = display.newImageRect(_K.imgDir..name.."."..png, _K.systemDir, width, height)
      end
   return image
end
--]]
--
function _M:localPos(UI)
  local sceneGroup  = UI.scene.view
  local layer       = UI.layer
    local function myNewImage()
    layer.rect4 = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.rect4 = newImageRect(rect4, imageWidth, imageHeight )
    if layer.rect4 == nil then return end
    layer.rect4.imagePath = imagePath
    layer.rect4.x = mX
    layer.rect4.y = mY
    layer.rect4.alpha = oriAlpha
    layer.rect4.oldAlpha = oriAlpha
    layer.rect4.blendMode = ""
    layer.rect4.oriX = layer.rect4.x
    layer.rect4.oriY = layer.rect4.y
    layer.rect4.oriXs = layer.rect4.xScale
    layer.rect4.oriYs = layer.rect4.yScale
    layer.rect4.name = "rect4"
    sceneGroup.rect4 = layer.rect4
          sceneGroup:insert( layer.rect4)
    --
    end
    myNewImage()
end
--
function _M:didShow(UI)
  local sceneGroup  = UI.scene.view
  local layer       = UI.layer
      end
--
function _M:toDispose(UI)
  local sceneGroup  = UI.scene.view
  local layer       = UI.layer
      end
--
function  _M:toDestory()
end
--
return _M