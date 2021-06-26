#!/usr/bin/env ruby

require 'date'
require 'optparse'

options = ARGV.getopts("y:", "m:") 
year = options["y"].to_i
month = options["m"].to_i
  if options["y"] != nil && options["m"] == nil
    year = options["y"].to_i
    month = Date.today.month
  elsif options["y"] == nil && options["m"] != nil
    year = Date.today.year
    month = options["m"].to_i
  else options["y"] == nil && options["m"] == nil
    year = Date.today.year
    month = Date.today.month
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
