-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018, 2019, 2020-- Version: -- Project: BookTOC--local _M = {}--local _K = require "Application"--function _M:myMain()end-- notlocal imageWidth             = 451/4local imageHeight            = 222/4local mX, mY                 = _K.ultimatePosition(1489, 1052, "")local oriAlpha = 1--local imageName = "/rect12.png"--function _M:localVars(UI)		local imagePath = "p"..UI.imagePage ..imageName   end----[[local info     = require ("assets.sprites.".."page1")local sheet    = graphics.newImageSheet ( _K.spriteDir.."page1.png", _K.systemDir, info:getSheet() )local sequence = {start=1, count= #info:getSheet().frames }function newImageRect(name, width, height)  local image  if string.find(name, "background") == nil then      image = display.newSprite(sheet, sequence)      image.name = name      image:setFrame (info:getFrameIndex (name))      image.width, image.height = width, height      else       image = display.newImageRect(_K.imgDir..name.."."..png, _K.systemDir, width, height)      end   return imageend--]]--function _M:localPos(UI)  local sceneGroup  = UI.scene.view  local layer       = UI.layer		local imagePath = "p"..UI.imagePage ..imageName    local function myNewImage()    layer.rect12 = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)    -- layer.rect12 = newImageRect(rect12, imageWidth, imageHeight )    if layer.rect12 == nil then return end    layer.rect12.imagePath = imagePath    layer.rect12.x = mX    layer.rect12.y = mY    layer.rect12.alpha = oriAlpha    layer.rect12.oldAlpha = oriAlpha    layer.rect12.blendMode = ""    layer.rect12.oriX = layer.rect12.x    layer.rect12.oriY = layer.rect12.y    layer.rect12.oriXs = layer.rect12.xScale    layer.rect12.oriYs = layer.rect12.yScale    layer.rect12.name = "rect12"    sceneGroup.rect12 = layer.rect12          sceneGroup:insert( layer.rect12)    --    end    myNewImage()end--function _M:didShow(UI)  local sceneGroup  = UI.scene.view  local layer       = UI.layer      end--function _M:toDispose(UI)  local sceneGroup  = UI.scene.view  local layer       = UI.layer      end--function  _M:toDestory()end--return _M