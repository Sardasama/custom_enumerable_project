module Enumerable
  def my_each_with_index
    i = 0
    my_each do |elem|
      yield elem, i
      i += 1
    end
  end

  def my_select
    selected = []
    my_each do |elem|
      selected << elem if yield elem
    end
    selected
  end

  def my_all?
    my_each do |elem|
      return false unless yield elem
    end
    true
  end

  def my_any?
    my_each do |elem|
      return true if yield elem
    end
    false
  end

  def my_none?
    my_each do |elem|
      return false if yield elem
    end
    true
  end

  def my_count(&test_block)
    counter = 0 
    self.each do |elem|
      if block_given?
        counter +=1 if yield elem
      else
        counter +=1
      end
    end
  end

  def my_map
    new_arr = []
    self.my_each do |elem|
      new_arr.push(yield elem)
    end
    new_arr
  end

  def my_inject
    result = 0
    self.each do |elem|
      result = yield result, elem
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method

class Array
  def my_each
    for i in 0..length - 1
      yield self[i]
    end
  end
end

a = [1, 2, 3]
#a.my_each_with_index { |v, i| puts "#{v} #{i}" }
#puts a.my_select { |n| n == 2 }
my_lambda = -> n { n > 1 }
#puts a.my_all? &my_lambda
#puts a.my_any? &my_lambda
#puts a.my_none? &my_lambda
#puts a.my_count &my_lambda
#print a.my_map { |n| n.to_i + 1 }
print a.my_inject{|sum, number| sum + number}
