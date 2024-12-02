#El método send se utiliza para invocar métodos de un objeto, incluyendo métodos privados y protegidos. Es útil en situaciones donde necesitas llamar a un método cuyo nombre se determina en tiempo de ejecución o cuando necesitas acceder a métodos privados para pruebas o metaprogramación.

# 1
method_name = :upcase
"hello".send(method_name)
# => "HELLO"

# 2
class MyClass
  private
  def secret_method
    "This is a secret"
  end
end

obj = MyClass.new
obj.send(:secret_method)
# => "This is a secret"

#El método public_send es similar a send, pero solo permite invocar métodos públicos. Es útil cuando quieres asegurarte de que no se accedan métodos privados o protegidos, manteniendo así la encapsulación y seguridad del objeto.

# 1
method_name = :upcase
"hello".public_send(method_name)
# => "HELLO"

# 2

class MyClass
  private
  def secret_method
    "This is a secret"
  end
end

obj = MyClass.new
obj.public_send(:secret_method)
# => NoMethodError: private method `secret_method' called for #<MyClass:0x000055b8c8b8c8b8>