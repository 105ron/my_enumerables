module Enumerable
  
  def my_each
    return "#<Enumerator: #{self}:my_each>" unless block_given?
    i = 0
    while i < self.size
      yield(self[i])  
      i+=1      
    end
    self
  end


  def my_each_with_index
  	return "#<Enumerator: #{self}:my_each_with_index>" unless block_given?
    i = 0
    while i < self.size
      yield(self[i], i)  
      i+=1      
    end
    self
  end
  

  def my_select
    return "#<Enumerator: #{self}:my_select>" unless block_given?
    new_array = []
    my_each { |i| new_array << i if yield(i) }
		new_array
  end


  def my_all?
    if block_given?
      my_each { |i| return false unless yield(i) }
    else
      return true
    end
    return true
  end
  

  def my_any?
    if block_given?
      my_each { |i| return true if yield(i) }
    else
      my_each { |i| return true if (i)}
    end
    return false
  end


  def my_none?
    if block_given?
      my_each { |i| return false if yield(i) }
    else
      my_each { |i| return false if (i)}
    end
    return true
  end


  def my_count
    if block_given?
      iterator = 0
      my_each { |i| iterator +=1 if yield(i) }
      iterator
    else
      return self.size
    end
  end


  def my_map #Does not accept procs
    return "#<Enumerator: #{self}:my_map>" unless block_given?
    new_array = []
    my_each {|i| new_array << yield(i)}
    self.replace new_array
    return self
  end

  def my_inject(first_element = nil) #need unless block_given?
    result = first_element.nil? ? nil : first_element
    for i in self
      result = yield(result,i)
    end
    return result
  end


end

def multiply_els(input)
  input.my_inject(1) {|initial, sum| initial * sum}
end
puts multiply_els([2,4,5])