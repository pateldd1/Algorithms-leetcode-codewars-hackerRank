def majority_element(nums)
    count = 1
    current_element = nums[0]
    nums[1..-1].each do |num|
        if num == current_element
            count += 1
        else
            count -= 1
        end      
        if count == 0
            current_element = num
            count += 1
        end
    end
    current_element
end