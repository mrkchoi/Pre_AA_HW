require 'byebug'
require_relative './player.rb'
require_relative './deck.rb'

class Game
  attr_reader :current_player, :game_players, :deck, :pot

  def initialize(*players)
    @game_players = [*players] 
    @current_player = @game_players[0]
    @deck = Deck.new
    @pot = 0
    @bet_to_call = nil
    @raise_amount = nil
  end


  ##########################################
  # GAME PLAY
  ##########################################

  def play
    system('clear')
    print "\nWelcome to Five Card Draw!\n"

    until win_game?
      play_round
      collect_player_cards
    end

    winner = winning_player
    print "\n\nCongrats #{winner.name}, you win!\n\n"
  end

  def play_round
    deal_cards
    render_hands
    render_player_pots

    # bet round 1
    betting_round_all

    if round_winner?
      pay_round_winner

      reset_players
      reset_call_and_raise_amounts
      return
    end
    
    discard_round
    render_hands

    # bet round 2
    betting_round_all

    if round_winner?
      pay_round_winner

      reset_players
      reset_call_and_raise_amounts
      return
    end

      calculate_best_hand
      pay_round_winner

      reset_players
      reset_call_and_raise_amounts
  end

  def switch_player
    @current_player == @game_players[0] ? @current_player = @game_players[1] : @current_player = @game_players[0]
  end


  ##########################################
  # WINNER CHECK
  ##########################################
  def win_game?
    @game_players.one? {|player| player.pot != 0}
  end

  def winning_player
    @game_players.select {|player| player.pot > 0}.first
  end

  def calculate_best_hand
    player_with_best_hand = nil

    @game_players.each do |player|
      if player.active && player_with_best_hand.nil?
        player_with_best_hand = player
      elsif player.active && (player.hand.hand_point_total(player.hand.cards) > player_with_best_hand.hand.hand_point_total(player_with_best_hand.hand.cards))
        player_with_best_hand = player
      end
    end
    player_with_best_hand
  end


  ##########################################
  # DEAL / RENDER
  ##########################################
  def deal_cards
    all_players_dealt_five_cards = @game_players.all? {|player| player.hand.cards.count == 5}

    until all_players_dealt_five_cards
      @game_players.each do |player|
        player.hand.add_card_to_hand(@deck.deal_card) if player.active && player.hand.cards.count < 5
      end

      all_players_dealt_five_cards = @game_players.all? {|player|
      player.hand.cards.count == 5}
    end
  end

  def render_hands
    print "\n-------------------------------------\n\n"
    @game_players.each do |player|
      print "#{player.name}'s hand: \n"
      print "#{player.hand.cards}\n\n"
    end
  end

  def render_player_pots
    print "\n-------------------------------------\n\n"
    @game_players.each do |player|
      print "#{player.name}'s chips: \n"
      print "$#{player.pot}\n\n"
    end
    print "-------------------------------------\n"
  end

  def render_current_pot
    print "Current pot: $#{@pot}\n"
  end

  def collect_player_cards
    @game_players.each {|player| player.hand.reset}
  end

  ##########################################
  # DISCARD ROUND
  ##########################################
  def discard_round
    @game_players.each do |player|
      print "\n#{player.name}, discard any cards? (y/n)\n> "
      discard_prompt = gets.chomp.capitalize
      if discard_prompt == 'Y'
        ask_for_discard_cards(player)
      end
    end
    deal_cards
  end

  def ask_for_discard_cards(player)
    print "Which cards?\n> "
    discard_cards = gets.chomp.chars.map(&:to_i)
    player.discard(discard_cards)
  end


  ##########################################
  # BETTING ROUNDS
  ##########################################
  def betting_round_all
    @game_players.each do |player|
      betting_round(player) if player.active && other_player(player).active
    end
    
    reset_call_and_raise_amounts
  end
  
  def other_player(player)
    player.position == 1 ? @game_players[1] : @game_players[0]
  end
  
  def betting_round(player)
      if player.position == 1
        print "\n\n#{player.name}: bet or fold..\n> "
      else
        print "\n\n#{player.name}: call, raise, or fold..\n> "
      end

      player_move = gets.chomp.capitalize

      if player_move == 'Bet'
        print "\n\n#{player.name}, place your bet:\n> "
        player_bet = gets.chomp.to_i
        @pot += player.bet(player_bet).to_i
        @bet_to_call = player_bet
        render_current_pot
      elsif player_move == 'Call'
        print "#{player.name} calls $#{@bet_to_call}\n\n"
        @pot += player.call(@bet_to_call).to_i
        render_current_pot
      elsif player_move == 'Raise'
        print "\n\nEnter your raise amount:\n> "
        raise_amount = gets.chomp.to_i
        player.raise(raise_amount)
        @pot += raise_amount
        @raise_amount = raise_amount
        render_current_pot
        if player.position == 1
          raise_round(@game_players[1])
        else
          raise_round(@game_players[0])
        end
      elsif player_move == 'Fold'
        print "\n\n#{player.name} folds!\n\n"
        player.fold
      end

    
  end

  def raise_round(player)
    print "\n\n#{player.name}, call raise of #{@raise_amount}? (y/n)\n> "

    raise_decision = gets.chomp.capitalize
    if raise_decision == 'Y'
      players_raise = player.raise(@raise_amount + @bet_to_call)
      @pot += players_raise
      render_current_pot
      p @pot
    else
      player.fold
    end
  end

  def reset_call_and_raise_amounts
    @raise_amount = nil
    @bet_to_call = nil
  end

  def reset_players
    @game_players.each {|player| player.change_player_to_active}
  end

  def round_winner?
    @game_players.one? {|player| player.active}
  end

  ##########################################
  # PAYOUT
  ##########################################
  def pay_round_winner
    round_winner = @game_players.select(&:active).first
    round_winner.pay_player(@pot)
    @pot = 0

    print "\n\n#{round_winner.name} wins the pot!\nNew player total is $#{round_winner.pot}\n\n"
    sleep(1)
  end

end

if __FILE__ == $PROGRAM_NAME
  g = Game.new(Player.new('Player1', 1), Player.new('Player2', 2))
  g.play
end
