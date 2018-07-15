-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: BookTOC
--
local _M = {}
--
local _K = require "Application"
--
local imageWidth = 974/4
local imageHeight = 45/4
local mX, mY = _K.ultimatePosition(905, 1083)
local eloH = 5/4
local eloV = 0/4
local epadV =0/4
local elFontSize = 72/4
local oriAlpha = 1
--
function _M:localPos(UI)
    local sceneGroup  = UI.scene.view
    local layer       = UI.layer
            local infoTxt_options = { text = "text text text text text text text\n", x = mX, y = mY, fontSize = elFontSize, font = native.systemFont, width = imageWidth, align = "left" }
      local infoTxtH = imageHeight
      layer.infoTxt = display.newText( infoTxt_options )
      if layer.infoTxt == nil then return end
    layer.infoTxt.originalH = imageHeight
    layer.infoTxt.originalW = imageWidth
    layer.infoTxt:setFillColor (0.01176470588235, 0.0156862745098, 0.01176470588235)
        layer.infoTxt.x = layer.infoTxt.x + imageWidth/2
    layer.infoTxt.x = layer.infoTxt.y - imageHeight/2
    layer.infoTxt.anchorX = 0.5
    layer.infoTxt.anchorY = 0
    layer.infoTxt.oriX = layer.infoTxt.x
    layer.infoTxt.oriY = layer.infoTxt.y
    layer.infoTxt.oriXs = layer.infoTxt.xScale
    layer.infoTxt.oriYs = layer.infoTxt.yScale
    layer.infoTxt.alpha = oriAlpha
    layer.infoTxt.oldAlpha = oriAlpha
    sceneGroup:insert( layer.infoTxt)
    sceneGroup.infoTxt = layer.infoTxt
  end
--
function _M:didShow()
end
--
function _M:toDispose()
end
--
function _M:localVars()
  end
--
return _M