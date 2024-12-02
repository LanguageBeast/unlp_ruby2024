def cuanto_falta?(time = nil)
  now = Time.now
  target_time = time || Time.new(now.year, now.month, now.day + 1)
  ((target_time - now) / 60).to_i
end

puts cuanto_falta?(Time.new(2032, 12, 31, 23, 59, 59))

puts cuanto_falta?
