# to_s

123.to_s          # => "123"
:my_symbol.to_s   # => "my_symbol"
[1, 2, 3].to_s    # => "[1, 2, 3]"
{a: 1, b: 2}.to_s # => "{:a=>1, :b=>2}"

# inspect -> es más detallado que to_s
123.inspect          # => "123"
:my_symbol.inspect   # => ":my_symbol"
[1, 2, 3].inspect    # => "[1, 2, 3]"
{a: 1, b: 2}.inspect # => "{:a=>1, :b=>2}"

# interpolar variables: usa to_s

El número es #{123}"          # => "El número es 123"
a = "El símbolo es #{:my_symbol}"  # => "El símbolo es my_symbol"
b = "El array es #{[1, 2, 3]}"     # => "El array es [1, 2, 3]"
c = "El hash es #{ {a: 1, b: 2} }" # => "El hash es {:a=>1, :b=>2}"

# con format o sprintf

format("El número es %d", 123)          # => "El número es 123"
sprintf("El símbolo es %s", :my_symbol) # => "El símbolo es my_symbol"

