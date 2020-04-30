module Slideable

  #   0 1 2
  # 0 n p n
  # 1 p c p
  # 2 n p n

  # current = 1,1

  # horizontal possible move = [0, -1], [0, 1]
  # vertical possible move =  [-1, 0], [1, 0]

  HORIZONTAL_DIRS = [[0, -1], [0, 1], [-1, 0], [1, 0]]

  #   0 1 2
  # 0 p n p
  # 1 n c n
  # 2 p n p

  # current = 1,1

  # possible move = -1,-1; -1, 1; 1, -1; 1, 1

  DIAGONAL_DIRS = [[-1,-1], [-1, 1], [1, -1], [1, 1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    checked_moves = []
    unchecked_moves = move_dirs
    unchecked_moves.each do |(dx,dy)|
      checked_moves += grow_unblocked_moves_in_dir(dx,dy)
    end
    checked_moves
  end

  def move_dirs
    # exmaple @move_type = both || horizontal || diagonal

    raise "this method has not been implemented."
  end

  def grow_unblocked_moves_in_dir(dx,dy)
    possible_moves = []
    #it is good to move, we << in
    #it is not good to move, we break the loops'
    #an opponent is blocking the road, we step on its pos, and break
    x = self.pos.first + dx
    y = self.pos.last + dy

    while board.valid_pos?([x, y])
      if board[[x, y]].nil?
          possible_moves << [x, y] 
      else
        unless self.color == board[[x, y]].color
          possible_moves << [x, y] 
          break
        else
          break
        end
      end

      x += dx
      y += dy
    end

    possible_moves
  end
    
end