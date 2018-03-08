# needs further optimization
def getWays(n, c)
    return 0 if n == 0
    if n > 0 && c.empty?
        return 0
    end
    c.reject! {|num| num > n || num == 0}
    c.uniq!
    c.sort!
    $count = 0
    $max_level = nil
    recurse(n, c)
    puts $count
end

def recurse(n, c, level=1, total=0, start=0, fin = c.length-1, current=[])
    (start..fin).each do |idx|
        coin = c[idx]
        if total + coin > n
            break
        end
        if total + coin == n
            $count += 1
            break
        end
        recurse(n, c, level+1, total+coin, idx, fin, current+[coin])
    end
end

p getWays(10, [2,3,5,6])