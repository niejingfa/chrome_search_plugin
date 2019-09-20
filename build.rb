# 暂时先注释掉，避免js被coffee编译的js覆盖
# puts '开始转换...'
# puts '最后编译时间：' + Time.now.to_s
# %x{coffee --compile --output ./ src/}
# Dir.glob('src/*.haml').each do |file|
#   %x{haml #{file} #{file.split('/').last.gsub('.haml', '.html')}}
# end
# puts '转换完成！'