-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018, 2019, 2020-- Version: -- Project: BookTOC--local _M = {}--local _K = require "Application"--function _M:myMain()end-- notlocal imageWidth             = 451/4local imageHeight            = 222/4local mX, mY                 = _K.ultimatePosition(1489, 502, "")local oriAlpha = 1--local imageName = "/rect6.png"--function _M:localVars(UI)		local imagePath = "p"..UI.imagePage ..imageName   end----[[local info     = require ("assets.sprites.".."page1")local sheet    = graphics.newImageSheet ( _K.spriteDir.."page1.png", _K.systemDir, info:getSheet() )local sequence = {start=1, count= #info:getSheet().frames }function newImageRect(name, width, height)  local image  if string.find(name, "background") == nil then      image = display.newSprite(sheet, sequence)      image.name = name      image:setFrame (info:getFrameIndex (name))      image.width, image.height = width, height      else       image = display.newImageRect(_K.imgDir..name.."."..png, _K.systemDir, width, height)      end   return imageend--]]--function _M:localPos(UI)  local sceneGroup  = UI.scene.view  local layer       = UI.layer		local imagePath = "p"..UI.imagePage ..imageName    local function myNewImage()    layer.rect6 = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)    -- layer.rect6 = newImageRect(rect6, imageWidth, imageHeight )    if layer.rect6 == nil then return end    layer.rect6.imagePath = imagePath    layer.rect6.x = mX    layer.rect6.y = mY    layer.rect6.alpha = oriAlpha    layer.rect6.oldAlpha = oriAlpha    layer.rect6.blendMode = ""    layer.rect6.oriX = layer.rect6.x    layer.rect6.oriY = layer.rect6.y    layer.rect6.oriXs = layer.rect6.xScale    layer.rect6.oriYs = layer.rect6.yScale    layer.rect6.name = "rect6"    sceneGroup.rect6 = layer.rect6          sceneGroup:insert( layer.rect6)    --    end    myNewImage()end--function _M:didShow(UI)  local sceneGroup  = UI.scene.view  local layer       = UI.layer      end--function _M:toDispose(UI)  local sceneGroup  = UI.scene.view  local layer       = UI.layer      end--function  _M:toDestory()end--return _M