
require_relative 'game.rb'

p1 = Player.new("Kenneth")
p2 = Player.new("Jill")
p3 = Player.new("Mitch")
game = Game.new(p1, p2, p3)
game.play_game