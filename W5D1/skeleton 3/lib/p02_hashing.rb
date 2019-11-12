require "byebug"

class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return_hash = 0
    self.each_with_index do |el, idx|
      return_hash += (el.hash / idx.hash*1.0)
    end
    return_hash.to_i
  end
end

class String
  def hash
    ords = self.chars.map {|char| char.ord}
    ords.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # debugger
    return_hash = 0
    self.each do |k, v|
      return_hash += (k.hash / v.hash)
    end
    return_hash.to_i
  end
end

# a = {a: "a", b: "b"}
# p a.hash == a.hash