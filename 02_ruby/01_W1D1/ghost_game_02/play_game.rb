
require_relative './game.rb'

p1 = Player.new('Kenny')
p2 = Player.new('Jill')
game = Game.new(p1, p2)
p game.play_game

