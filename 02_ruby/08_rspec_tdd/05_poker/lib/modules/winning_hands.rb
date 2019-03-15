module WinningHands
  def hand_total(cards)
    create_card_hash(cards)

    if straight_flush?(cards)
      print "Straight flush!"
      return 9
    elsif four_of_a_kind?(cards)
      print "Four of a kind!"
      return 8
    elsif full_house?(cards)
      print "Full house!"
      return 7
    elsif flush?(cards)
      print "Flush!"
      return 6
    elsif straight?(cards)
      print "Straight!"
      return 5
    elsif three_of_a_kind?(cards)
      print "Three of a kind!"
      return 4
    elsif two_pair?(cards)
      print "Two pair!"
      return 3
    elsif one_pair?(cards)
      print "One pair!"
      return 2
    else
      return 1
    end
  end

  def create_card_hash(cards)
    card_hash = Hash.new(0)
    cards.each {|card| card_hash[card[0]] += 1}
    card_hash
  end

  def straight_flush?(cards)
    straight?(cards) && flush?(cards)
  end

  def four_of_a_kind?(cards)
    return true if create_card_hash(cards).values.count(4) == 1
  end

  def full_house?(cards)
    return true if create_card_hash(cards).values.count(3) == 1 && create_card_hash(cards).values.count(2) == 1
  end

  def flush?(cards)
    card_hash = Hash.new(0)
    cards.each {|card| card_hash[card[1]] += 1}
    return true if card_hash.values.length == 1
  end

  def straight?(cards)
    expected_straight = (cards[0][0]..cards[4][0]).to_a
    actual_cards = cards.map {|card| card[0]}
    expected_straight == actual_cards
  end

  def three_of_a_kind?(cards)
    return true if create_card_hash(cards).values.count(3) == 1
  end

  def two_pair?(cards)
    return true if create_card_hash(cards).values.count(2) == 2
  end

  def one_pair?(cards)
    return true if create_card_hash(cards).values.count(2) == 1
  end
end


# => cards = [[2, 'spades'], [3, 'spades'], [4, 'spades'], [5, 'spades'], [6, 'spades']]
