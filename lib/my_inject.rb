# ITERATION METHOD

# class Array
#   def my_inject(arg=:nothing_here)
#     return nil if self.empty?
#     newarray = self.dup
#     if arg == :nothing_here
#       arg = newarray[0]
#       newarray.shift
#     end
#     accumulator = arg
#     newarray.each do |element|
#       accumulator = yield(accumulator, element)
#     end
#     accumulator
#   end
# end

# RECURSIVE METHOD

class Array
  def my_inject(accumulator=:nothing_here, &block)
    return nil if self.empty?
    recursor = self.dup
      if accumulator == :nothing_here
        accumulator = recursor[0]
        recursor.shift
      end
      return yield(accumulator, recursor[0]) if recursor.count == 1
      num = recursor.shift
      accumulator = yield(accumulator,num)
      recursor.my_inject(accumulator, &block)
  end
end
