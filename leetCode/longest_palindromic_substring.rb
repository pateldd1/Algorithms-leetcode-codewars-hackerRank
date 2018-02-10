def longest_palindrome(s)
    if s.reverse == s
        return s
    end
    array = s.chars.join("#").chars
    longest = ""
    array.each_with_index do |ch, idx|
        if  array[idx] == "#"
            j = idx + 1
            i = idx - 1
        else
            j = idx + 2
            i = idx - 2
        end
        while (array[i] == array[j])   
            j += 2
            i -= 2
        end
        j -= 2
        i += 2
        if j >= array.length
            j = array.length - 1
        end
        if i < 0
            i = 0
        end
        new_long = array[i..j].join.split("#").join
        longest = new_long if new_long.length > longest.length
    end
    longest
end