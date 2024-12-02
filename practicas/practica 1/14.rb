def listar_mejorada(hash, pegamento = ": ")
  hash.each_with_index.map { |(key, value), index| "#{index + 1}. #{key}#{pegamento}#{value}" }.join("\n")
end


puts listar_mejorada({ perros: 2, gatos: 2, peces: 0, aves: 0 })
puts listar_mejorada({ perros: 2, gatos: 2, peces: 0, aves: 0 }, " -> ")
