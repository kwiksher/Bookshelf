-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book01
--
local ActionCommand = {}
local _AC           = require("commands.kwik.actionCommand")
local _K            = require "Application"
--
-----------------------------
-----------------------------
function ActionCommand:new()
	local command = {}
	--
	function command:execute(params)
		local UI         = params.UI
		local sceneGroup = UI.scene.view
		local layer      = UI.layer
			--
		      UI.scene:dispatchEvent({name = "ext_but_NextBook_code_014", parent = params.event })
		end
	return setmetatable( command, {__index=_AC})
end
--
return ActionCommand