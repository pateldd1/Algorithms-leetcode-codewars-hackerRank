def pylons(k, arr)
    index = arr[0...k].rindex(1)
    if !index
        return -1
    end
    i = index + k
    count = 1
    while i < arr.length
        found_one = false
        (i+k-1).downto(i-k+1) do |idx|
            if arr[idx] == 1
                count += 1
                i = idx
                found_one = true
                break
            end
        end
        return -1 if !found_one
        i += k
    end
    count
end