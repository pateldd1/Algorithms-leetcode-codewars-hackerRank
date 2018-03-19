def find_order(num_courses, prerequisites)
    hash = Hash.new() {|h,k| h[k] = []}
    $sorted = []
    easily_placed = (0...num_courses).to_a - prerequisites.flatten.uniq.sort
    $sorted = easily_placed
    prerequisites.each do |course, prereq|
        hash[prereq] << course
    end
    $set = {}
    x = nil
    while !hash.empty?
        key = hash.first[0]
        unless $set[key]
            x = recurse(hash, key) 
            return [] if !x
        end
        hash.delete(key)
    end
    $sorted
end

def recurse(hash, key, keys={}, vals={})
    keys[key] = true if !hash[key].empty?
    hash[key].each do |course|
        vals[course] = true
        if keys[course]
            return false
        end
        duped_keys = keys.dup
        duped_vals = vals.dup
        x = recurse(hash, course, duped_keys, duped_vals)
        return false if !x
    end
    $sorted.unshift(key) unless $set[key]
    $set[key] = true
    return true
end

p find_order(9, [[3,1], [3,2], [4,2], [5,3], [6,4], [6,5], [7,6], [8,5]])