module Stepable
    
    KNIGHT_MOVES = [
        [1,2],
        [1,-2],
        [-1,2],
        [-1,-2]
        [2,1],
        [2,-1],
        [-2,1],
        [-2,-1]
    ]

    KING_MOVES = [
        [-1,-1], 
        [-1, 1], 
        [1, -1], 
        [1, 1],
        [0, -1], 
        [0, 1],
        [-1, 0],
        [1, 0]
    ]

    def knight_dirs
        KNIGHT_MOVES
    end

    def king_dirs
        KING_MOVES
    end

    def moves
      checked_move = []
      unchecked_move = move_diffs
      unchecked_move.each do |(dx, dy)|
        x = self.pos.first + dx
        y = self.pos.last + dy
        if board.valid_pos?([x, y])
          if board[[x,y]].nil?
            checked_move << [x,y]
          else
            possible_moves << [x, y] unless self.color == board[[x, y]].color
          end
        end
      end
      checked_move
    end

    def move_diffs
        raise "this method has not been implemented."
    end
end