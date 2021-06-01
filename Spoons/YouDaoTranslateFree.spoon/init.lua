---@diagnostic disable: undefined-global
local obj={}
obj.__index = obj
obj.webview = nil

obj.popup_size = hs.geometry.size(770, 610)

obj.popup_style = hs.webview.windowMasks.utility|hs.webview.windowMasks.HUD|hs.webview.windowMasks.titled|hs.webview.windowMasks.closable

local function current_selection()
   local elem=hs.uielement.focusedElement()
   local sel=nil
   if elem then
      sel=elem:selectedText()
   end
   if (not sel) or (sel == "") then
      hs.eventtap.keyStroke({"cmd"}, "c")
      hs.timer.usleep(100000)
      sel=hs.pasteboard.getContents()
   else
      print("sel:" .. sel)
   end
   return (sel or "")
end

local function initWebview()
end

local function translate(text)
  -- multiple word
  if string.find(text) ~= nil then

  else

  end
end

local function back()
  if obj.webview == nil then
     local rect = hs.geometry.rect(0, 0, obj.popup_size.w, obj.popup_size.h)
     rect.center = hs.screen.mainScreen():frame().center
     local lin = hs.webview.usercontent.new('lin')
     lin:injectScript({
       source="function delById(id){const node=document.getElementById(id);node.parentNode.removeChild(node)};"
       .. "function delByClass(className){const nodes=document.getElementsByClassName(className);for(let i=0;i<nodes.length;i++){nodes[i].parentNode.removeChild(nodes[i])}}"
       .. "delByClass('c-topbar-wrapper');delById('ads');delById('topImgAd');delById('c_footer');delById('result_navigator');"
       .. "document.getElementById('scontainer').style['padding-top'] = 0;"
       .. "document.getElementById('scontainer').style['margin-top'] = 0;"
       .. "document.getElementById('container').style['padding-right'] = 0;"
       .. "document.getElementById('container').style['padding-left'] = 0;"
       .. "document.getElementById('container').style['margin'] = '0 50px 0 50px';"
       .. "document.getElementById('container').style['width'] = '".. obj.popup_size.w - 200 .. "px';",
       injectionTime="documentEnd"
     })
      print(obj.popup_size.w)
     obj.webview = hs.webview.new(rect, {}, lin)
        :allowTextEntry(true)
        :windowStyle(obj.popup_style)
        :closeOnEscape(true)
        :size({w=obj.popup_size.w, h=obj.popup_size.h})
   end

   obj.webview:url("https://www.youdao.com/w/eng/" .. hs.http.encodeForQuery(current_selection()) .. "/#keyfrom=dict2.index")
      :bringToFront()
      :show()
end

hs.hotkey.bind('alt', 'i', nil, function()

end)

return obj

