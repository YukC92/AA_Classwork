# def windowed_max_range(arr, window_size)
#     new_arr = []
#     (0...arr.length - window_size + 1).each do |i|
#         range = arr[i..(i + window_size - 1)]
#         new_arr << range.max - range.min
#     end
#     new_arr.max
# end

# def windowed_max_range(arr, window_size)
#     current_max_range = 0
#     (0...arr.length - window_size + 1).each do |i|
#         range = arr[i..(i + window_size - 1)]
#         range_diff = range.max - range.min
#         current_max_range = range_diff if range_diff > current_max_range
#     end
#     current_max_range
# end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyQueue

    attr_reader :store

    def initialize
        @store = []
    end

    def peek
        return store[-1] if self.size > 0
        nil 
    end

    def size 
        store.length
    end

    def empty?
        self.size == 0
    end

    def enqueue(el)
        store << el
        el
    end

    def dequeue
        store.shift
    end
end

class MyStack

    attr_reader :store

    def initialize
        @store = []
    end

    def peek
        return store[-1] if self.size > 0
        nil 
    end

    def size 
        store.length
    end

    def empty?
        self.size == 0
    end
    
    def pop
        store.pop
    end

    def push(el)
        store << el
        el
    end
end

class StackQueue 

    def initialize
        @stack = Stack.new
        @queue = Queue.new
       # @queue = []
       # @queue.enqueue(Stack.new)
       # @queue.enqueue(Stack.new)
    end

    
end