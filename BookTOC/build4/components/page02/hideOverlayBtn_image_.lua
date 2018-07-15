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
local imageWidth             = 168/4
local imageHeight            = 59/4
local mX, mY                 = _K.ultimatePosition(1397, 332)
local oriAlpha = 1
--
local imagePath = "p2/hideoverlaybtn.png"
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
    layer.hideOverlayBtn = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.hideOverlayBtn = newImageRect(hideoverlaybtn, imageWidth, imageHeight )
    if layer.hideOverlayBtn == nil then return end
    layer.hideOverlayBtn.imagePath = imagePath
    layer.hideOverlayBtn.x = mX
    layer.hideOverlayBtn.y = mY
    layer.hideOverlayBtn.alpha = oriAlpha
    layer.hideOverlayBtn.oldAlpha = oriAlpha
    layer.hideOverlayBtn.blendMode = ""
    layer.hideOverlayBtn.oriX = layer.hideOverlayBtn.x
    layer.hideOverlayBtn.oriY = layer.hideOverlayBtn.y
    layer.hideOverlayBtn.oriXs = layer.hideOverlayBtn.xScale
    layer.hideOverlayBtn.oriYs = layer.hideOverlayBtn.yScale
    layer.hideOverlayBtn.name = "hideOverlayBtn"
    sceneGroup.hideOverlayBtn = layer.hideOverlayBtn
          sceneGroup:insert( layer.hideOverlayBtn)
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