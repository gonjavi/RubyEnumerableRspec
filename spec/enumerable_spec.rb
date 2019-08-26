require "./enumerable.rb"

RSpec.describe Enumerable do 
  let(:array) { [4,5,6] }
  let(:array1) { [-2,-5,-4] }
  
  describe "#my_each" do 
    it "it tests each value of the array compare with the original array " do 
      expect(array.my_each { |x| x }).to eql(array)
    end
    
    it "it tests each value of the array with negative values" do 
      expect(array1.my_each { |x| x }).to eql([-2,-5,-4])
		end
  end
  
  describe "#my_each_with_index" do 
    it "it tests each value of the array and compare each index" do
      expect(array.my_each_with_index { |x, i| array[i] = i }).to eql([0, 1, 2])
    end

    it "it tests each value of the array and compare each index" do
      expect(array1.my_each_with_index { |x, i| array1[i] = i }).to eql([0, 1, 2])
    end
  end

  describe "#my select" do
    it "it selects only the even numbers of the array" do 
      expect(array.my_select { |n| n.even? } ).to eq([4,6] )
    end

    it "it selects only the even numbers of the array in this case negative numbers" do 
      expect(array1.my_select { |n| n.even? } ).to eq([-2,-4] )
    end
  end

  describe "#my_all?" do 
    it "it returns true if all numbers of the array are greater than 3" do 
      expect(array.my_all? { |x| x > 3 }).to eq(true)
    end

    it "it returns true if all numbers of the array are numeric" do 
      expect(array.my_all? { |x| (Numeric) }).to eq(true)
    end

    it "it returns false if all numbers of the array are less than 7" do 
      expect(array.my_all? { |x| x > 7 } ).to eq(false)
    end
  end

  describe "#my_any" do
    it "it tests if any value is greater than 7" do
      expect(array.my_any? { |x| x > 7 } ).to eq(false)
    end

    it "it tests if any value is equal to 4" do
      expect(array.my_any? { |x| x == 4 } ).to eq(true)
    end

  end

  describe "#my_none" do 
    it "it tests if none value of the array is greater than 8, if it is correct return true" do
      expect(array.my_none? { |x| x > 8 } ).to eq(true)
    end

    it "it tests if none value of the array is less than 5, if it is not correct return false, in this case there is a 4, it should return false" do
      expect(array.my_none? { |x| x < 5 } ).to eq(false)
    end
  end

  describe "#my_count" do
    it "it counts all the numbers of the array, there are 3 numbers, it should return 3" do
      expect(array.my_count { |x| x } ).to eq(3)
    end
  end

  describe "#my_map" do
    it "it iterates each number on the array and multiplies it by 10 and returns the array with the new values" do 
      expect([4,5,6].my_map {|num| num * 10 } ).to eq([40, 50, 60])
    end
  end

  describe "#my_inject" do 
    it "it iterates each number of the array and multiply each value and return the total result" do
      expect(array.my_inject {|x,y| x * y}).to eq(120)
    end
  end
end