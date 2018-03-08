def can_jump(nums, pos = 0)
    return true if nums.all? {|x| x== 1}
    return true if nums.length == 1
    bool = false
    nums.reverse.each_with_index do |number, idx|
       next if idx == 0
       if number >= idx
           bool = true
           break
       end
    end
    return false if !bool    
    $hash = {}
    recurse(nums, pos)
end

def recurse(nums, pos)
    return false if pos > nums.length - 1
    return false if nums[pos] == 0 && pos != nums.length - 1
    return true if pos == nums.length - 1
    pointer = pos + nums[pos]
    while pointer > pos
        if !$hash[pointer]
            bool = recurse(nums, pointer)
            $hash[pointer] = true
            return bool if bool
        end
        pointer -= 1
    end      
    false
end