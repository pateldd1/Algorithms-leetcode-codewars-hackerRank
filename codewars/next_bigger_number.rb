def next_bigger(n)
    index = nil
    digits = n.to_s.chars.map {|char| char.to_i}
    (digits.length - 1).downto(1) do |inx|
        if digits[inx] > digits[inx-1]
            index = inx - 1
            break
        end
    end
    if index == nil
        return -1
    end
    cutout = digits[index+1..-1]
    replacement = nil
    cutout.sort.each do |number|
        if number > digits[index]
            replacement = number
            break
        end
    end
    cutout.delete_at(cutout.index(replacement))
    temp = digits[index]
    digits[index] = replacement
    cutout << temp
    answer = digits[0..index] + cutout.sort
    answer.join.to_i
end