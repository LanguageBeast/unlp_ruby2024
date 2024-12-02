def tiempo_en_palabras(time)
  hora = time.hour
  minuto = time.min

  case minuto
  when 0..10
    texto_minuto = "en punto"
  when 11..20
    texto_minuto = "y cuarto"
  when 21..34
    texto_minuto = "y media"
  when 35..44
    hora = (hora + 1) % 24
    texto_minuto = "menos veinticinco"
  when 45..55
    hora = (hora + 1) % 24
    texto_minuto = "menos cuarto"
  when 56..59
    hora = (hora + 1) % 24
    texto_minuto = "Casi son las"
  end

  if hora == 1
    texto_hora = "Es la 1"
  else
    texto_hora = "Son las #{hora}"
  end

  if minuto.between?(56, 59)
    "#{texto_minuto} #{hora}"
  else
    "#{texto_hora} #{texto_minuto}"
  end
end

puts tiempo_en_palabras(Time.new(2024, 10, 21, 10, 1))   # => "Son las 10 en punto"
puts tiempo_en_palabras(Time.new(2024, 10, 21, 9, 33))   # => "Son las 9 y media"
puts tiempo_en_palabras(Time.new(2024, 10, 21, 8, 45))   # => "Son las 9 menos cuarto"
puts tiempo_en_palabras(Time.new(2024, 10, 21, 6, 58))   # => "Casi son las 7"
puts tiempo_en_palabras(Time.new(2024, 10, 21, 0, 58))   # => "Casi es la 1"