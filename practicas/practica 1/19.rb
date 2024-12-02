def notacion_hexadecimal(rgb)
  red, green, blue = rgb
  format('#%02X%02X%02X', red, green, blue)
end

puts notacion_hexadecimal([0, 128, 255])
