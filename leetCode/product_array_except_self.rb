def product_except_self(nums)
    lefts = [1]
    nums[0..-2].each do |num|
        lefts << lefts[-1]*num
    end
    rt = 1
    (lefts.length-1).downto(0) do |lefts_idx|
        val = nums[lefts_idx]
        nums[lefts_idx] = rt*lefts[lefts_idx]
        rt *= val
    end
    nums
end