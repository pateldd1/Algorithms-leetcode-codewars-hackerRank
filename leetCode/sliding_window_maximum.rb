class DoubleStackQueue
    attr_accessor :in, :out
    def initialize
        @in = []
        @out = []
    end
    
    def push(arr, val)
        max = nil
        if arr.empty?
            max = val
        else
            max = [arr.last[:max], val].max
        end
        arr << { val: val, max: max }
    end
    
    def shift
        value = nil
        if @out.empty?
            while !@in.empty?
                value = @in.pop
                push(@out, value[:val])
            end
        end
        @out.pop
    end
    
    def max
        if !@out.empty? && !@in.empty?
            return [@out.last[:max], @in.last[:max]].max
        elsif @out.empty? && !@in.empty?
            return @in.last[:max]
        elsif @in.empty? && !@out.empty?
            return @out.last[:max]
        else
            return nil
        end
    end
end

def max_sliding_window(nums, k)
    return [] if nums.empty? || k == 0
    double_stack_queue = DoubleStackQueue.new
    i = 0
    j = k
    idx = 0
    while idx < k
        double_stack_queue.push(double_stack_queue.in, nums[idx])
        idx += 1
    end
    maxes = [double_stack_queue.max]
    while j < nums.length
        double_stack_queue.shift
        double_stack_queue.push(double_stack_queue.in, nums[j])
        j += 1
        maxes << double_stack_queue.max
    end
    maxes
end