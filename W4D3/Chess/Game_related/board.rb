require_relative "../Pieces/piece.rb"
require 'byebug'

=begin
  0 1 2 3 4 5 6 7 
0 p p p p p p p p
1 p p p p p p p p
2 n n n n n n n n
3 n n n n n n n n
4 n n n n n n n n
5 n n n n n n n n
6 p p p p p p p p
7 p p p p p p p p

=end


class Board
  
  attr_reader :grid

  def initialize
    #create 8 x 8 chess board
    @grid = Array.new(8) { Array.new(8) } 
    
    #fill grid with pawns
    (0...grid.length). each do |i|
      (0...grid.length). each do |j|
        if i == 1
          @grid[i][j] = Pawn.new(:black, self, [i,j])
        elsif i == 6
          @grid[i][j] = Pawn.new(:white, self, [i,j])
        else
          @grid[i][j] = NullPiece.instance
        end
      end
    end
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos,value)
    row, col = pos
    grid[row][col] = value
  end

  def valid_pos?(pos)
    row, col = pos
    return false if row < 0 || row > 7
    return false if col < 0 || col > 7
    true
  end

  def move_piece(start_pos, end_pos)
    # raise error if no piece at start_pos
    # debugger
    if !valid_pos?(start_pos) || self[start_pos].nil?
      raise "Incorrect starting position" 
    end

    # raise error if piece cannot move to end_pos
    unless valid_pos?(end_pos) && self[end_pos].nil?
      raise "Incorrect ending position"
    end

    #move piece
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
    grid
  end
end

if $PROGRAM_NAME == __FILE__
  my_board = Board.new
  my_board.move_piece([0,0], [3,3])
  p my_board
end