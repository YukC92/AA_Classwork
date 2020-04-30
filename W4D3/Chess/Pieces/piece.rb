require_relative 'null_piece'

class Piece
  attr_reader :color, :board
  attr_accessor :pos

  def initialize(color, board, pos)
    @color, @board, @pos = color, board, pos

    raise "Invalid position" if @board.valid_pos?(pos)
  end

  def []= (pos,val)
    row, col = pos
    board[row][col] = value
  end

  def symbol #later
    raise "didnt assign a symbol method"
  end

  def empty?
    return true if self == NullPiece.instance
    false
    # do when making nullpiece
  end

  def to_s #good
    "#{symbol}"
  end

  def valid_moves
    #define later because requries move_into_check?
  end

  def move_into_check?(end_pos)

    # do later when all moves work
  end
end