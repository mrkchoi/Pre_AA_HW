# require 'byebug'
require_relative 'hand'

class Player
  attr_reader :hand, :pot, :active, :name, :position

  def initialize(name, position)
    @position = position
    @name = name
    @hand = Hand.new
    @pot = 1000
    @active = true
  end

  def discard(card_indices) # => [0]
    # debugger
    card_indices.each do |removal_card_idx|
      @hand.cards.each_with_index do |card, current_hand_idx|
        @hand.cards[current_hand_idx] = nil if current_hand_idx == removal_card_idx
      end
    end
    @hand.consolidate_hand
    @hand
  end

  def bet(amount)
    if amount > @pot
      "Not enough funds!"
    else
      @pot -= amount
      amount
    end
  end

  def fold
    @active = false
  end

  def change_player_to_active
    @active = true
  end

  def call(call_amount)
    if call_amount > @pot
      player_call_total = @pot.dup
      @pot = 0
      player_call_total
    else
      @pot -= call_amount
      call_amount
    end
  end

  def raise(raise_amount)
    if raise_amount > @pot
      player_max_raise = @pot.dup
      @pot = 0
      player_max_raise
    else
      @pot -= raise_amount
      raise_amount
    end
  end

  def pay_player(pot_amount)
    @pot += pot_amount
  end
end

# p = Player.new
# p.hand.add_card_to_hand([2, 'spades'])
# p.hand.add_card_to_hand([3, 'spades'])
# p.hand.add_card_to_hand([4, 'spades'])
# p.hand.add_card_to_hand([5, 'spades'])
# p.hand.add_card_to_hand([6, 'spades'])

# p p.discard([0, 2, 4])