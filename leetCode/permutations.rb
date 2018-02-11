def permute(nums, current_array = [])
    return [current_array] if nums.empty?
    result = []
    nums.each_with_index do |num, idx|
        cloned_nums = nums.dup
        cloned_nums.delete_at(idx)
        result += permute(cloned_nums, current_array + [num])
    end
    return result
end

