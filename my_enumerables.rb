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
    my_each { |i| new_array << i if yield(i) }
		if self == new_array
			return true
		else
			return false
		end
  end
end
