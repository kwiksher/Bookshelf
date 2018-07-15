local M = {}
--
local IAP             = require("components.store.IAP")
--
M.bookShelfType  = 1 --{none = -1, pages = 0, embedded = 1, tmplt=2}
--
M.debug     = true
----------------------------------
-- M.URL = nil means simple IAP store without network download like Kwik3 IAP
-- downloadBtn, savingTxt won'T be used. You don't need to create them.
--
M.downloadable  = false
M.URL           = "http://localhost:8080/bookshelf/" -- YourHost.."/BookShelf/"
M.backgroundImg = "bg.png"
----------
----------
M.TOC_PAGE = "views.page0".."1".."Scene"
M.INFO_PAGE = "views.page0".."2".."Scene" -- "views.page02Scene" -- for bookshelf embedded and tmplt
--
M.episodes = {
            book01  ={name = "book01", dir = "book01", numOfPages = 6, info = "book 01", versions ={  }},
            book02  ={name = "book02", dir = "book02", numOfPages = 3, info = "book 02", versions ={  }},
    }
--
M.catalogue = {
    products = {
            book01 = {
            productNames = { apple="a01", google="", amazon="z01"},
            productType  = "non-consumable",
            onPurchase   = function() IAP.setInventoryValue("unlock_book01") end,
            onRefund     = function() IAP.removeFromInventory("unlock_book01") end,
        },
            book02 = {
            productNames = { apple="book02", google="", amazon=""},
            productType  = "non-consumable",
            onPurchase   = function() IAP.setInventoryValue("unlock_book02") end,
            onRefund     = function() IAP.removeFromInventory("unlock_book02") end,
        },
    },
    inventoryItems = {
            unlock_book01 = { productType="non-consumable" },
            unlock_book02 = { productType="non-consumable" },
    }
}
--
M.purchaseAlertMessage = "Your purchase was successful"
M.restoreAlertMessage  = "Your items are being restored"
M.downloadErrorMessage = "Check network alive to download the content"
--
M.gotoSceneEffect   = "slideRight"
M.showOverlayEffect = "slideBottom"
--
M.getPageNum = function(episode)
    local pNum = M.episodes[episode].startPage
    pNum = pNum:sub(16)
    return pNum
end
--
--
local _K = require("Application")
--
--
M.getPageName = function (episode)
    local pNum = M.episodes[episode].dir
    pNum = pNum:sub(16)
    return "views.page0"..pNum.."Scene"
end
--
--
M.getPageInfo = function (episode)
    print(episode)
    local pNum = M.episodes[episode].info
    if string.len(pNum) > 0 then
        return "views.page0"..pNum.."Scene"
    else
        return nil
    end
end
--
--
return M