def da_nil?
  yield.nil?
end

# Ejemplos de uso
puts da_nil? { }  # => true
puts da_nil? { 'Algo distinto de nil' }  # => false