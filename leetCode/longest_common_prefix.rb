def longest_common_prefix(strs)
    return "" if strs.empty?
    return strs.first if strs.length == 1
    compare_string = nil
    this_string = nil
    strs.sort.each_with_index do |str, idx|
        break if idx == strs.length - 1
        if  idx == 0
            this_string = strs[idx]
        else
            this_string = compare_string
        end
        next_string = strs[idx+1]
        compare_string = compare(this_string, next_string)
        break if compare_string.length == 0
    end
    compare_string
end

def compare(str1, str2)
    small = str1
    large = str2
    arr = []
    large.chars.each_with_index do |char, idx|
        break if !small[idx]
        if  small[idx] == large[idx]
            arr << char
        else
            break
        end
    end
    return arr.join
end