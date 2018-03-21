def min_window(s, t)
    if t.length > s.length
        return ""
    end

    hash = Hash.new(0)
    set_hash = Hash.new(0)
    current_set_hash = Hash.new(0)
    
    char = nil
    
    t.each_char do |ch|
        set_hash[ch] += 1
    end
    
    i = 0
    j = 0
    
    min_length = nil
    min_range = nil
    char_lost = nil
    
    while i < s.length
        char = s[i]
        if set_hash[char] > 0
            hash[char] += 1
            current_set_hash[char] += 1 unless current_set_hash[char] == set_hash[char]
            if set_hash == current_set_hash
                min_length = i + 1
                min_range = [0, i]
                break
            end
        end
        i += 1
    end
    j = i+1
    i = 0
    return "" if !min_range
    while i < s.length
        while i < j
            char = s[i]
            if hash[char] > 0
                hash[char] -= 1
                if current_set_hash[char] > hash[char]
                    # p i, j
                    current_set_hash[char] -= 1
                    length = j - i
                    if length < min_length
                        min_length = length
                        min_range = [i,j-1]
                    end
                    i += 1
                    break
                end
            end
            i += 1
        end
        break if j >= s.length
        while j < s.length
            char = s[j]
            if set_hash[char] > 0
                hash[char] += 1
                current_set_hash[char] += 1 unless current_set_hash[char] == set_hash[char]
                if set_hash == current_set_hash
                    length = j - i + 1
                    if length < min_length
                        min_length = length
                        min_range = [i,j]
                    end
                    j += 1
                    break
                end
            end
            j += 1
        end
        break if set_hash != current_set_hash
    end
    return s[min_range[0]..min_range[1]]
end