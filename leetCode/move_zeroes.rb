def move_zeroes(nums)
    i = 0
    j = 1
    while j < nums.length
        if nums[i] == 0 && nums[j] == 0
            while j < nums.length-1 && nums[j] == 0
                j += 1
            end
            nums[i], nums[j] = nums[j], nums[i]
            i += 1
        elsif nums[i] == 0 && nums[j] != 0
            nums[i], nums[j] = nums[j], nums[i]
            i += 1
            j = i + 1
        else
            i += 1
            j = i + 1
        end
    end
end