def longitud(*args)
  args.each do |arg|
    str = arg.to_s
    puts "\"#{str}\" --> #{str.length}"
  end
end


longitud(9, Time.now, 'Hola', {un: 'hash'}, :ruby)
