def reemplazar(cadena)
  cadena.gsub("{", "do\n").gsub("}", "\nend")
end

puts reemplazar("3.times { |i| puts i }")