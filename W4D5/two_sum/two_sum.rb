def bad_two_sum?(arr, target)
    per = arr.permutation(2).to_a
    per.any? { |pair| pair.sum == target}
end

# O(n!)


def okay_two_sum?(arr, target) 
    arr.sort!
    (0...arr.length - 1).each do |i|
        remainder = target - arr[i]
        return true unless arr[i + 1..-1].bsearch{ |x| x == remainder }.nil?
    end
    false
end

# sort: nlogn
# lines 11 through 14: n (line11) * nlogn (bsearch) = 2n * logn => nlogn

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 8) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def hash_two_sum?(arr, target) 
    hash = Hash.new(0)
    arr.each do |ele|
        hash[target - ele] += 1
    end

    arr.each do |ele|
        hash[ele] -= 1
    end

    hash.values.any? { |v| v == 0 }

    
end

# 2n + m => n + m

arr = [0, 1, 5, 7]
p hash_two_sum?(arr, 8) # => should be true
p hash_two_sum?(arr, 10) # => should be false