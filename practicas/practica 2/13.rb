class TrueClass
  # agregamos en la clase
  def opposite
    false
  end
end

class FalseClass
  # agregamos en la clase
  def opposite
    true
  end
end

# Ejemplo de uso
puts false.opposite  # Output: true
puts true.opposite   # Output: false
puts true.opposite.opposite  # Output: true