class Tower
    attr_reader :tower
    def initialize
        @tower = [[3, 2, 1], [], []]
    end

    def move(start_pos, end_pos)
        raise 'This tower is empty' if self[start_pos].empty?
        if self[end_pos].empty?
            piece = self[start_pos].pop
            self[end_pos] << piece
        elsif !self[end_pos].empty? && self[end_pos][-1] > self[start_pos].last
            piece = self[start_pos].pop
            self[end_pos] << piece
        else
            raise 'You may not put big piece on smaller piece'
        end
    end

    def [](pos)
        @tower[pos]
    end


    def won?
        self[0].empty? && (self[1].empty? || self[2].empty?)
    end

    def render
        # Tower 0: 3 2 1\n                Tower 1:  \n                Tower 2:  
        "Tower 0: #{self[0].join(' ')} \nTower 1: #{self[1].join(' ')} \nTower 2: #{self[2].join(' ')}\n"
    end

    def play
        until self.won?
            self.render
            puts "Please enter a start and end Tower (from 0 to 2), seperated by comma: "
            numbers = '012'
            input = gets.chomp
            input_arr = input.split(",")
            if input_arr.length != 2
                raise "please type in correct way" 
                self.play
            end 
            raise "please enter a number" if !numbers.include?(input_arr[0]) || !numbers.include?(input_arr[1])
            input_arr.map!(&:to_i)
            self.move(input_arr[0], input_arr[1])
        end
        self.render
        puts 'You WIN!!!'
    end

end