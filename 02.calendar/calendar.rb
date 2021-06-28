#!/usr/bin/env ruby

require 'date'
require 'optparse'

options = ARGV.getopts("y:", "m:") 
year = Date.today.year
month = Date.today.month
if options["y"]
  year = options["y"].to_i
end
if options["m"]
  month = options["m"].to_i
end
puts "#{month}#{"月 "}#{year}".center(20)

start_day = Date.new(year, month, +1)
last_day = Date.new(year, month, -1)

puts ["日", "月", "火", "水", "木", "金", "土"].join(" ")
print "   " * start_day.wday
(start_day..last_day).each do |x|
  print x.strftime('%e') + " "
  if x.saturday?
    print "\n" 
  end
end
print "\n"
