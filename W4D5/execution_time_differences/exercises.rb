# Phase 1

# def my_min(arr)

#     arr.select do |ele1|
#         arr.all? {|ele2| ele1 <= ele2}
#     end.first

# end

#Time complexity
# O(n^2)


# Phase 2

# def my_min(arr)
    
#     arr.inject { |min, num| num <= min ? num : min}

# end

#Time complexity
# O(n)


# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

#Phase 1

# def largest_contiguous_subsum(arr)
    
#     subs = []
#     (0...arr.length).each do |i|
#         (i...arr.length).each do |j|
#             subs << arr[i..j]
#         end
#     end
    
#     subs.max {|a,b| a.sum <=> b.sum}.sum
# end

#Phase 2

def largest_contiguous_subsum(arr)
    largest = arr[0]
    current = arr[0]

    (1...arr.length).each do |i|
        current = 0 if current < 0
        current += arr[i]
        largest = current if current > largest
      
    end
    largest
end


# Test Cases
list = [-1, 5, 3, -7, 8]
p largest_contiguous_subsum(list) # => 8

# possible sub-sums
# p largest_contiguous_subsum([5])           # => 5
# p largest_contiguous_subsum([5, 3])        # => 8 --> we want this one
# p largest_contiguous_subsum([5, 3, -7])    # => 1
# p largest_contiguous_subsum([3])           # => 3
# p largest_contiguous_subsum([3, -7])       # => -4
# p largest_contiguous_subsum([-7])          # => -7



