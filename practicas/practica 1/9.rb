def string_reverso(cadena)
  cadena.reverse
end

def string_sin_espacio(cadena)
  cadena.delete(' ')
end

def string_a_arreglo_ascii(cadena)
  cadena.chars.map(&:ord)
end

def string_remplaza_vocal(cadena)
  cadena.tr('aAeEiIoOuU', '4433110066')
end

cadena = "La casa de la esquina tiene la puerta roja y la ventana blanca."

puts string_reverso(cadena)

puts string_sin_espacio(cadena)

puts string_a_arreglo_ascii(cadena).inspect

puts string_remplaza_vocal(cadena)
