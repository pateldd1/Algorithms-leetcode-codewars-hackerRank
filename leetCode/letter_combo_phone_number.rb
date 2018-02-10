def letter_combinations(digits)
    return [] if digits == ""
    hash = {
        "2"=> ["a", "b", "c"],
        "3"=> ["d", "e", "f"],
        "4" => ["g", "h", "i"],
        "5" => ["j","k","l"],
        "6" => ["m", "n", "o"],
        "7" => ["p", "q", "r", "s"],
        "8" => ["t", "u", "v"],
        "9" => ["w", "x", "y", "z"]
        }
    return hash[digits] if digits.length == 1
    digs = digits.to_s.chars
    ans = hash[digs[0]]
    digs[1..-1].each do |d|
        ans = ans.product(hash[d])
    end
    ans.map(&:join)
end