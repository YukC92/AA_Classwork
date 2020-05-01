def my_uniq(arr)
    arr.uniq
end

class Array

    def two_sum
        new_arr = []
        (0...self.length).each do |i|
            (i...self.length).each do |j|
                new_arr << [i,j] if self[i] + self[j] == 0
            end
        end
        new_arr
    end

end

def my_transpose(arr)
    arr.transpose
end

def stock_picker(arr)
    greatest_pair = nil
    greatest_profit = 0
    (0...arr.length).each do |i|
        (i+1...arr.length).each do |j|
            if (arr[j] - arr[i]) > greatest_profit
                greatest_profit = (arr[j] - arr[i])
                greatest_pair = [i,j]
            end
        end
    end
    greatest_pair
end