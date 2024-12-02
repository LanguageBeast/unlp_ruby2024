fibonacci = Enumerator.new do |yielder|
  a = 0
  b = 1
  loop do
    yielder << a
    a, b = b, a + b
  end
end

# Imprimir los primeros 10 números de la serie de Fibonacci
10.times { puts fibonacci.next }

# Reiniciar el enumerador y obtener los primeros 10 números nuevamente
fibonacci.rewind
puts fibonacci.take(10).inspect