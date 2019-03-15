require 'deck'

describe Deck do 
  subject(:deck) {Deck.new}

  describe "#create_new_deck" do
    it 'creates a new deck of 52 card instances' do
      expect(deck.card_count).to eq(52)
    end
  end

  describe "#shuffle_deck" do
    it 'shuffles the cards in random order' do
      deck.create_new_deck
      new_deck = deck.active_deck.dup
      deck.shuffle_deck
      shuffled_deck = deck.active_deck.dup

      expect(new_deck).not_to eq(shuffled_deck)
      expect(new_deck.sort).to eq(shuffled_deck.sort)
    end
  end

  describe "#deal_card" do
    it 'removes the first card in queue-like fashion' do
      deck.deal_card
      expect(deck.card_count).to eq(51)
    end
  end
end