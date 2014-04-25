# ITERATION METHOD

class Array
  def my_inject(arg=:nothing_here)
    return nil if self.empty?
    newarray = self.dup
    if arg == :nothing_here
      arg = newarray[0]
      newarray.shift
    end
    accumulator = arg
    newarray.each do |element|
      accumulator = yield(accumulator, element)
    end
    accumulator
  end
end

# RECURSIVE METHOD

# class Array
#   def my_inject(arg=:nothing_here, &block)
#     return nil if self.empty?
#       if arg == :nothing_here
#         arg = self[0]
#         self.shift
#         puts "arg = #{arg}"
#       end
#       return yield(arg, self[0]) if self.count == 1
#       num = self.shift
#       puts "num = #{num}"
#       arg = yield(arg,num)
#       self.my_inject(arg, &block)
#   end
# end


# my_array = [1,2,3,4,5,6,7]

# result = my_array.my_inject do |acc, ele| acc + ele end

# puts result.inspect
