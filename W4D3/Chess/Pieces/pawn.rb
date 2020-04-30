require 'piece'

class Pawn < Piece

  ORGINAL_POS_BLACK = [
    [1,0],
    [1,1],
    [1,2],
    [1,3],
    [1,4],
    [1,5],
    [1,6],
    [1,7],
  ]

  ORGINAL_POS_WHITE = [
    [6,0],
    [6,1],
    [6,2],
    [6,3],
    [6,4],
    [6,5],
    [6,6],
    [6,7],
  ]

    def symbol
        #define later
    end

    def moves
        forward_steps + side_attacks
    end

    private

    def forward_dirs
        color == :white ? -1 : 1 
    end

  def forward_steps
    #return [pos[0] + (forward_dirs(1) * 2)]
    two_step = [pos[0] + (forward_dirs * 2)], pos[1]]
    one_step = [pos[0] + forward_dirs, pos[1]]
    if color == :white
      if ORGINAL_POS_WHITE.include?(pos)
        return [two_step, one_step] if board[two_step].empty? && board[one_step].empty?
      else
        return [one_step] if board[one_step].empty? && board.valid_pos?(one_step)
      end
    else #color is black
      if ORGINAL_POS_BLACK.include?(pos)
        return [two_step, one_step] if board[two_step].empty? && board[one_step].empty?
      else
        return [one_step] if board[one_step].empty? && board.valid_pos?(one_step)
      end
    end
  end

  def side_attacks
    #if diagonal have opponent, we can move diagonal
    # side_dirs = [[1,1], [1,-1]]
    attacks = []
    left_attack = [pos[0] + forward_dirs, pos[1] - 1]
    right_attack = [pos[0] + forward_dirs, pos[1] + 1]
    #check if the opponent is on left or right
    if !board[left_attack].empty? && board[left_attack].color != color
        attacks << [left_attack]
    end
    if !board[right_attack].empty? && board[right_attack].color != color
        attacks << [right_attack]
    end
    attacks
  end
end