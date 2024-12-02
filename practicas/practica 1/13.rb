def listar(hash)
  hash.each_with_index.map { |(key, value), index| "#{index + 1}. #{key}: #{value}" }.join("\n")
end

puts listar({ perros: 2, gatos: 2, peces: 0, aves: 0 })
