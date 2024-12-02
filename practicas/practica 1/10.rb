# este código devuelve el array ["TTPS RUBY", "ttps ruby", "Ttps ruby", "ttps rUBY"].

=begin
Explicación
[:upcase, :downcase, :capitalize, :swapcase] es un array de símbolos que representan métodos de la clase String.
map itera sobre cada elemento del array y aplica el bloque a cada uno.
Dentro del bloque, "TTPS Ruby".send(meth) llama al método correspondiente en la cadena "TTPS Ruby". El método send permite invocar un método por su nombre (en este caso, el símbolo meth).
=end