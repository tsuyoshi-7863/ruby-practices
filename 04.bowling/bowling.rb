#!/usr/bin/env ruby
# frozen_string_literal: true

def strike?(frame)
  frame[0] == 10
end

def spare?(frame)
  frame.sum == 10
end

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = []
shots.each_slice(2) do |s|
  frames << if s == [10, 0]
              [s.shift]
            else
              s
            end
  frames[9].concat(frames[10]) if frames[10]
  frames[9].concat(frames[11]) if frames[11]
  frames.slice!(10, 11)
end

point = 0
frames.each_with_index do |frame, n|
  if n < 8
    if strike?(frame)
      if strike?(frames[n + 1])
        point += 10 + frames[n + 1][0] + frames[n + 2][0]
      else
        point += 10 + frames[n + 1].sum
      end
    elsif spare?(frame)
      point += 10 + frames[n + 1][0]
    else
      point += frame.sum
    end
  elsif n == 8
    point += if strike?(frame)
               10 + frames[n + 1][0] + frames[n + 1][1]
             elsif spare?(frame)
               10 + frames[n + 1][0]
             else
               frame.sum
             end
  else
    point += frames[9].sum if n == 9
  end
end
puts point
