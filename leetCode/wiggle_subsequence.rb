def wiggle_max_length(nums)
    return 0 if nums.empty?
    i = 0
    j = 1
    counts = 0
    current = nil
    while i < nums.length - 1
        a = nums[i]
        b = nums[j]
        if b - a < 0
            if !current || current == "+"
                current = "-"
                counts += 1
            end
        elsif b - a > 0
            if !current || current == "-"
                current = "+"
                counts += 1
            end
        end
        i += 1
        j += 1
    end
    counts + 1
end