require "./enumerable.rb"

RSpec.describe Enumerable do 
  let(:array) { [4,5,6] }
  let(:my_each_arr) { array.my_each { |n| n } } 
  describe "#my_each" do 
   
    it "it tests my each" do 
      expect(my_each_arr).to eq(array)
		end
  end
  
  describe "#my_each_with_index" do 
    
    it "it tests my each with index" do
      expect(array.my_each_with_index { |val,index| print " #{index} #{val}" }).to eq(array.each_with_index { |val,index| print " #{index} #{val}" })
    end
  end

  describe "#my select" do
    
    it "it test my select" do 
     # expect(array.my_select { |n| puts n.even? }).to eq(array.select { |n| puts n.even? })
    end

  end

  describe "#my_all?" do 
    
    it "it tests my all?" do 
      expect(array.my_all?{|x| x>3 }).to eq(true)
    end

    it "it tests my all?" do 
      expect(array.my_all?{|x| (Numeric) }).to eq(true)
    end

    it "it tests my all?" do 
      expect(array.my_all?{|x| x>7 }).to eq(false)
    end
  end

  describe "#my_any" do
    it "it tests if any greater than 7" do
      expect(array.my_any? {|x| x>7 }).to eq(false)
    end

    it "it tests if any equal to 4" do
      expect(array.my_any? {|x| x==4 }).to eq(true)
    end

  end

  describe "#my_none" do 

    it "it tests if none greater than 8" do
      expect(array.my_none? {|x| x>8 }).to eq(true)
    end

    it "it tests if none less than 5" do
      expect(array.my_none? {|x| x<5 }).to eq(false)
    end
  end

  describe "#my_count" do
    it "it tests my count" do
      expect(array.my_count {|x| x }).to eq(3)
    end
  end

  describe "" do 

  end

  describe "" do 

  end
end