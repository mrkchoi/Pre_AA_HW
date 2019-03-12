require 'singleton'
require_relative '../piece.rb'

class NullPiece < Piece
  attr_reader :symbol, :color
  include Singleton 

  def initialize
    @symbol = "   "
    @color = :none
  end

  def to_s
    "   "
  end
end