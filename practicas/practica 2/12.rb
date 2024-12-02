# Módulo GenericFactory
module GenericFactory
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def create(*args)
      new(*args)
    end
  end
end

# Subclase Product
class Product
  include GenericFactory

  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

# Subclase User
class User
  include GenericFactory

  attr_accessor :username, :email

  def initialize(username, email)
    @username = username
    @email = email
  end
end

# Ejemplo de uso
product = Product.create("Laptop", 1500)
puts product.name  # Output: Laptop
puts product.price # Output: 1500

user = User.create("john_doe", "john@example.com")
puts user.username # Output: john_doe
puts user.email    # Output: john@example.com