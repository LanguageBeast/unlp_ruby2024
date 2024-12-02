class Usuario
  attr_accessor :usuario, :clave, :email

  def initialize(usuario, clave, email)
    @usuario = usuario
    @clave = clave
    @email = email
  end

  def puede_ver?(documento)
    false
  end

  def puede_modificar?(documento)
    false
  end

  def puede_borrar?(documento)
    false
  end

  def to_s
    "#{email} (Usuario)"
  end
end

class Lector < Usuario
  def puede_ver?(documento)
    documento.publico
  end

  def to_s
    "#{email} (Lector)"
  end
end

class Redactor < Lector
  def puede_modificar?(documento)
    documento.creador == self
  end

  def to_s
    "#{email} (Redactor)"
  end
end

class Director < Usuario
  def puede_ver?(documento)
    !documento.borrado
  end

  def puede_modificar?(documento)
    !documento.borrado
  end

  def to_s
    "#{email} (Director)"
  end
end

class Administrador < Director
  def puede_borrar?(documento)
    true
  end

  def to_s
    "#{email} (Administrador)"
  end
end

# Clase Documento (de 6.rb)
class Documento
  attr_accessor :creador, :contenido, :publico, :borrado

  def initialize(usuario, publico = true, contenido = '')
    self.creador = usuario
    self.publico = publico
    self.contenido = contenido
    self.borrado = false
  end

  def borrar
    self.borrado = true
  end

  def puede_ser_visto_por?(usuario)
    usuario.puede_ver? self
  end

  def puede_ser_modificado_por?(usuario)
    usuario.puede_modificar? self
  end

  def puede_ser_borrado_por?(usuario)
    usuario.puede_borrar? self
  end
end

# Ejemplo de uso
lector = Lector.new('lector1', 'clave1', 'lector1@example.com')
redactor = Redactor.new('redactor1', 'clave2', 'redactor1@example.com')
director = Director.new('director1', 'clave3', 'director1@example.com')
admin = Administrador.new('admin1', 'clave4', 'admin1@example.com')

puts lector.to_s       # => "lector1@example.com (Lector)"
puts redactor.to_s     # => "redactor1@example.com (Redactor)"
puts director.to_s     # => "director1@example.com (Director)"
puts admin.to_s        # => "admin1@example.com (Administrador)"