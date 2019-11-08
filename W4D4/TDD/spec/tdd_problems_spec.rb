require "tdd_problems.rb"

describe "#my_uniq" do
  subject(:my_arr) { [1,2,1,3,3] }

  context "gereates an array of uniq elements from an array" do
    it "should be called on an array" do
      #is there a way to check that the receiver is an array? 
      expect{ 5.my_uniq }.to raise_error(NoMethodError) 
      expect{ "array".my_uniq }.to raise_error(NoMethodError) 
    end
    it "should return uniq elements" do
      expect(my_arr.my_uniq).to eq(my_arr.uniq)
    end
    it "should return an array" do
      expect(my_arr.my_uniq.class).to eq(Array) 
    end
  end
end

describe "#two_sum" do
  
  subject(:my_arr) {[-1, 0, 2, -2, 1]}
  it "should return a two-d array" do 
    expect(my_arr.two_sum.class).to eq(Array)
  end

  it "should return pairs only when their sum is zero" do
    check = my_arr.two_sum.all? {|pair| my_arr[pair[0]] + my_arr[pair[1]] == 0}
    expect(check).to eq(true)
  end

  context "when first elements are different" do    
    it "should return elements in ascending order, by first element" do
      expect(my_arr.two_sum[0][0] < my_arr.two_sum[1][0]).to eq(true)
    end
  end

  subject(:my_arr_2) {[-1,1,1]}
  context "when first elements are equal" do    
    it "should return elements in ascending order by second element" do    
      expect(my_arr_2.two_sum[0][1] < my_arr_2.two_sum[1][1]).to eq(true)
    end
  end

end


describe "#my_transpose" do
  subject(:my_arr) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}

  it "should return a two-d array" do 
    two_d = my_arr.my_transpose.all? {|ele| ele.is_a?(Array)}
    expect(two_d).to eq(true)
    expect(my_arr.my_transpose.class).to eq(Array)
  end

  it "should flip rows and cols" do 
    expect(my_arr.my_transpose).to eq(my_arr.transpose)
  end
end

describe "#stock_picker" do

  subject(:days) {[50,55,49,60,61,30]}
  it "should return an array of length 2" do
    expect(stock_picker(days).length).to eq(2)
    expect(stock_picker(days).class).to eq(Array)
  end

  it "should return indexes in acending order" do
    expect(stock_picker(days)[0]).to be < (stock_picker(days)[1])
  end

  it "should return pair of indexes representing greatest difference" do
    expect(stock_picker(days)).to eq([2, 4])
  end

end

describe TowersOfHanoi do    
  subject(:tower) {TowersOfHanoi.new}
  describe "#move" do    
    it "should call gets" do    
      expect(tower.move).to receive(:gets)
    end
  end

  describe "#initialize" do
    it "should set tower_1 to all the disks and other towers to empty arrays" do
      expect(tower.tower_1).to eq([1,2,3,4,5])
      expect(tower.tower_2).to eq([])
      expect(tower.tower_3).to eq([])
    end

    it "shoud set won to false" do
      expect(tower.won).to eq(false)
    end


  end

  describe "#won?" do
    it "should return a boolean indicationg the game is over" do
      expect(tower.won?).to be_in([true, false])
    end
  end
end
