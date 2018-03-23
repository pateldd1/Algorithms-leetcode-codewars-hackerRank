def lcs(x, y)
    if x.length < y.length
        short = x
        long = y
    else
        long = x
        short = y
    end
    divider = 1
    shortcombs = []
    longcombs = []
    until divider == short.length + 1
        short.chars.combination(divider).to_a.each do |innerarr|
            shortcombs << innerarr.join
        end
        divider += 1
    end  
    divider = 1
    until divider == long.length + 1
        long.chars.combination(divider).to_a.each do |innerarr|
            longcombs << innerarr.join
        end
        divider += 1
    end
    x = (shortcombs.length - 1)
    x.downto(0) do |inx|
        if longcombs.include?(shortcombs[inx])
            return shortcombs[inx]
        end
    end
    return ""
end