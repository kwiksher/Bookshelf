-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: BookTOC
--
local _Command = {}
local _K = require "Application"
-----------------------------
-----------------------------
function _Command:new()
	local command = {}
	--
	function command:execute(params)
		local event         = params.event
		if event=="init" then
			-- Set table with languages for auto selection
			local langTable = {
							    "en",
				}
			local defLang = system.getPreference("ui","language")
			_K.lang = "en"
			-- Auto select a language based on the device language
			for k,v in pairs(langTable) do
			    if defLang == v then _K.lang = v break end
			end
			if defLang == "pt-BR" then
    			_K.lang = "pt"
			end
		end
	end
	return command
end
--
return _Command