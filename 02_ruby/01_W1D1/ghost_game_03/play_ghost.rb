
require_relative './ghost.rb'

p1 = Player.new("Kenny")
p2 = Player.new("Sasha")
game = Game.new(p1, p2)

game.play_game