require_relative "./card.rb"

class Deck 

  POSSIBLE_VALUES = [
    1,2,3,4,5,6,7,8,9,10,11,12,13
  ]

  POSSIBLE_SUITS = [
    :♧, :♠️, :♢, :♡
  ]

  def initialize
    @cards = []
    @shuffled = false
    generate_deck
  end

  def generate_deck
    POSSIBLE_SUITS.each do |suit| 
      POSSIBLE_VALUES.each do |value|
        @cards << Card.new(value, suit)
      end
    end
  end

  def shuffle_deck
    @cards.shuffle!
  end

  def deal_card(n)
    dealt_cards = []
    while dealt_cards.length < n  
      dealt_cards << @cards.pop
    end
    dealt_cards
  end

end