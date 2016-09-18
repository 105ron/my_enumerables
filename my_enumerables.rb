module Enumerable
  
  def my_each
    return self unless block_given?
    i = 0
    while i < self.size
      yield(self[i])  
      i+=1      
    end
    self
  end


  def my_each_with_index
  	return self unless block_given?
    i = 0
    while i < self.size
      yield(self[i], i)  
      i+=1      
    end
    self
  end
  

  def my_select
    new_array = []
    my_each { |i| new_array << i if yield(i) }
		new_array
  end


  def my_all?
    my_each { |i| return false unless yield(i) }
		return true
  end


  def my_none?
    my_each { |i| return true unless yield(i) }
		return false
  end


  def my_count
  	iterator = 0
  	my_each { iterator +=1 if yield(i) }
  	iterator
  end

  def my_map
    new_array = []
    my_each {|i| new_array << yield(i)}
    self.replace new_array
    return self
  end


end
