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
local mX, mY                 = _K.ultimatePosition(1489, 777)
local oriAlpha = 1
--
local imagePath = "p1/rect9.png"
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
    layer.rect9 = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.rect9 = newImageRect(rect9, imageWidth, imageHeight )
    if layer.rect9 == nil then return end
    layer.rect9.imagePath = imagePath
    layer.rect9.x = mX
    layer.rect9.y = mY
    layer.rect9.alpha = oriAlpha
    layer.rect9.oldAlpha = oriAlpha
    layer.rect9.blendMode = ""
    layer.rect9.oriX = layer.rect9.x
    layer.rect9.oriY = layer.rect9.y
    layer.rect9.oriXs = layer.rect9.xScale
    layer.rect9.oriYs = layer.rect9.yScale
    layer.rect9.name = "rect9"
    sceneGroup.rect9 = layer.rect9
          sceneGroup:insert( layer.rect9)
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