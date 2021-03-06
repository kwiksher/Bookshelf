local M = {}
--
local composer        = require("composer")
local IAP             = require("components.store.IAP")
local downloadManager = require("components.store.downloadManager")
local model           = require("components.store.model")
local _K              = require("Application")
local json            = require("json")
local master          = require("model") -- case tmplt, it returns the pages table. case embedded, it is overwritten as {isEmbedded = true} at the runtime by Kwikshelf plugin
--
local type = {pages = 0, embedded = 1, tmplt=2}
local bookShelfType = model.bookShelfType -- please set one of them
---------------------------------------------------
--
local currentBookModel = nil
local currentBook    = nil
M.currentPage          = 1
M.numPages             = 1 -- referneced from page_swipe.lua
--
local function getPageNum(num)
    if master.isEmbedded then return num end
    local pageName = currentBookModel[num].alias
    for i=1, #master do
        if master[i].alias == pageName then
            return i
        end
    end
    return num
end
M.getPageNum = getPageNum
--
local function readPageJson(name)
    local jsonFile = function(filename )
       local path = system.pathForFile(filename, system.ApplicationSupportDirectory)
       --print(path)
       local contents
       local file = io.open( path, "r" )
       if file then
          contents = file:read("*a")
          --print (contents)
          io.close(file)
          file = nil
       end
       return contents
    end
    currentBook = name
    currentBookModel =  json.decode( jsonFile(name.."/model.json") )
    -- for k, v in pairs(currentBookModel) do
    --     for l, m in pairs(v) do print(l, m) end
    -- end
    M.numPages = #currentBookModel
end
--
M.readPageJson = readPageJson
--
_K.getModel = function(layerName, imagePath, dummy)
    local targetPage = dummy or M.currentPage
    local page = currentBookModel[targetPage]
    local layer = page[layerName]
    if layer == nil then layer = {x=0, y=0, width=0, height=0} end
    local _x, _y = _K.ultimatePosition(layer.x, layer.y)
    local path = nil
    if imagePath then
        local i = string.find(imagePath, "/")
       path = "p"..targetPage..string.sub(imagePath, i)
   end
    return _x, _y, layer.width/4, layer.height/4, path
end
----------------------------------
local setSystemDir = {}
--
setSystemDir[type.pages] = function (epname)
    if epname then
        local isDL = downloadManager.hasDownloaded(epname)
        if isDL then
            _K.systemDir = system.ApplicationSupportDirectory
            _K.imgDir = "assets/images/"
            _K.audioDir = "assets/audios/"
        end
        return isDL
    else
        _K.systemDir = system.ResourceDirectory
        _K.imgDir = "assets/images/"
        _K.audioDir = "assets/audios/"
    end
    return true
end
---
-- setSystemDir[type.embedded] = function (isDL)
--     if  isDL then
--         _K.systemDir = system.ApplicationSupportDirectory
--         _K.imgDir = currentBook.."/images/"
--         _K.audioDir = currentBook.."/audios/"
--     else
--         _K.systemDir = system.ResourceDirectory
--         _K.imgDir = "assets/images/"
--         _K.audioDir = "assets/audios/"
--     end
-- end
---
setSystemDir[type.tmplt] = function (isDL, pageNum)
    local targetPage = pageNum or M.currentPage
    print("isDL", isDL)
    print("targetPage", targetPage)
    if isDL then
        _K.systemDir = system.ApplicationSupportDirectory
        _K.imgDir = currentBook.."/images/"
        _K.audioDir = currentBook.."/audios/p"..targetPage.."_"
        _K.spriteDir   = currentBook.."/sprites/"
        _K.thumbDir    = currentBook.."/thumbnails/"
        _K.videoDir    = currentBook.."/videos/"
        _K.particleDir = currentBook.."/particles/"
    else
        _K.systemDir = system.ResourceDirectory
        _K.imgDir      = "assets/images/"
        _K.audioDir    = "assets/audios/"
        _K.spriteDir   = "assets/sprites/"
        _K.thumbDir    = "assets/thumbnails/"
        _K.videoDir    = "assets/videos/"
        _K.particleDir = "assets/particles/"
 end
end
--
M.setDir = function(pageNum)
    if bookShelfType == type.pages then
        if next(model.epsodes) == nil or model.URL == nil then
            return true
        end
        --
        local epname = model.isIAP(pageNum)
        local isDL   = setSystemDir[type.pages](epname)
        if not isDL then
            local infoPage = model.epsodes[epname].info:sub(2)
            if string.len(infoPage) > 0 then
                _K.systemDir = system.ResourceDirectory
                _K.imgDir = "assets/images/"
                _K.audioDir = "assets/audios/"
                _K.spriteDir   = "assets/sprites/"
                _K.thumbDir    = "assets/thumbnails/"
                _K.videoDir    = "assets/videos/"
                _K.particleDir = "assets/particles/"
                composer.gotoScene("views.page0"..model.epsodes[epname].info:sub(2).."Scene")
            else
                local infoString = "The page is not found."
                local function onComplete( event )
                    if "clicked" == event.action then
                     end
                end
                local alert = native.showAlert("Restricted Content", infoString,{ "OK" }, onComplete)
            end
        end
        return isDL
    elseif bookShelfType == type.tmplt then
        setSystemDir[type.tmplt](master[getPageNum(pageNum)].isTmplt, pageNum)
    end
    return true
