class Array
  def my_map(arg)
    newarr = []
    self.each do |element|
      newarr << yield(arg, element)
    end
    newarr
  end
end
