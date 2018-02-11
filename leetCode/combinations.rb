def combine(n, k)
    recurse((1..n).to_a, k)
end

def recurse(arr, k, current = [])
    if  current.length >= k
        return [current]
    end
    result = []
    arr.each_with_index do |num, idx|
        x = arr.dup[idx+1..-1]
        result += recurse(x, k, current+[num])
    end
    return result
end