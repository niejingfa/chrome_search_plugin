if DEFAULT_STATUS
  RCC_REACH.search_text =(selected_text, search_type) ->
    if search_type == 'baidu'
      url = "https://www.baidu.com/s?wd=#{selected_text}"
    else
      selected_text = selected_text.replace(/%/g,"").replace(/&/g, "")
      reg = new RegExp("^[0-9]*$")
      if selected_text.length > 2 && reg.test(selected_text) && search_type == 'project'
        url = "http://in.rccchina.com/projects/show?projectid=#{selected_text}&from_source=search_plugin"
      else if selected_text.length > 2 && ['n', 'p'].indexOf(selected_text[0]) >= 0 && reg.test(selected_text.substring(1, selected_text.length))
        if selected_text[0] == "n"
          url = "http://in.rccchina.com/project_news/show?id=#{selected_text.substring(1, selected_text.length)}&from_source=search_plugin"
        if selected_text[0] == "p"
          url = "http://in.rccchina.com/projects/show?projectid=#{selected_text.substring(1, selected_text.length)}&from_source=search_plugin"
      else
        url = "http://in.rccchina.com/project_news/asearch_result?from_source=search_plugin&keyword=#{selected_text}&search_type=#{search_type}"

  #  alert(url)
    window.open(url)
    jQuery("#reach-plugin-control-panel").remove()


  RCC_REACH.mouseup =(evt) ->
    return if jQuery(evt.target).parents('#reach-plugin-control-panel').length > 0
    if jQuery("#reach-plugin-control-panel").length==0
      # 在插件页面的body增加一个id为reach-plugin-control-panel的div
      jQuery('body').append('<div id="reach-plugin-control-panel" style="z-index: 99999; display: none"></div>')
      html = "<div><button id='btn-search-bid-or-project'>搜索公告/项目</button><br><button id='btn-search-firm'>搜索公司</button><br><button id='btn-search-contact'>搜索联系人</button><br><button id='btn-search-baidu'>百度搜索</button></div>"
      # 在id为reach-plugin-control-panel的div中，插入上面的三个按钮
      jQuery('#reach-plugin-control-panel').html(html).fadeOut().fadeIn()
    RCC_REACH.redirect_result = true
    selected_text = window.getSelection().toString()
    selected_text.split('').map = (str) ->
      if "()+-/:'@\#$\\!~^&*=;.".split("").indexOf(str) >= 0
        alert(str)
        RCC_REACH.redirect_result = false

    if RCC_REACH.redirect_result
    # 防止弹框掉出页面
      if $(window).height() - evt.pageY < 106
        rY = evt.pageY - 106
      else
        rY = evt.pageY
      if $(window).width() - evt.pageX < 100
        rX = evt.pageX - 100
      else
        rX = evt.pageX

      if selected_text.length > 0
        jQuery("#reach-plugin-control-panel").css('top', rY).css('left', rX)
        jQuery("#reach-plugin-control-panel").css('display', 'block')

        jQuery('#btn-search-bid-or-project').click ->
          RCC_REACH.search_text(selected_text, 'project')

        jQuery('#btn-search-firm').click ->
          RCC_REACH.search_text(selected_text, 'firm')

        jQuery('#btn-search-contact').click ->
          RCC_REACH.search_text(selected_text, 'contact')

        jQuery('#btn-search-baidu').click ->
          RCC_REACH.search_text(selected_text, 'baidu')
      else
        jQuery("#reach-plugin-control-panel").remove()
    else
  #    alert('http://it-in.rccchina.com:3138/project_news/notice_info?from_source=search_plugin')
      window.open('http://in.rccchina.com/project_news/notice_info?from_source=search_plugin')



