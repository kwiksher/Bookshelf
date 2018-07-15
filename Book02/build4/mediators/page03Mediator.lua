-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book02
--
local PageViewMediator = {}
--
function PageViewMediator:new()
  local mediator = {}
  --
  function mediator:onRegister()
    local view = self.viewInstance
    -- Scene
    view:addEventListener("hide", self)
        view:addEventListener("ext_but_TOC_code_442", self)
        view:addEventListener("gotoTOC_button_but_TOC", self)
        view:addEventListener("gotoTitle_button_but_title", self)
        view:addEventListener("ext_but_NextBook_code_761", self)
        view:addEventListener("gotoNextBook_button_but_NextBook", self)
        view:addEventListener("ext_but_PrevBook_code_279", self)
        view:addEventListener("gotoPreviousBoo_button_but_PrevBook", self)
    end
  --
  function mediator:onRemove()
    local view = self.viewInstance
        view:removeEventListener("ext_but_TOC_code_442", self)
        view:removeEventListener("gotoTOC_button_but_TOC", self)
        view:removeEventListener("gotoTitle_button_but_title", self)
        view:removeEventListener("ext_but_NextBook_code_761", self)
        view:removeEventListener("gotoNextBook_button_but_NextBook", self)
        view:removeEventListener("ext_but_PrevBook_code_279", self)
        view:removeEventListener("gotoPreviousBoo_button_but_PrevBook", self)
    end
  --
  function mediator:hide(event)
    Runtime:dispatchEvent({name=".hide", event=event, UI = self.viewInstance.pageUI})
  end
    function mediator:ext_but_TOC_code_442(event)
    Runtime:dispatchEvent({name="page03.ext_but_TOC_code_442", event=event.parent or event, UI = self.viewInstance.pageUI})
  end
    function mediator:gotoTOC_button_but_TOC(event)
    Runtime:dispatchEvent({name="page03.gotoTOC_button_but_TOC", event=event.parent or event, UI = self.viewInstance.pageUI})
  end
    function mediator:gotoTitle_button_but_title(event)
    Runtime:dispatchEvent({name="page03.gotoTitle_button_but_title", event=event.parent or event, UI = self.viewInstance.pageUI})
  end
    function mediator:ext_but_NextBook_code_761(event)
    Runtime:dispatchEvent({name="page03.ext_but_NextBook_code_761", event=event.parent or event, UI = self.viewInstance.pageUI})
  end
    function mediator:gotoNextBook_button_but_NextBook(event)
    Runtime:dispatchEvent({name="page03.gotoNextBook_button_but_NextBook", event=event.parent or event, UI = self.viewInstance.pageUI})
  end
    function mediator:ext_but_PrevBook_code_279(event)
    Runtime:dispatchEvent({name="page03.ext_but_PrevBook_code_279", event=event.parent or event, UI = self.viewInstance.pageUI})
  end
    function mediator:gotoPreviousBoo_button_but_PrevBook(event)
    Runtime:dispatchEvent({name="page03.gotoPreviousBoo_button_but_PrevBook", event=event.parent or event, UI = self.viewInstance.pageUI})
  end
  --
  return mediator
end
--
return PageViewMediator