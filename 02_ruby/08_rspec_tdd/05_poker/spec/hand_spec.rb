require 'hand'

describe Hand do
  subject(:hand) {Hand.new}

  describe '#add_card_to_hand' do

    let(:card) {double('card', :value => 2, :suit => 'spades')}
    it 'adds a single card to the hand' do
        hand.add_card_to_hand(card)
        expect(hand.cards.count).to eq(1)
    end
  end

  describe '#hand_point_total' do

    let(:cards) {[[2, 'spades'], [3, 'spades'], [4, 'spades'], [5, 'spades'], [6, 'spades']]}
    it 'assigns 9 points for a straight flush' do
      cards.each {|card| hand.add_card_to_hand(card)}
      expect(hand.hand_point_total(hand.cards)).to eq(9)
    end

    let(:cards2) {[[2, 'diamonds'], [3, 'spades'], [4, 'spades'], [5, 'spades'], [6, 'spades']]}
    it 'assigns 5 points for a straight' do
      cards2.each {|card| hand.add_card_to_hand(card)}
      expect(hand.hand_point_total(hand.cards)).to eq(5)
    end

    let(:cards3) {[[2, 'diamonds'], [2, 'spades'], [2, 'spades'], [5, 'spades'], [5, 'spades']]}
    it 'assigns 7 points for a full house' do
      cards3.each {|card| hand.add_card_to_hand(card)}
      expect(hand.hand_point_total(hand.cards)).to eq(7)
    end
  end

  describe "#remove_card_from_hand" do
    let(:cards) {[[2, 'spades'], [3, 'spades'], [4, 'spades'], [5, 'spades'], [6, 'spades']]}
    it 'removes card from a specific index' do
      cards.each {|card| hand.add_card_to_hand(card)}
      hand.remove_card_from_hand(0)
      expect(hand.cards.count).to eq(4)
    end
  end
end