class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !self.include?(key)
      self[key] << key  
      @count += 1
    end
    if @count >= num_buckets 
      resize!
    end
    
  end

  def include?(key)
    return true if self[key].include?(key)
    false
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    @store[num.hash % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(2*num_buckets) {Array.new}
    @store.each do |bucket|
      bucket.each do|el|
        new_store[el.hash % new_store.length] << el
      end
    end
    @store = new_store 
  end
end
