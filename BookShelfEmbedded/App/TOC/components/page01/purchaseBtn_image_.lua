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
local imageWidth             = 142/4
local imageHeight            = 29/4
local mX, mY                 = _K.ultimatePosition(852, 682)
local oriAlpha = 1
--
local imagePath = "p1/purchasebtn.png"
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
    layer.purchaseBtn = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.purchaseBtn = newImageRect(purchasebtn, imageWidth, imageHeight )
    if layer.purchaseBtn == nil then return end
    layer.purchaseBtn.imagePath = imagePath
    layer.purchaseBtn.x = mX
    layer.purchaseBtn.y = mY
    layer.purchaseBtn.alpha = oriAlpha
    layer.purchaseBtn.oldAlpha = oriAlpha
    layer.purchaseBtn.blendMode = ""
    layer.purchaseBtn.oriX = layer.purchaseBtn.x
    layer.purchaseBtn.oriY = layer.purchaseBtn.y
    layer.purchaseBtn.oriXs = layer.purchaseBtn.xScale
    layer.purchaseBtn.oriYs = layer.purchaseBtn.yScale
    layer.purchaseBtn.name = "purchaseBtn"
    sceneGroup.purchaseBtn = layer.purchaseBtn
          sceneGroup:insert( layer.purchaseBtn)
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