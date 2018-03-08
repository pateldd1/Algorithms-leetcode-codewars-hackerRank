def find132pattern(nums)
    stack = []
    nums.each do |num|
        if stack.empty? || num < stack.last[:min]
            stack << {min: num, max: num}
        elsif num > stack.last[:min]
            last = stack.pop
            if num < last[:max]
                return true
            else
                stack.pop until stack.empty? || num < stack.last[:max] 
                if !stack.empty? && num > stack.last[:min]
                    return true
                end
                last[:max] = num
                stack << last
            end
        end
    end
    false
end