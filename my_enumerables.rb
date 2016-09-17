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
  	new_array = []
    my_each { |i| return false unless yield(i) }
		return true
  end


  def my_none?
  	new_array = []
    my_each { |i| return true unless yield(i) }
		return false
  end

  
end
