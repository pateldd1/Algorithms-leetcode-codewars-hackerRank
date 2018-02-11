def check_inclusion(s1, s2)
    return false if s1.length > s2.length
    count_hash = Hash.new(0)
    s1.each_char do |letter|
        count_hash[letter] += 1
    end    
    s2_array = s2.chars
    i = 0
    compare_hash = Hash.new(0)
    
    while i < s1.length
        letter = s2[i]
        compare_hash[letter] += 1
        i += 1
        return true if compare_hash == count_hash
    end
    j = i - 1
    i = 0
    while j < s2.length
        letter_1 = s2[i]
        compare_hash[letter_1] -= 1
        if  compare_hash[letter_1] == 0
            compare_hash.delete(letter_1)
        end
        i += 1
        j += 1
        break if j == s2.length
        letter_2 = s2[j]
        if  !compare_hash[letter_2]
            compare_hash[letter_2] = 1
        else
            compare_hash[letter_2] += 1
        end
        return true if compare_hash == count_hash
    end
    return false
end