require_relative './modules/winning_hands.rb'

class Hand

  include WinningHands

  attr_accessor :cards
  def initialize
    @cards = []
  end

  def add_card_to_hand(new_card)
    @cards << new_card
  end

  def reset
    @cards = []
  end

  def remove_card_from_hand(card_index)
    @cards.delete_at(card_index)
  end

  def hand_point_total(cards)
    hand_total(cards.sort)
  end

  def consolidate_hand
    @cards.reject! {|card| card.nil?}
  end

  def []=(idx, value)
    @cards[idx] = value if value.nil?
  end
end