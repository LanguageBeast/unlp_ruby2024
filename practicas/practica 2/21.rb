# Método auxiliar para verificar si un número es primo
def es_primo?(num)
  return false if num < 2
  (2..Math.sqrt(num)).each do |i|
    return false if num % i == 0
  end
  true
end

# Enumerador de números primos que termina al encontrar el enésimo número primo
def enumerador_primos(n)
  Enumerator.new do |yielder|
    count = 0
    num = 2
    while count < n
      if es_primo?(num)
        yielder << num
        count += 1
      end
      num += 1
    end
  end
end

# Ejemplo de uso
n = 10
primos = enumerador_primos(n)
puts primos.take(n).inspect  # Output: Los primeros 10 números primos