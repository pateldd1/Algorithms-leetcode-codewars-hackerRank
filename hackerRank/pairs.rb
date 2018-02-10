def pairs(k, arr)
    hash = {}
    arr.each do |num|
        hash[num] = true
    end
    count = 0
    arr.each do |num|
        count += 1 if hash[k + num]
    end
    count
end