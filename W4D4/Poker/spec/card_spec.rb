describe Card do 
  subject(:card) {Card.new}
  describe "#initialize" do 
    it "should have a value selected from POSSIBLE_VALUES" do
      expect(card.value).to be_in(Card::POSSIBLE_VALUES)
    end

    it "should have a suit selected from POSSIBLE_SUITS" do   
      expect(card.suit).to be_in(Card::POSSIBLE_SUITS)
    end
  end
end


