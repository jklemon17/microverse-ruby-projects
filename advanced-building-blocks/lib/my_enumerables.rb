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

   def my_all?
     all = true
     # Runs through each element to check if any DO NOT meet condition.
     self.my_each do |element|
       if !yield(element)
         all = false
         break # No need to continue after a false is found.
       end
     end
     all  # Implicit return
   end

   def my_any?
     any = false
     # Runs through each element to check if any meet condition.
     self.my_each do |element|
       if yield(element)
         any = true
         break # No need to continue after a true is found.
       end
     end
     any  # Implicit return
   end

   def my_none1? #NOTE: This method is significantly slower than my_none2?
     !self.my_any? {yield}
   end
   def my_none2?
     none = true
     # Runs through each element to check if any meet condition.
     self.my_each do |element|
       if yield(element)
         none = false
         break # No need to continue after a true is found.
       end
     end
     none  # Implicit return
   end

   def my_count
     count = 0
     self.my_each { |element| count +=1 if yield(element) }
     count
   end

   def my_map(&my_proc) # This does not REQUIRE a proc, but allows it.
     mapped_array = []
     unless block_given? # block_given? is a built-in keyword to check whether a block was passed to the method.
       self.my_each { |element| mapped_array.push(my_proc.call) }
     else
       self.my_each { |element| mapped_array.push(yield(element)) }
     end
     mapped_array
   end

   def my_inject(injected)
     output = injected
     self.my_each { |element| output = yield(output, element) }
     #injected = self.my_each(yield)
     output #injected
   end

end

array = ["Hey", "Hello", "Hurray", "SSR", 42]

# array.my_each { |x| print "#{x} " }
# array.my_each_with_index { |element, index| print "'#{element}' is at #{index}, " }
#print array.my_select { |element| element.to_s.length > 3 }
# print array.my_all? {|e| e.to_s.length < 3}
# print array.all? {|e| e.to_s.length < 3}
# print "\n"
# print array.my_all? {|e| e.to_s.length > 1}
# print array.all? {|e| e.to_s.length > 1}
# print "\n"

# print array.my_any? {|e| e.to_s.length > 1}
# print array.any? {|e| e.to_s.length > 1}
# print "\n"
# print array.my_any? {|e| e.to_s.length > 7}
# print array.any? {|e| e.to_s.length > 7}
# print "\n"

# start1 = Time.now
# 10000.times do
#   array.my_none1? {|e| e.to_s.length > 7}
#   array.my_none1? {|e| e.to_s.length > 4}
# end
# end1 = Time.now
# puts "None1 took #{end1 - start1}."
#
# start2 = Time.now
# 10000.times do
#   array.my_none2? {|e| e.to_s.length > 7}
#   array.my_none2? {|e| e.to_s.length > 4}
# end
# end2 = Time.now
# puts "None2 took #{end2 - start2}."
#
# None1 took 0.032061421.
# None2 took 0.018276347.
#
# print array.my_count {|e| e.to_s.length > 1}
# print array.count {|e| e.to_s.length > 1}
# print "\n"

# print array.my_map { |e| e.to_s + "!" }
# print "\n"

my_proc1 = Proc.new {|e| e.to_s + "!!!"}
# print array.my_map(&my_proc1)
# print "\n"


# print array.map { |e| e.to_s + "!" }
# print "\n"


# num_array = [1,2,3,4,5]
#
# my_var = num_array.my_inject(0) do |sum, e|
#   sum + e
# end
# my_var2 = num_array.inject do |sum, e|
#   sum + e
# end
#
# print my_var
# print "\n"
# print my_var2
# print "\n"
#
# print array.my_inject("") do |final, e|
#   final + e.to_s
# end

#
# def multiply_els(array)
#   array.my_inject(1) {|multiplied, element| multiplied * element }
# end
#
# print multiply_els([2,4,5])
# print "\n"
