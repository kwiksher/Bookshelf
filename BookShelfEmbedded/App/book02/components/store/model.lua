local M = {}--local IAP             = require("components.store.IAP")----M.debug     = true------------------------------------ M.URL = nil means simple IAP store without network download like Kwik3 IAP-- downloadBtn, savingTxt won'T be used. You don't need to create them.--M.episodes = {    }--M.catalogue = {    products = {    },    inventoryItems = {    }}--M.purchaseAlertMessage = "Your purchase was successful"M.restoreAlertMessage  = "Your items are being restored"M.downloadErrorMessage = "Check network alive to download the content"--M.gotoSceneEffect   = "slideRight"M.showOverlayEffect = "slideBottom"--M.getPageNum = function(episode)    local pNum = M.episodes[episode].startPage    pNum = pNum:sub(16)    return pNumend----local _K = require("Application")----M.getPageName = function (episode)    local pNum = M.episodes[episode].dir    pNum = pNum:sub(16)    return "views.page0"..pNum.."Scene"end----M.getPageInfo = function (episode)    print(episode)    local pNum = M.episodes[episode].info    if string.len(pNum) > 0 then        return "views.page0"..pNum.."Scene"    else        return nil    endend----return M