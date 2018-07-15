-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book01
--
local _M = {}
--
local _K = require "Application"
--
function _M:myMain()
end
-- not
local imageWidth             = 240/4
local imageHeight            = 235/4
local mX, mY                 = _K.ultimatePosition(1050, 1058)
local oriAlpha = 1
--
local imagePath = "p2/shape1.png"
--
function _M:localVars(UI)
    end
--
--[[
local info     = require ("assets.sprites.".."page2")
local sheet    = graphics.newImageSheet ( _K.spriteDir.."page2.png", _K.systemDir, info:getSheet() )
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
    layer.Shape1 = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.Shape1 = newImageRect(shape1, imageWidth, imageHeight )
    if layer.Shape1 == nil then return end
    layer.Shape1.imagePath = imagePath
    layer.Shape1.x = mX
    layer.Shape1.y = mY
    layer.Shape1.alpha = oriAlpha
    layer.Shape1.oldAlpha = oriAlpha
    layer.Shape1.blendMode = ""
    layer.Shape1.oriX = layer.Shape1.x
    layer.Shape1.oriY = layer.Shape1.y
    layer.Shape1.oriXs = layer.Shape1.xScale
    layer.Shape1.oriYs = layer.Shape1.yScale
    layer.Shape1.name = "Shape1"
    sceneGroup.Shape1 = layer.Shape1
          sceneGroup:insert( layer.Shape1)
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