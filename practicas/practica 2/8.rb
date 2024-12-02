module ModuloDeInstancia
  def metodo_de_instancia
    "Método de instancia"
  end
end

class MiClase
  include ModuloDeInstancia
end

objeto = MiClase.new
puts objeto.metodo_de_instancia  # Output: Método de instancia

module ModuloDeClase
  def metodo_de_clase
    "Método de clase"
  end
end

class MiClase
  extend ModuloDeClase
end

puts MiClase.metodo_de_clase  # Output: Método de clase