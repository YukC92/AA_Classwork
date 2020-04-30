require_relative 'Modules/stepable'
require_relative 'piece'

class Knight < Piece
    include Stepable

    def symbol
        #do it later
    end

    def move_diffs
        knight_dirs
    end

end