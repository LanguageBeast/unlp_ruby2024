def ejecutar_con_excepciones(*args)
  begin
    yield(*args)
    :ok
  rescue RuntimeError
    puts "Hay algo mal que no anda bien"
    :rt
  rescue NoMethodError => e
    puts "Y este método? #{e.message}"
    :nm
  rescue => e
    puts "Y ahora?"
    raise e
  end
end

# Ejemplos de uso

# Ejemplo sin excepciones
resultado = ejecutar_con_excepciones(1, 2, 3) do |a, b, c|
  puts a + b + c
end
puts resultado  # Output: 6, :ok

# Ejemplo con RuntimeError
resultado = ejecutar_con_excepciones(1, 2, 3) do |a, b, c|
  raise "Error de runtime"
end
puts resultado  # Output: "Hay algo mal que no anda bien", :rt

# Ejemplo con NoMethodError
resultado = ejecutar_con_excepciones(1, 2, 3) do |a, b, c|
  a.non_existent_method
end
puts resultado  # Output: "Y este método? undefined method `non_existent_method' for 1:Integer", :nm

# Ejemplo con otra excepción
begin
  resultado = ejecutar_con_excepciones(1, 2, 3) do |a, b, c|
    raise ArgumentError, "Argumento inválido"
  end
rescue => e
  puts e.message  # Output: "Argumento inválido"
end