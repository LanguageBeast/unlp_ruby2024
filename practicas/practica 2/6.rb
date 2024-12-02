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
end

class Lector < Usuario
  def puede_ver?(documento)
    documento.publico
  end
end

class Redactor < Lector
  def puede_modificar?(documento)
    documento.creador == self
  end
end

class Director < Usuario
  def puede_ver?(documento)
    !documento.borrado
  end

  def puede_modificar?(documento)
    !documento.borrado
  end
end

class Administrador < Director
  def puede_borrar?(documento)
    true
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

doc_publico = Documento.new(redactor, true, 'Contenido público')
doc_privado = Documento.new(redactor, false, 'Contenido privado')

puts lector.puede_ver?(doc_publico) # true
puts lector.puede_ver?(doc_privado) # false
puts redactor.puede_modificar?(doc_publico) # true
puts director.puede_modificar?(doc_privado) # true
puts admin.puede_borrar?(doc_privado) # true