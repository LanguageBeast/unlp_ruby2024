def contar(texto, subtexto)
  texto.downcase.scan(subtexto.downcase).count
end

puts contar("La casa de la esquina tiene la puerta roja y la ventana blanca.", "la")
