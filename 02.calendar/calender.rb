require 'date'

start_day = Date.new(2021, 6, +1)
last_day = Date.new(2021, 6, -1)

puts "日月火水木金土"
(start_day..last_day).each do |x|
  if x.saturday?
    puts x.day
  else
    print x.strftime('%e')
  end
end
