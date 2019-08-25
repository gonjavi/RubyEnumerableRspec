require "./enumerable.rb"

RSpec.describe Enumerable do 
  let(:array) { [4,5,6] }
  let(:my_each_arr) { array.my_each { |n| n } } 
  myindex = Proc.new { [4,5,6].my_each_with_index { |val,index| index } } 
  mapy = Proc.new { [4,5,6].my_map {|num| num * 10 } }
  selecty = Proc.new { [4,5,6].my_select { |n| n.even? } }

  describe "#my_each" do 
    it "it tests my each" do 
      expect(my_each_arr).to eq(array)
		end
  end
  
  describe "#my_each_with_index" do 
    it "it tests my each with index" do
      expect(array.my_each_with_index { |x, i| array[i] = i }).to eql([0, 1, 2])
    end
  end

  describe "#my select" do
    it "it test my select" do 
      expect([4,5,6].my_select { |n| n.even? } ).to eq([4,6] )
    end
  end

  describe "#my_all?" do 
    it "it tests my all?" do 
      expect(array.my_all? { |x| x > 3 }).to eq(true)
    end

    it "it tests my all?" do 
      expect(array.my_all? { |x| (Numeric) }).to eq(true)
    end

    it "it tests my all?" do 
      expect(array.my_all? { |x| x > 7 } ).to eq(false)
    end
  end

  describe "#my_any" do
    it "it tests if any greater than 7" do
      expect(array.my_any? { |x| x > 7 } ).to eq(false)
    end

    it "it tests if any equal to 4" do
      expect(array.my_any? { |x| x == 4 } ).to eq(true)
    end

  end

  describe "#my_none" do 
    it "it tests if none greater than 8" do
      expect(array.my_none? { |x| x > 8 } ).to eq(true)
    end

    it "it tests if none less than 5" do
      expect(array.my_none? { |x| x < 5 } ).to eq(false)
    end
  end

  describe "#my_count" do
    it "it tests my count" do
      expect(array.my_count { |x| x } ).to eq(3)
    end
  end

  describe "#my_map" do
    it "it tests my map" do 
      expect(mapy.call).to eq([40, 50, 60])
    end
  end

  describe "#my_inject" do 
    it "it tests my inject" do
      expect(array.my_inject {|x,y| x * y}).to eq(120)
    end
  end
end