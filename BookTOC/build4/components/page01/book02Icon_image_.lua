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
local mX, mY                 = _K.ultimatePosition(960, 227)
local oriAlpha = 1
--
local imagePath = "p1/book02icon.png"
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
    layer.book02Icon = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.book02Icon = newImageRect(book02icon, imageWidth, imageHeight )
    if layer.book02Icon == nil then return end
    layer.book02Icon.imagePath = imagePath
    layer.book02Icon.x = mX
    layer.book02Icon.y = mY
    layer.book02Icon.alpha = oriAlpha
    layer.book02Icon.oldAlpha = oriAlpha
    layer.book02Icon.blendMode = ""
    layer.book02Icon.oriX = layer.book02Icon.x
    layer.book02Icon.oriY = layer.book02Icon.y
    layer.book02Icon.oriXs = layer.book02Icon.xScale
    layer.book02Icon.oriYs = layer.book02Icon.yScale
    layer.book02Icon.name = "book02Icon"
    sceneGroup.book02Icon = layer.book02Icon
          sceneGroup:insert( layer.book02Icon)
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