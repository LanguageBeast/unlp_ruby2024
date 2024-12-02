entrada = [10, 9, 1, 2, 3, 5, 7, 8]

# usamos el operador splat *
resultado = ordenar(*entrada)

# Mostrar el resultado
puts resultado.inspect
# => [1, 2, 3, 5, 7, 8, 9, 10]