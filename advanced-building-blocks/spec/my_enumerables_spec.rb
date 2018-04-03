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
  #   context "" do
  #     it "" do
  #       expect()
  #     end
  #   end
  #   context "" do
  #     it "" do
  #       expect()
  #     end
  #   end
  #   context "" do
  #     it "" do
  #       expect()
  #     end
  #   end
  # end
  #
  # describe "#my_select" do
  #   context "" do
  #     it "" do
  #       expect()
  #     end
  #   end
  #   context "" do
  #     it "" do
  #       expect()
  #     end
  #   end
  #   context "" do
  #     it "" do
  #       expect()
  #     end
  #   end
  # end
  #
  #
  #
  #
end
