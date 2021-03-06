-- Code created by Kwik - Copyright: kwiksher.com {{year}}
-- Version: {{vers}}
-- Project: {{ProjName}}
--
local _M = {}
--
{{#ultimate}}
local imageWidth = {{elW}}/4
local imageHeight = {{elH}}/4
local mX, mY = _K.ultimatePosition({{mX}}, {{mY}})
{{/ultimate}}
{{^ultimate}}
local imageWidth = {{elW}}
local imageHeight = {{elH}}
local mX = {{mX}}
local mY = {{mY}}
{{/ultimate}}
local oriAlpha = {{oriAlpha}}
{{#kwk}}
local imagePath = "{{bn}}"
local ext       = "{{fExt}}"
{{/kwk}}
{{^kwk}}
local imagePath = "p{{docNum}}/{{bn}}"
local ext       = ".{{fExt}}"
{{/kwk}}
--
function _M:localVars(UI)
  {{#isTmplt}}
   mX, mY, imageWidth, imageHeight , imagePath= _K.getModel("{{myLName}}", imagePath, UI.dummy)
  {{/isTmplt}}
end
--
function _M:localPos(UI)
    local layer       = UI.layer
    local sceneGroup  = UI.scene.view
    local group = display.newGroup()
    group:insert(layer.{{targetLayer}})
    sceneGroup.{{targetLayer}} = layer.{{targetLayer}}
    layer.{{targetLayer}}.group = group
    sceneGroup:insert(group)
    --sceneGroup:remove(layer.{{targetLayer}})
end
--
function _M:didShow(UI)
    local sceneGroup  = UI.scene.view
    local layer       = UI.layer
    local imageSuffix = display.imageSuffix or ""
    --print( imageSuffix )
    --print(_K.imgDir.. imagePath..imageSuffix..ext)
    local mask = graphics.newMask(_K.imgDir.. imagePath..imageSuffix..ext, _K.systemDir )
    if mask then
      layer.{{targetLayer}}.group:setMask(mask)
      layer.{{targetLayer}}.group.maskScaleX = {{scaleX}}*0.5
      layer.{{targetLayer}}.group.maskScaleY = {{scaleY}}*0.5
      layer.{{targetLayer}}.group.maskX = mX
      layer.{{targetLayer}}.group.maskY = mY
    end
end
--
function _M:toDispose(UI)
  local sceneGroup  = UI.scene.view
  local layer       = UI.layer
end
--
return _M