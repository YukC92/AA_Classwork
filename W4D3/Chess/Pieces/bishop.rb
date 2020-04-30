require_relative 'Modules/slideable'
require_relative 'piece'

class Bishop < Piece
    include Slideable

    def symbol
        #do it later
    end

    def move_dirs
      diagonal_dirs
    end

end