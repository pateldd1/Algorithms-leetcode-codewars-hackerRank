def two_sum(nums, target)
   hash = {}
    array = []
   nums.each_with_index do |num, idx|
       if hash[num]
           return [hash[num], idx]
       else
           hash[target - num] = idx
       end
   end
end