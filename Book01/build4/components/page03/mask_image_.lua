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
local imageWidth             = 512/4
local imageHeight            = 512/4
local mX, mY                 = _K.ultimatePosition(985, 640)
local oriAlpha = 1
--
local imagePath = "p3/mask.png"
--
function _M:localVars(UI)
    end
--
--[[
local info     = require ("assets.sprites.".."page3")
local sheet    = graphics.newImageSheet ( _K.spriteDir.."page3.png", _K.systemDir, info:getSheet() )
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
    layer.mask = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.mask = newImageRect(mask, imageWidth, imageHeight )
    if layer.mask == nil then return end
    layer.mask.imagePath = imagePath
    layer.mask.x = mX
    layer.mask.y = mY
    layer.mask.alpha = oriAlpha
    layer.mask.oldAlpha = oriAlpha
    layer.mask.blendMode = ""
    layer.mask.oriX = layer.mask.x
    layer.mask.oriY = layer.mask.y
    layer.mask.oriXs = layer.mask.xScale
    layer.mask.oriYs = layer.mask.yScale
    layer.mask.name = "mask"
    sceneGroup.mask = layer.mask
          sceneGroup:insert( layer.mask)
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