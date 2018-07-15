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
local imageWidth             = 1920/4
local imageHeight            = 1280/4
local mX, mY                 = _K.ultimatePosition(960, 640)
local oriAlpha = 1
--
local imagePath = "p2/bg.png"
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
    layer.bg = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.bg = newImageRect(bg, imageWidth, imageHeight )
    if layer.bg == nil then return end
    layer.bg.imagePath = imagePath
    layer.bg.x = mX
    layer.bg.y = mY
    layer.bg.alpha = oriAlpha
    layer.bg.oldAlpha = oriAlpha
    layer.bg.blendMode = ""
    layer.bg.oriX = layer.bg.x
    layer.bg.oriY = layer.bg.y
    layer.bg.oriXs = layer.bg.xScale
    layer.bg.oriYs = layer.bg.yScale
    layer.bg.name = "bg"
    sceneGroup.bg = layer.bg
          sceneGroup:insert( layer.bg)
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