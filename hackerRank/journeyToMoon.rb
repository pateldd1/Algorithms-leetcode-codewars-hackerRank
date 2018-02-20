def journeyToMoon(n, astronaut)
    hash1 = Hash.new()
    hash2 = Hash.new()
    astronaut.each do |a1, a2|
        hash1[a1] = [] if !hash1[a1]
        hash1[a1] << a2
    end
    astronaut.each do |a1, a2|
        hash2[a2] = [] if !hash2[a2]
        hash2[a2] << a1
    end

    hash1.each do |k,subarr|
        addon = []
        subarr.each do |val|
            addon += hash2[val] if hash2[val]
        end
        addon.reject!{|z| z == k}
        subarr.push(*addon)
        subarr.uniq!
    end
    loop do
        deletion_index = nil
        hash1.each do |k, subarr|
            addon = []
            subarr.each do |val|
                if hash1[val]
                    addon += hash1[val] 
                    deletion_index = val
                end
            end
            addon.reject!{|z| z == k}
            subarr.push(*addon)
            subarr.uniq!
            break if deletion_index
        end
        break if !deletion_index
        hash1.delete(deletion_index)
    end
    total = combination(n, 2)
    hash1.each do |k, subarr|
        total -= combination(1+subarr.length, 2)
    end
    total
end

def combination(n, r)
    return 1 if n == r
    fac(n)/(fac(n-r)*fac(r))
end

def fac(n)
    (1..n).reduce(:*)
end

p journeyToMoon(5, [[0,1],[2,3],[0,4],[5,4]])