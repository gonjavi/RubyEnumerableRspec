require "./enumerable.rb"

RSpec.describe Enumerable do 
 
  #let(:array) { [4, 5, 6] }
  describe "#my_each" do 
    each_arr = Proc.new { [1,2,3].each { |n| n } } 
    my_each_arr = Proc.new { [1,2,3].my_each { |n| n } } 
    it "it tests my each" do 
     
      expect(my_each_arr.call).to eq(each_arr.call)
		end
  end
  
  describe "#my_each_with_index" do 

   
  end

  describe "" do 

  end

  describe "" do 

  end

  describe "" do 

  end

  describe "" do 

  end

  describe "" do 

  end

  describe "" do 

  end

  describe "" do 

  end
end