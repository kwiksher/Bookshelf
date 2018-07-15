-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book02
--
local _M = {}
--
local _K = require "Application"
local composer = require("composer")
local Navigation = require("extlib.kNavi")
--
local xFactor = display.contentWidth/1920
local yFactor = display.contentHeight/1280
local pSpa =  120/4
--
function _M:didShow(UI)
  local sceneGroup  = UI.scene.view
  local layer       = UI.layer
  local curPage     = UI.curPage
  local numPages    = UI.numPages
  if layer.bg == nil then return end
  _K.Gesture.activate( layer.bg, {swipeLength= pSpa }) --why
    _K.pageSwap = function (event )
    local options
    if event.phase == "ended" and event.direction ~= nil then
       local wPage = curPage
       if event.direction == "left" and _K.kBidi == false then
          wPage = curPage + 1
          if wPage > numPages then wPage = curPage end
          options = { effect = "fromRight"}
       elseif event.direction == "left" and _K.kBidi == true then
          wPage = curPage - 1
          if wPage < 1 then wPage = 1 end
          options = { effect = "fromLeft"}
       elseif event.direction == "right" and _K.kBidi == true then
          wPage = curPage + 1
          if wPage > numPages then wPage = curPage end
          options = { effect = "fromRight"}
       elseif event.direction == "right" and _K.kBidi == false then
          wPage = curPage - 1
          if wPage < 1 then wPage = 1 end
          options = { effect = "fromLeft"}
       end
          local ui           = require("components.store.UI")
       if tonumber(wPage) ~= tonumber(curPage) then
          if ui.setDir(wPage) then
              ui.showView(curPage, wPage, options)
          end
       else
          ui.gotoTOC(options)
       end
    end
  end
layer.bg:addEventListener( _K.Gesture.SWIPE_EVENT, _K.pageSwap )
    end
--
function _M:toDispose(UI)
    local layer       = UI.layer
    if  layer.bg and _K.pageSwap  then
      layer.bg:removeEventListener( _K.Gesture.SWIPE_EVENT, _K.pageSwap )
      end
  --_K.Gesture.deactivate(layer.{{myLName+') ;
end
--
function _M:toDestroy(UI)
  _K.pageSwap = nil
end
--
return _M