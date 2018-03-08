def nonDivisibleSubset(k, arr)
    hash = Hash.new(0)
    arr.each do |num|
        hash[num%k] += 1
    end
    if hash[0] > 1
        hash[0] = 1
    end
    new_hash = {}
    total = 0
    while !hash.empty?
        modded_number = hash.first[0]
        if modded_number != 0 && k / modded_number.to_f == 2
            hash[modded_number] = 1
        end
        if hash[k-modded_number]
            if (k / (k-modded_number).to_f) == 2
                hash[k-modded_number] = 1
            end
            total += [hash[modded_number], hash[k-modded_number]].max
            hash.delete(k-modded_number)
        else
            total += hash[modded_number]
        end
        hash.delete(modded_number)
    end
    puts total
end