require_relative 'Modules/slideable'
require_relative 'piece'

class Rook < Piece
  include Slideable

  def symbol
      #do it later
  end

  def move_dirs
    horizonal_dirs
  end

end
