# Phase 1

# def first_anagram?(string_1, string_2)
#     combo_1 = string_1.split("").permutation.to_a.map(&:join)
#     combo_1.include?(string_2)
# end

# Phase 2


# def second_anagram?(string_1, string_2)
#     (0...string_1.length).each do |i|
#         idx_2 = string_2.index(string_1[i])
#         return false if idx_2.nil?
#         string_2 = string_2[0...idx_2] + string_2[idx_2 + 1..-1]
#     end
#     return false unless string_2.empty?
#     true
# end
# O(n^2) or O(n^3)

# Phase 3

# def third_anagram?(string_1, string_2)
#     string_1.split('').sort == string_2.split('').sort
# end
# nlogn


# Phase 4

# def fourth_anagram?(string_1, string_2)
#     hash_1 = Hash.new(0)
#     hash_2 = Hash.new(0)
    
#     string_1.each_char { |char| hash_1[char] += 1}
#     string_2.each_char { |char| hash_2[char] += 1}
    
#     hash_1 == hash_2
# end

# O(n + m)

# Bonus

# def fourth_anagram?(string_1, string_2)
#     hash_1 = Hash.new(0)
    
#     string_1.each_char { |char| hash_1[char] += 1}
#     string_2.each_char { |char| hash_1[char] -= 1}
    
#     hash_1.values.all? { |v| v == 0 }
# end

# O(n + m)

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true