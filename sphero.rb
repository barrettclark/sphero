require 'sphero'

s = Sphero.new '/dev/tty.Sphero-RRO-RN-SPP'
s.rgb 218, 165, 32
20.times do
  # s.rgb rand(255), rand(255), rand(255)
  color_name = Sphero::COLORS.keys.sample
  color = Sphero::COLORS[color_name]
  puts color_name
  s.rgb color[:r], color[:g], color[:b]
  sleep 2
end

# Roll 0 degrees, speed 125
s.roll(125, 0)

# Turn 360 degrees, 30 degrees at a time
0.step(360, 30) { |h|
  h = 0 if h == 360

  # Set the heading to h degrees
  s.heading = h
  sleep 1
}
sleep 1
s.stop
