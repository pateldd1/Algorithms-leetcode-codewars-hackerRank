def length_of_longest_substring(s)
    if  s.length == 0
        return 0
    end
    hash = Hash.new(0)
    longest = 1
    pointer = 0
    array = s.chars << " "
    array.each_with_index do |ch, idx|
        hash[ch] += 1
        check = idx - pointer
        longest = check if check > longest
        while hash[ch] == 2
            hash[array[pointer]] -= 1
            pointer += 1
        end
    end
    longest         
end