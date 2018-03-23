def pairs(k, arr)
    hash = Hash.new(0)
    count = 0
    arr.each do |val|
        if hash[val]
            count += hash[val]
        end
        hash[k+val] += 1
        hash[val-k] += 1
    end
    count
end

p pairs(2, [1, 5, 3, 4, 2])