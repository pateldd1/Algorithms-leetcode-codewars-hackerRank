def next_highest(time)
    nums = time.scan(/\d/).map(&:to_i)
    answer_nums = nums.dup
    highest_vals = [2, 9, 5, 9]
    if nums[0] == 2
        highest_vals[1] = 3
    end
    sorted_nums = nums.sort
    highest_val = nil
    right_idx = nil
    done = false
    (3).downto(0).each do |idx|
        highest_val = highest_vals[idx]
        sorted_nums.each do |num|
            if num > nums[idx] && num <= highest_val
                answer_nums[idx] = num
                right_idx = idx
                done = true
                break
            end
        end
        break if done
    end
    if !right_idx
        right_idx = 0
    end
    if right_idx < nums.length - 1
        (right_idx+1..3).each do |idx|
            answer_nums[idx] = sorted_nums[0]
        end
    end
    answer_nums[0..1] = answer_nums[0..1].join
    answer_nums[1..2] = answer_nums[1..2].join
    answer_nums.join(":")
end

p next_highest("21:12")
p next_highest("10:16")
p next_highest("15:45")
p next_highest("01:01")
p next_highest("05:59")