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
  #edge cases tested to here

  def my_none?
    if block_given?
      my_each { |i| return false if yield(i) }
		  return true
    else
      return false
    end
  end


  def my_count
    if block_given?
      iterator = 0
      my_each { iterator +=1 if yield(i) }
      iterator
    else
      return self.size
    end
  end

  def my_map
    return "#<Enumerator: #{self}:map>" unless block_given?
    new_array = []
    my_each {|i| new_array << yield(i)}
    self.replace new_array
    return self
  end


end
