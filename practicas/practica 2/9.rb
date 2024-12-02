module Reverso
  def di_tcejbo
    puts self.object_id.to_s.reverse
  end

  def ssalc
    puts self.class.to_s.reverse
  end
end

class Prueba
  include Reverso
end

# Crear una instancia de la clase Prueba
objeto = Prueba.new

# Probar los métodos del módulo Reverso
objeto.di_tcejbo  # Imprime el object_id en orden inverso
objeto.ssalc      # Imprime el nombre de la clase en orden inverso