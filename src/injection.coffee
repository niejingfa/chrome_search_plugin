console.log "Plugin works!"

# 初始化插件的页面(将插件弹框内容注入到打开的web页)
init_control_panel = ->
  jQuery(document).mouseup(RCC_REACH.mouseup);

init_control_panel()