-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book02
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
		      UI.scene:dispatchEvent({name = "ext_but_PrevBook_code_279", parent = params.event })
		end
	return setmetatable( command, {__index=_AC})
end
--
return ActionCommand