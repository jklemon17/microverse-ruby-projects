module Enumerable
  # my version of the ".each" method:
   def my_each
     # loop through each value in the array fed to this method, which is  "self"
     for element in self
       yield(element)
     end
   end

   def my_each_with_index
     i = 0
     for element in self
       yield(element, i)
       i += 1
     end
   end

   def my_select
     new_array = []
     self.my_each { |element| new_array.push(element) if yield(element) }
     return new_array
   end


 end

array = ["Hey", "Hello", "Hurray", "SSR", 42]

# array.my_each { |x| print "#{x} " }
# array.my_each_with_index { |element, index| print "'#{element}' is at #{index}, " }
print array.my_select { |element| element.to_s.length > 3 }
print "\n"
