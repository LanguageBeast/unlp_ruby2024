def contar_palabras(texto, subtexto)
  texto.downcase.scan(/\b#{Regexp.escape(subtexto.downcase)}\b/).count
end


puts contar_palabras("La casa de la esquina tiene la puerta roja y la ventana blanca.", "la")
