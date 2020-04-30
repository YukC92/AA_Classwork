require_relative 'Modules/stepable'
require_relative 'piece'

class King < Piece
  include Stepable

  def symbol
      #do it later
  end

  def move_diffs
    king_dirs
  end
end