end
--
-- only type.pages
--
M.gotoTOC = function(params)
    local storeFSM = require("components.store.storeFSM").getInstance()
    storeFSM:exit()
   if setSystemDir[type.pages](model.isIAP(model.tocPage)) then
        composer.gotoScene("views.page0"..model.tocPage.."Scene", {params = params})
    end
end

M.gotoPage = function(pageNum, params)
   if setSystemDir[type.pages](model.isIAP(pageNum)) then
    composer.gotoScene("views.page0"..pageNum.."Scene", {params = params})
    end
end
-- only type.pages
M.gotoNextPage = function(curPage, params)
    if setSystemDir[type.pages](model.isIAP(curPage+1)) then
        composer.gotoScene("views.page0"..(curPage+1).."Scene", {params = params})
    end
end
-- only type.pages
M.gotoPreviousPage = function(curPage, params)
    if setSystemDir[type.pages](model.isIAP(curPage-1)) then
        composer.gotoScene("views.page0"..(curPage-1).."Scene", {params = params})
    end
end

M.showView = function(curPage, wPage, options)
    print(curPage, wPage)
    if bookShelfType == type.pages then
        for k, v in pairs(model.epsodes) do
            if curPage >= v.startPage and curPage <= v.startPage + v.numOfPages -1 then
                if wPage < v.startPage or wPage > v.startPage + v.numOfPages -1 then
                    M.gotoTOC(options)
                    return
                end
            end
        end
    end
    _K.appInstance:showView("views.page0"..wPage.."Scene", options)
end

-- type.embedded and type.tmplt
M.gotoNextScene = function(params)
    if master.isEmbedded then
        print("Warning From Kwik, KwikShelf Embedded not suppport gotoNextScene in component.store.UI")
        return
    end
    local prevAlias = getPageNum(M.currentPage)
    local nextAlias = getPageNum(M.currentPage+1)
    M.currentPage = M.currentPage + 1
    if prevAlias == nextAlias  then
        --setSystemDir[type.tmplt](false)
        composer.gotoScene("extlib.page_reload")
    else
        setSystemDir[type.tmplt](true)
        composer.gotoScene("views.page0"..getPageNum(M.currentPage).."Scene", {params = params})
    end
end
-- type.tmplt only
M.gotoTmpltScene = function(tmpltNum, pageNum, params)
    if pageNum then
        local prevAlias = getPageNum(M.currentPage)
        local nextAlias = getPageNum(pageNum)
        M.currentPage = pageNum
        if prevAlias == nextAlias then
            --setSystemDir[type.tmplt](false)
            composer.gotoScene("extlib.page_reload")
        else
            setSystemDir[type.tmplt](true)
            composer.gotoScene("views.page0"..tmpltNum.."Scene", {params = params})
        end
    else
        M.currentPage = 1
        setSystemDir[type.tmplt](false)
        composer.gotoScene("views.page0"..tmpltNum.."Scene", {params = params})
    end
end
-- type.embedded and type.tmplt
M.gotoPreviousScene = function(params)
    if master.isEmbedded then
        print("Warning From Kwik, KwikShelf Embedded not suppport gotoPreviousScene in component.store.UI")
        return
    end
    local prevAlias = getPageNum(M.currentPage)
    local nextAlias = getPageNum(M.currentPage-1)
    M.currentPage = M.currentPage -1
    if prevAlias == nextAlias then
        --setSystemDir[type.tmplt](false)
        composer.gotoScene("extlib.page_reload")
    else
        setSystemDir[type.tmplt](true)
        composer.gotoScene("views.page0"..getPageNum(M.currentPage).."Scene", {params = params})
    end
end
-- type.embedded and type.tmplt
M.gotoSceneBook = function(epsode, page, params)
    if master.isEmbedded then
        Runtime:dispatchEvent({name="changeThisMug", appName=epsode, page=page})
    else
        if epsode == "TOC" then
            M.currentPage = 1
            setSystemDir[type.tmplt](false)

            local storeFSM = require("components.store.storeFSM").getInstance()
            storeFSM:exit()
            composer.gotoScene("views.page01Scene", {params = params})
        else
            print("gotoSceneBook ".. model.getPageName(epsode))
            M.currentPage = page
            readPageJson(epsode)
            setSystemDir[type.tmplt](true)
            composer.gotoScene("views.page0"..getPageNum(page).."Scene", {params = params})
        end
    end
