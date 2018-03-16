def wiggle_sort(nums)
    nums.sort!
    lo = 0
    hi = nums.length-1
    mid = (lo+hi)/2
    i = mid
    j = hi
    ans = []
    while i >= 0
        ans << nums[i]
        ans << nums[j] unless j == mid
        i -= 1
        j -= 1
    end
    ans
end

p wiggle_sort([1,5,1,1,6,4])