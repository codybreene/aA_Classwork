class Array
  def my_uniq
    uniq = []
    self.each {|ele| uniq << ele unless uniq.include?(ele)}
    uniq
  end

  def two_sum
    pairs = []
    self.each_with_index do |el1, i1|
      self.each_with_index do |el2, i2|
        pairs << [i1, i2] if i2 > i1 && el1 + el2 == 0
      end
    end
    pairs
  end

  def my_transpose
    transposed = Array.new(self.length) {Array.new(self.length)}

    self.each_with_index do |ele1, row_i|
      self.each_with_index do |ele2, col_i|
        transposed[col_i][row_i] = self[row_i][col_i]
      end
    end  

    transposed

  end

  
end

def stock_picker(stocks)
    largest = 0
    winning_pairs = []

    stocks.each_with_index do |ele1, i1|
      stocks.each_with_index do |ele2, i2|
        if i2 > i1 && (ele2 - ele1) > largest
          winning_pairs = [i1, i2]
          largest = ele2 - ele1
        end
      end
    end

    winning_pairs
end


class TowersOfHanoi

  def initialize
    @tower_1 = [1,2,3,4,5]
    @tower_2 = []
    @tower_3 = []
  end

  def won?
    tower_3.length == 5 ? true : false
  end

  
end