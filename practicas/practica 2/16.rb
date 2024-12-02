def procesar_hash(hash, proc)
  nuevo_hash = {}
  hash.each do |clave, valor|
    nuevo_hash[valor] = proc.call(clave)
  end
  nuevo_hash
end

# Ejemplo de uso
hash = { 'clave' => 1, :otra_clave => 'valor' }
resultado = procesar_hash(hash, ->(x) { x.to_s.upcase })
puts resultado.inspect
# => { 1 => 'CLAVE', 'valor' => 'OTRA_CLAVE' }