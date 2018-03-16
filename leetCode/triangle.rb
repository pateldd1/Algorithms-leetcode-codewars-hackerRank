def minimum_total(triangle)
    hash = {}
    triangle.last.each_with_index do |val,idx|
        hash[idx] = val
    end
    (triangle.length-2).downto(0) do |row|
        new_hash = {}
        triangle[row].each_with_index do |val, idx|
            new_hash[idx] = [hash[idx], hash[idx+1]].min + val
        end
        hash = new_hash
    end
    hash[hash.keys[0]]
end