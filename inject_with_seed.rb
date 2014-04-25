class Array
  def my_inject(seed=nil)
    accumulator = seed
    self.each do |ele|
      accumulator = yield(accumulator, ele)
      end
    accumulator
  end
  
end
