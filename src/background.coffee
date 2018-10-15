## 注入脚本到指定页面
#inject_page = (tab_id, call_back)->
#  chrome.tabs.executeScript(tab_id, {file: "jquery-2.1.4.min.js"})
#  chrome.tabs.executeScript(tab_id, {file: "app.js"})
#  chrome.tabs.executeScript(tab_id, {file: "functions.js"})
#  chrome.tabs.executeScript(tab_id, {file: "injection.js"}, (tab)->
#    if call_back? then call_back(tab)
#    return
#  )
#  chrome.tabs.insertCSS(tab_id, {file: "injection.css"})
#
## 在console里输出debug信息
##debug_show_tab_info = (text, tab_id) ->
##  chrome.tabs.get tab_id, (tab) ->
##    console.log [text, tab_id, tab.url].join(',')
#
## 初始化后台进程(方法要调用后才会生效)
#init_background = ->
#  # 新打开一个页面，对其增加监听
#  chrome.tabs.onCreated.addListener (tab, tab_id) ->
#    inject_page tab.id
#    # 在console里输出相关信息
##    debug_show_tab_info "New view-source:tab",  tab_id
#
#  chrome.tabs.onUpdated.addListener (tab, tab_id) ->
#    inject_page tab.id
#    # 在console里输出相关信息
##    debug_show_tab_info "onUpdated",  tab_id
#
#
#init_background()