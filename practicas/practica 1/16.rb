def rot(cadena, n)
  # Definir el alfabeto para mayúsculas y minúsculas
  mayusculas = ('A'..'Z').to_a
  minusculas = ('a'..'z').to_a

  # Crear un hash de transliteración para mayúsculas y minúsculas
  rotacion_mayusculas = Hash[mayusculas.zip(mayusculas.rotate(n))]
  rotacion_minusculas = Hash[minusculas.zip(minusculas.rotate(n))]

  # Combinar los hashes de transliteración
  rotacion = rotacion_mayusculas.merge(rotacion_minusculas)

  # Realizar la transliteración
  cadena.chars.map { |char| rotacion[char] || char }.join
end

puts rot("¡Bienvenidos a la cursada 2024 de TTPS Opción Ruby!", 10)
