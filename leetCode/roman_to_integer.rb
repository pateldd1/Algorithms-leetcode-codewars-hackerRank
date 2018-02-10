def roman_to_int(s)
    hash = {"I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000}
    pointer = 0
    total = 0
    while pointer < s.length
        if s[pointer+1] && hash[s[pointer]] < hash[s[pointer+1]]
            total += hash[s[pointer+1]] - hash[s[pointer]]
            pointer += 2
        else
            total += hash[s[pointer]]
            pointer += 1
        end
    end
    total
end