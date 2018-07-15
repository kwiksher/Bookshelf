-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: BookTOC
--
local VO = {}
VO.field = "page02" --
---------------------
---------------------
local Const = require("extlib.const")
VO.const = Const:new{
	"page_common",
    		"bg_image_",
			"hideOverlayBtn_image_",
			"purchaseBtn_image_",
			"savingTxt_image_",
			"savedBtn_image_",
			"downloadBtn_image_",
			"bookXXIcon_image_",
			"infoTxt_text_",
			"page_IAP_",
			"page_storeFSM_",
	}
---------------------
---------------------
VO.new = function(val)
	local vo = {
	page_common = val.page_common,
	    			bg_image_ = val.bg_image_,
					hideOverlayBtn_image_ = val.hideOverlayBtn_image_,
					purchaseBtn_image_ = val.purchaseBtn_image_,
					savingTxt_image_ = val.savingTxt_image_,
					savedBtn_image_ = val.savedBtn_image_,
					downloadBtn_image_ = val.downloadBtn_image_,
					bookXXIcon_image_ = val.bookXXIcon_image_,
					infoTxt_text_ = val.infoTxt_text_,
					page_IAP_ = val.page_IAP_,
					page_storeFSM_ = val.page_storeFSM_,
		}
	--
	function vo:copyFrom(copyVO)
	end
	--
	function vo:valueOf()
		return baseDir.."/"..self.filename
	end
	--
	return vo
end
--
VO.equal = function(vo1, vo2)
	return vo1.valueOf() == vo2.valueOf()
end
--
return VO