
class Deck
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  SUITS = [:spades, :clubs, :diamonds, :hearts]

  attr_reader :card_count, :active_deck

  def initialize
    @active_deck = []
    @card_count = 0
    create_new_deck
    shuffle_deck
  end

  def create_new_deck
    VALUES.each do |value|
      SUITS.each do |suit|
        @active_deck << [value, suit]
        @card_count += 1
      end
    end
  end

  def shuffle_deck
    @active_deck.shuffle!
  end

  def deal_card
    @card_count -= 1
    @active_deck.pop
  end
end