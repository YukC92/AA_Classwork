require 'singleton'
require_relative 'piece'

class NullPiece < Piece
  include Singleton

  def initialize
    @color = nil
    @pos = nil
  end

  def moves
    []
  end

  def symbol
    @symbol = " "
  end
end