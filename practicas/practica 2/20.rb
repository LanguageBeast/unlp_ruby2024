class Array
  def randomly
    shuffled_array = self.shuffle
    if block_given?
      shuffled_array.each { |element| yield(element) }
    else
      shuffled_array.to_enum
    end
  end
end