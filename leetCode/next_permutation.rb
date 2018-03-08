def next_permutation(nums)
    return nums if nums.length == 1 || nums.uniq.length == 1
    return nums.sort! if nums.sort.reverse == nums
    rt = nums.length - 1
    j = rt - 1
    while nums[j] >= nums[rt]
        j -= 1
        rt -= 1
    end
    comp = nums[j+1..-1]
    min = comp.max
    index = nil
    nums.each_with_index do |val, idx|
        if idx > j && nums[idx] > nums[j] && nums[idx] <= min
            min = nums[idx]
            index = idx
        end
    end
    nums[j], nums[index] = nums[index], nums[j]
    nums[j+1..-1] = nums[j+1..-1].sort
    nums
end