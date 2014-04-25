class Array
  def my_inject(arg=:nothing_here)
    return nil if self.empty?
    if arg == :nothing_here
      arg = self[0]
      self.shift
    end
    accumulator = arg
    self.each do |element|
      accumulator = yield(accumulator, element)
    end
    accumulator
  end
end

# my_array = [1,2,3,4,5,6,7]

# result = my_array.my_inject do |acc, ele| acc + ele end

# puts result.inspect
