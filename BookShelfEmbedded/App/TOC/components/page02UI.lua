-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: BookTOC
--
local _Class   = {}
local layerUI  = require("components.kwik.layerUI")
local const    = require("vo.page02VO").const
local composer = require( "composer" )
local _K       = require("Application")
---------------------
---------------------
_Class.new = function(scene)
  local UI = layerUI.new()
    UI.scene     = scene
    UI.page      = "page02"
    UI.curPage   = 02
    -- All components on a table
    UI.layer     = {}
    -- All audio files on a table
    UI.allAudios = {}
    UI.allAudios.kAutoPlay = 0
    UI.tSearch   = nil
                UI.taben = {}
      UI.tSearch   = nil
    UI.numPages = 2   -- number of pages in the project
    function UI:setLanguge()
            if _K.lang == "" then _K.lang = "en" end
              -- Language switch
        if (_K.lang=="en") then
          self.tSearch = self.taben
        end
      end
  --
  function UI:setVars()
        self:_vars("image",  const.bg_image_, false)
        self:_vars("image",  const.hideOverlayBtn_image_, false)
        self:_vars("image",  const.purchaseBtn_image_, false)
        self:_vars("image",  const.savingTxt_image_, false)
        self:_vars("image",  const.savedBtn_image_, false)
        self:_vars("image",  const.downloadBtn_image_, false)
        self:_vars("image",  const.bookXXIcon_image_, false)
        self:_vars("text",  const.infoTxt_text_, false)
        self:_vars("IAP",  const.page_IAP_, false)
        self:_vars("storeFSM",  const.page_storeFSM_, false)
    end
  --
  function UI:create()
   self:_create("common",  const.page_common, false)
    self:setVars()
    self:setLanguge()
        self:_create("image",  const.bg_image_, false)
        self:_create("image",  const.hideOverlayBtn_image_, false)
        self:_create("image",  const.purchaseBtn_image_, false)
        self:_create("image",  const.savingTxt_image_, false)
        self:_create("image",  const.savedBtn_image_, false)
        self:_create("image",  const.downloadBtn_image_, false)
        self:_create("image",  const.bookXXIcon_image_, false)
        self:_create("text",  const.infoTxt_text_, false)
        self:_create("IAP",  const.page_IAP_, false)
        self:_create("storeFSM",  const.page_storeFSM_, false)
    end
  --
  function UI:didShow(params)
    self:_didShow("common",  const.page_common, false)
        self:_didShow("image",  const.bg_image_, false)
        self:_didShow("image",  const.hideOverlayBtn_image_, false)
        self:_didShow("image",  const.purchaseBtn_image_, false)
        self:_didShow("image",  const.savingTxt_image_, false)
        self:_didShow("image",  const.savedBtn_image_, false)
        self:_didShow("image",  const.downloadBtn_image_, false)
        self:_didShow("image",  const.bookXXIcon_image_, false)
        self:_didShow("text",  const.infoTxt_text_, false)
        self:_didShow("IAP",  const.page_IAP_, false)
        self:_didShow("storeFSM",  const.page_storeFSM_, false)
    end
  --
  function UI:didHide(params)
    self:_didHide("common",  const.page_common, false)
        self:_didHide("image",  const.bg_image_, false)
        self:_didHide("image",  const.hideOverlayBtn_image_, false)
        self:_didHide("image",  const.purchaseBtn_image_, false)
        self:_didHide("image",  const.savingTxt_image_, false)
        self:_didHide("image",  const.savedBtn_image_, false)
        self:_didHide("image",  const.downloadBtn_image_, false)
        self:_didHide("image",  const.bookXXIcon_image_, false)
        self:_didHide("text",  const.infoTxt_text_, false)
        self:_didHide("IAP",  const.page_IAP_, false)
        self:_didHide("storeFSM",  const.page_storeFSM_, false)
    end
  --
  function UI:destroy(params)
    self:_destroy("common",  const.page_common)
        self:_destroy("image",  const.bg_image_, false)
        self:_destroy("image",  const.hideOverlayBtn_image_, false)
        self:_destroy("image",  const.purchaseBtn_image_, false)
        self:_destroy("image",  const.savingTxt_image_, false)
        self:_destroy("image",  const.savedBtn_image_, false)
        self:_destroy("image",  const.downloadBtn_image_, false)
        self:_destroy("image",  const.bookXXIcon_image_, false)
        self:_destroy("text",  const.infoTxt_text_, false)
        self:_destroy("IAP",  const.page_IAP_, false)
        self:_destroy("storeFSM",  const.page_storeFSM_, false)
    end
  --
  function UI:touch(event)
      print("event.name: "..event.name)
  end
  function UI:resume(params)
        self:_resume("image",  const.bg_image_, false)
        self:_resume("image",  const.hideOverlayBtn_image_, false)
        self:_resume("image",  const.purchaseBtn_image_, false)
        self:_resume("image",  const.savingTxt_image_, false)
        self:_resume("image",  const.savedBtn_image_, false)
        self:_resume("image",  const.downloadBtn_image_, false)
        self:_resume("image",  const.bookXXIcon_image_, false)
        self:_resume("text",  const.infoTxt_text_, false)
        self:_resume("IAP",  const.page_IAP_, false)
        self:_resume("storeFSM",  const.page_storeFSM_, false)
    end
  --
  return  UI
end
--
return _Class