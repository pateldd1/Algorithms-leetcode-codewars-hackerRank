def find_repeated_dna_sequences(s)
    i = 0
    j = 9
    str = ""
    hash = Hash.new(0)
    while j < s.length
        str = s[i..j]
        hash[str] += 1
        i += 1
        j += 1
    end
    ans = []
    hash.each do |k, v|
        ans << k if v > 1
    end
    ans
end