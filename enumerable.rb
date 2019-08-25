module Enumerable
  def my_each
    index = 0
    while index < self.length
    yield(self[index])
      index += 1
    end
    self
  end
  def my_each_with_index
    index = 0
    while index < self.length
      yield(self[index], index)
      index += 1
    end
    self
  end
  def my_select
    arr = []
    self.my_each {|n| arr << n if yield(n)}
    arr
  end
  def my_all?
    all = false
    self.my_each {|x| yield(x) ? all = true : all = false }
    all
  end
  def my_any?
    any = false
    self.my_each {|x| any = true if yield(x)}
    any
  end
  def my_none?
    none = true
    self.my_each {|x| none = false if yield(x)}
    none
  end
  def my_count
    number=nil
    counter = 0
    if number
      self.my_each {|x| counter += 1 if x == number}
    elsif block_given?
      self.my_each {|x| counter += 1 if yield(x)}
    else
      counter = self.length
    end
    counter
  end
  def my_map
    block=nil
    array= Array.new()
    if block
      self.my_each_with_index {|x,index| array[index] = block.call(x)}
    else
      self.my_each_with_index {|x,index| array[index] = yield(x)}
    end
    array
  end
  def my_inject
    start=nil
    start == nil ? ans = self[0] : ans = start
    for i in 1..self.length - 1
      ans = yield(ans,self[i])
    end
    ans
  end
end


array = [4,5,6]
#array.my_each {|num|  puts num*2}

array.my_each_with_index { |val,index| print " #{index} #{val}" }

#array.select { |n| puts n.even? }
#array.my_select { |n| puts n.even? }

#puts array.all?{|x| x>3 }
#puts array.all? (Numeric)

#puts array.my_all? {|x| x>2 }
#puts array.my_all? {|x| x<89 }
#puts [nil, true, 99].my_all?

#puts array.my_any? {|x| x>88 }
#puts array.any? {|x| x>88 }

#puts array.none? {|x| x>88 }
#puts array.my_none? {|x| x>88 }

#puts array.count {|x| x }
#puts array.my_count {|x| x }

#puts array.map {|num| num * 10 }
#puts array.my_map {|num| num * 10 }

#puts array.inject {|x,y| x * y}
#puts array.my_inject {|x,y| x * y}