end
-- type.embedded and type.tmplt
M.gotoSceneNextBook = function()
    print("gotoSceneNextBook")
    local store_model
    if master.isEmbedded then
        currentBook = _G.appName
        store_model = require("App.TOC.components.store.model")
    else
        store_model = model
        print("currentbook:"..currentBook)
    end
    local k, v, prev = nil, nil, nil

    while true do
        prev = k
        k, v = next(store_model.epsodes, k)
        print(k, v.name)
        if k==nil or currentBook == v.name then
            if k==nil then
                prev = nil
            end
            break
        end
    end
    if prev then
        local epname = store_model.epsodes[prev].name
        if not downloadManager.hasDownloaded(epname) then
            epname ="TOC"
        end
        if master.isEmbedded then
            Runtime:dispatchEvent({name="changeThisMug", appName=epname})
        else
            M.gotoSceneBook(epname, 1)
        end
    else
        if master.isEmbedded then
            Runtime:dispatchEvent({name="changeThisMug", appName="TOC"})
        else
            M.gotoSceneBook("TOC", 1)
        end
    end
end
-- type.embedded and type.tmplt
M.gotoScenePreviousBook = function()
    print("gotoScenePreviousBook")
    local store_model
    if master.isEmbedded then
        currentBook = _G.appName
        store_model = require("App.TOC.components.store.model")
    else
        store_model = model
        print("currentbook:"..currentBook)
    end
    local k, v, prev = nil, nil, nil

    while true do
     k, v = next(store_model.epsodes, k)
        print(k, v.name)
        if k==nil or currentBook == v.name then
            if k~=nil then
                k, v = next(store_model.epsodes, k)
                print(k)
            end
            break
        end
    end
    if k then
        local epname = v.name
        if not downloadManager.hasDownloaded(epname) then
            epname ="TOC"
        end
        if master.isEmbedded then
            Runtime:dispatchEvent({name="changeThisMug", appName=epname})
        else
            M.gotoSceneBook(epname, 1)
        end
    else
        if master.isEmbedded then
            Runtime:dispatchEvent({name="changeThisMug", appName="TOC"})
        else
            M.gotoSceneBook("TOC", 1)
        end
    end
end
-- type.tmplt
local audacityFile = function(filename )
  local timecodes = {}
  local path = system.pathForFile(currentBook.."/audios/"..filename, system.ApplicationSupportDirectory)
   -- local path = system.pathForFile(filename, system.ResouceDirectory)
    print(path)
   local file = io.open( path, "r" )
   if file then
      for i in file:lines() do
      table.insert(timecodes, {i:sub(1, 8), i:sub(10, 17), i:sub(19)})
      -- print(timecodes[#timecodes][1], timecodes[#timecodes][2], timecodes[#timecodes][3] )
      end
      io.close(file)
      file = nil
   end
   return timecodes
end
-- type.tmplt
M.replaceTimeCodes = function(syncLayer, filename)
    local timecodes = audacityFile(filename)
    print(filename)
    for i=1, #syncLayer do
        -- print(syncLayer[i].start, timecodes[i][1])
        if timecodes[i] then
            syncLayer[i].start = timecodes[i][1]*1000
            syncLayer[i].out = timecodes[i][2]*1000
            syncLayer[i].name = timecodes[i][3]
        end
    end
end

function M.hasDownloaded(epsode)
    IAP:init(model.catalogue, nil, nil, model.debug)
    if (IAP.getInventoryValue("unlock_"..epsode)==true) then
        if downloadManager.hasDownloaded(epsode) then
            return true
        else
            return false
        end
    else
        return false
    end
end

function M.isPageReady(num)
    if bookShelfType == 0 then -- pages
        local epsode =  model.isIAP(num)
        if epsode then
            return M.hasDownloaded(epsode)
        end
    end
    return true
end

function M.gotoScene(event)
    local epsode =  model.epsodes[event.target.selectedPurchase]
    print("UI.gotoScene ".. epsode.name)
    if master.isEmbedded then
        Runtime:dispatchEvent({name="changeThisMug", appName=epsode.name})
    elseif bookShelfType == type.tmplt then
        readPageJson(epsode.name)
        print("#############")
        setSystemDir[type.tmplt](true)
        print("#############")
        M.currentPage = 1
        print("views.page0"..getPageNum(1).."Scene")
        composer.gotoScene("views.page0"..getPageNum(1).."Scene")
    else
        setSystemDir[type.pages](epsode.name)
        composer.gotoScene(model.getPageName(epsode.name) , {effect=model.gotoSceneEffect})
    end
    return true
end

return M