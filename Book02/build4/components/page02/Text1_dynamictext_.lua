-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book02
--
local _M = {}
--
local _K = require "Application"
--
local imageWidth             = 824/4
local imageHeight            = 20
local mX, mY                 = _K.ultimatePosition(507, 1144 + 0 )
local elFontSize = 60/4
local oriAlpha = 1
--
function _M:localVars(UI)
  end
--
function _M:localPos(UI)
  local sceneGroup  = UI.scene.view
  local layer       = UI.layer
      local mVar = UI.myVar
     local options = { text = mVar, x = mX + imageWidth/2, y = mY, fontSize = elFontSize, font = native.systemFont, align = "left" }
  layer.Text1 = display.newText(options)
  if layer.Text1 == nil then return end
  layer.Text1:setFillColor( 1, 1, 1 )
  layer.Text1.anchorX = 0.5
  layer.Text1.anchorY = 0.25
  _K.repositionAnchor(layer.Text1,0.5,0);
  layer.Text1.oriX     = layer.Text1.x
  layer.Text1.oriY     = layer.Text1.y
  layer.Text1.oriXs    = layer.Text1.xScale
  layer.Text1.oriYs    = layer.Text1.yScale
  layer.Text1.alpha    = oriAlpha
  layer.Text1.oldAlpha = oriAlpha
  sceneGroup:insert( layer.Text1)
  sceneGroup.Text1 = layer.Text1
  end
--
return _M