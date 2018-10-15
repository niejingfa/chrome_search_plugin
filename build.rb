puts '开始转换...'
puts '最后编译时间：' + Time.now.to_s
%x{coffee --compile --output ./ src/*.coffee}
Dir.glob('src/*.haml').each do |file|
  %x{haml #{file} #{file.split('/').last.gsub('.haml', '.html')}}
end
puts '转换完成！'