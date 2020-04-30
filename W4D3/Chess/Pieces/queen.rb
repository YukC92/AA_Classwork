require_relative 'Modules/slideable'
require_relative 'piece'

class Queen < Piece
    include Slideable

    def symbol
        #do it later
    end

    def move_dirs
      diagonal_dirs + horizontal_dirs
    end

end