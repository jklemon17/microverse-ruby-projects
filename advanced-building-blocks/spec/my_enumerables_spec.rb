require 'my_enumerables'

describe Enumerable do

  before do
    @my_array = ["Hey", "Hello", "Hurray", "SSR", 42]
  end

  describe "#my_each" do
    context "given a block" do
      it "prints each element" do
        expect(@my_array.my_each { |x| print "#{x} "}).to eql(@my_array.each { |x| print "#{x} "})
      end
    end
    context "given a block" do
      it "concatenates the elements" do
        @string = ""
        @my_array.my_each { |x| @string += x.to_s }
        expect(@string).to eql("HeyHelloHurraySSR42")
      end
    end
  end

  describe "#my_select" do
     context "given 'element.length < 4'" do
       it "returns the items with length less than 4" do
         expect(@my_array.my_select { |element| element.to_s.length < 4 }).to eql(["Hey", "SSR", 42])
       end
     end
     context "given select only integers" do
       it "returns only the integers" do
         expect(@my_array.my_select { |element| element.is_a?(Integer) }).to eql([42])
       end
     end
     context "given select only values > 50" do
       it "returns an empty array" do
         expect(@my_array.my_select { |element| element.to_i > 50 }).to eql([])
       end
     end
  end

  describe "#my_all?" do
     context "given strings of various lengths" do

       context "check if all string lengths < 3" do
         it "returns false" do
           expect(@my_array.my_all? { |element| element.to_s.length < 3 }).to eql(false)
         end
       end
       context "check if all string lengths > 1" do
         it "returns true" do
           expect(@my_array.my_all? { |element| element.to_s.length > 1 }).to eql(true)
         end
       end

     end
   end

  describe "#my_any?" do
     context "given strings of various lengths" do

       context "check if any string lengths > 7" do
         it "returns false" do
           expect(@my_array.my_any? { |element| element.to_s.length > 7 }).to eql(false)
         end
       end
       context "check if any string lengths > 1" do
         it "returns true" do
           expect(@my_array.my_any? { |element| element.to_s.length > 1 }).to eql(true)
         end
       end

     end
   end

  describe "#my_none2?" do
     context "given strings of various lengths" do

       context "check if none of the strings lengths > 1" do
         it "returns false" do
           expect(@my_array.my_none2? { |element| element.to_s.length > 1 }).to eql(false)
         end
       end
       context "check if none of the strings lengths > 7" do
         it "returns true" do
           expect(@my_array.my_none2? { |element| element.to_s.length > 7 }).to eql(true)
         end
       end

     end
   end

  describe "#my_map" do

     context "given an array" do
       it "adds '!!!' to each value" do
         expect(@my_array.my_map { |element| element.to_s + "!!!" }).to eql(["Hey!!!", "Hello!!!", "Hurray!!!", "SSR!!!", "42!!!"])
       end

       it "returns the first letter of each value" do
         expect(@my_array.my_map { |element| element.to_s[0] }).to eql(["H", "H", "H", "S", "4"])
       end
     end
   end

end
